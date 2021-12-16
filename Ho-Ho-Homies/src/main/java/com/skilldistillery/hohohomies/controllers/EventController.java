package com.skilldistillery.hohohomies.controllers;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
<<<<<<< HEAD
import com.skilldistillery.hohohomies.entities.EventInvite;
=======
import com.skilldistillery.hohohomies.entities.EventComment;
>>>>>>> d4c5915bf6ebb1fb0799ce70fdc3c8b737553ce3
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

	@RequestMapping(path = "/event/view", method = RequestMethod.GET)
	private String getEventData(HttpSession session,
			@RequestParam(name = "id") int eventId, Model model,
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
	public String viewEventCreate() {
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
	
	@RequestMapping(path = "/event/comments")
	public String eventComments(int id, Model model) {
		List<EventComment> comments = commDao.findAllByEventId(id);
		
		model.addAttribute("comments", comments);
		
		return "event_comments";
	}

}
