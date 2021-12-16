package com.skilldistillery.hohohomies.controllers;

import java.util.List;
import java.time.LocalDateTime;

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

import com.skilldistillery.hohohomies.data.EventCommentDAO;
import com.skilldistillery.hohohomies.data.EventDAO;
import com.skilldistillery.hohohomies.data.EventTypeDAO;
import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.data.UserExchangeDAO;
import com.skilldistillery.hohohomies.entities.Event;
import com.skilldistillery.hohohomies.entities.EventComment;
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
	private UserExchangeDAO ueDao;
	
	@Autowired
	private EventCommentDAO commDao;

	@Autowired
	private EventTypeDAO eventTypeDAO;

	@RequestMapping(path = "/event/view", method = RequestMethod.GET)
	private String getEventData(HttpSession session,
			@RequestParam(name = "id") int eventId, Model model,
			@SessionAttribute(name = "user_id") int userId) {
		Event event = eventDao.findById(eventId);

		if (event == null) {
			return "redirect:/dashboard";
		}

		UserExchange ue = ueDao.findById(new UserExchangeId(eventId, userId));

		model.addAttribute("event", event);
		model.addAttribute("exchange", ue);

		return "event_view";
	}

	@GetMapping(path = "/event/create")
	public String viewEventCreate() {
		return "event_create";
	}

	@PostMapping(path = "/event/create")
	public String postEventcreate(Event event, CreateEventData data) {
		eventDao.store(event);

		for (String email : data.getInvites()) {
			User user = userDao.findByEmail(email);

			if (user == null) {
				// TODO: pending invites with no users....
				continue;
			}

			// create a user exchange for this event
			UserExchange exchange = new UserExchange();
			exchange.setUser(user);
			exchange.setEvent(event);
			exchange.setDateInvited(LocalDateTime.now());
			ueDao.store(exchange);
		}

		return "event_create";
	}
	
	@RequestMapping(path = "/event/comments")
	public String eventComments(int id, Model model) {
		List<EventComment> comments = commDao.findAllByEventId(id);
		
		model.addAttribute("comments", comments);
		
		return "event_comments";
	}

}
