package com.skilldistillery.hohohomies.controllers;

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

import com.skilldistillery.hohohomies.data.AddressDAO;
import com.skilldistillery.hohohomies.data.EventDAO;
import com.skilldistillery.hohohomies.data.EventTypeDAO;
import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.data.UserExchangeDAO;
import com.skilldistillery.hohohomies.entities.Event;
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
	UserDAO userDao;

	@Autowired
	EventDAO eventDao;

	@Autowired
	UserExchangeDAO ueDao;

	@Autowired
	EventTypeDAO eventTypeDao;

	@Autowired
	AddressDAO addressDao;

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

			if (user == null) {
				// TODO: pending invites with no users....
				continue;
			}

			// create a user exchange for this event
			UserExchange exchange = new UserExchange();
			exchange.setId(new UserExchangeId(event.getId(), user.getId()));
			exchange.setUser(user);
			exchange.setEvent(event);
			exchange.setDateInvited(LocalDateTime.now());
			ueDao.store(exchange);
		}

		return "redirect:/event/view?id=" + event.getId();
	}

}
