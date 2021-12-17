package com.skilldistillery.hohohomies.controllers;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.comparator.Comparators;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.skilldistillery.hohohomies.data.AddressDAO;
import com.skilldistillery.hohohomies.data.EventCommentDAO;
import com.skilldistillery.hohohomies.data.EventDAO;
import com.skilldistillery.hohohomies.data.EventInviteDAO;
import com.skilldistillery.hohohomies.data.EventTypeDAO;
import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.data.UserExchangeDAO;
import com.skilldistillery.hohohomies.entities.Event;
import com.skilldistillery.hohohomies.entities.EventComment;
import com.skilldistillery.hohohomies.entities.EventInvite;
import com.skilldistillery.hohohomies.entities.User;
import com.skilldistillery.hohohomies.entities.UserExchange;
import com.skilldistillery.hohohomies.entities.UserExchangeId;

final class CreateEventData {
	private String[] invites;

	public String[] getInvites() {
		return invites;
	}

	public void setInvites(String[] invites) {
		this.invites = invites;
	}
}

@Controller
public class EventController {

	@Autowired
	private UserDAO userDao;

	@Autowired
	private EventDAO eventDao;

	@Autowired
	UserExchangeDAO exchangeDao;

	@Autowired
	private EventCommentDAO commDao;

	@Autowired
	EventTypeDAO eventTypeDao;

	@Autowired
	AddressDAO addressDao;

	@Autowired
	EventInviteDAO inviteDao;

	@GetMapping(path = "/event/view")
	private String getEventData(HttpSession session, @RequestParam(name = "id") int eventId, Model model,
			@SessionAttribute(name = "user_id") int userId) {
		Event event = eventDao.findById(eventId);

		if (event == null) {
			return "redirect:/dashboard";
		}

		UserExchange ue = exchangeDao.findById(
				new UserExchangeId(eventId, userId));

		model.addAttribute("event", event);
		model.addAttribute("exchange", ue);

		return "event_view";
	}

	@GetMapping(path = "/event/create")
	public String viewEventCreate(
			@SessionAttribute(name = "user_id") int ownerId, Model model) {
		User owner = userDao.findById(ownerId);

		// pass our email into the jsp so we can be lazy and include ourselves
		// in the invites
		model.addAttribute("owner_email", owner.getEmail());

		return "event_create";
	}

	@PostMapping(path = "/event/create")
	public String postEventcreate(
			@SessionAttribute(name = "user_id") int ownerId, Event event,
			CreateEventData data) {
		User owner = userDao.findById(ownerId);

		event.setCreateDate(LocalDateTime.now());
		event.setOwner(owner);

		eventTypeDao.store(event.getType());
		addressDao.store(event.getAddress());
		eventDao.store(event);

		for (String email : data.getInvites()) {
			User user = userDao.findByEmail(email);

			// Non-existent users get added to the table of invites, and no
			// UserExchange is made for them until they register.
			if (user == null) {
				EventInvite invite = new EventInvite();
				invite.setEvent(event);
				invite.setEmail(email);
				inviteDao.store(invite);
				continue;
			}

			// create a user exchange for this event
			UserExchange exchange = new UserExchange();
			exchange.setId(new UserExchangeId(event.getId(), user.getId()));
			exchange.setUser(user);
			exchange.setEvent(event);
			exchange.setDateInvited(LocalDateTime.now());
			exchangeDao.store(exchange);
		}

		return "redirect:/event/view?id=" + event.getId();
	}

	@GetMapping(path = "/event/comments")
	public String eventComments(int id, Model model) {
		List<EventComment> comments = commDao.findAllByEventId(id);

		model.addAttribute("event_id", id);
		model.addAttribute("comments", comments);

		return "event_comments";
	}
	@PostMapping(path = "/event/comments")
	public String addEventComments(HttpSession session, EventComment data, @RequestParam(name="event_id") int eventId, @SessionAttribute(name = "user_id") int userId) {
				
		UserExchange exchange = exchangeDao.findById(new UserExchangeId(eventId, userId));
		EventComment comment = new EventComment();
		comment.setContent(data.getContent());
		comment.setExchange(exchange);
		comment.setPostedOn(LocalDateTime.now());
		commDao.store(comment);
		
		return "redirect:/event/comments?id=" + eventId;
	}
	
	@GetMapping(path="/event/randomize")
	public String randomize(int id) {
		Event event = eventDao.findById(id);
		
		List<UserExchange> giftees = new ArrayList<>(event.getExchanges());
		
		// pre-randomize
		Collections.shuffle(giftees);
		
		// give every gifter a giftee
		for (UserExchange gifter : event.getExchanges()) {
			gifter.setGiftee(giftees.get(0).getUser());
			
			exchangeDao.update(gifter);
			
			giftees.remove(0);
		}

		
		return "redirect:/event/view?id=" + id;
		
	}
}