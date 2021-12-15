package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.skilldistillery.hohohomies.data.EventDAO;
import com.skilldistillery.hohohomies.data.EventTypeDAO;
import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.data.UserExchangeDAO;
import com.skilldistillery.hohohomies.entities.Event;
import com.skilldistillery.hohohomies.entities.UserExchange;
import com.skilldistillery.hohohomies.entities.UserExchangeId;

final class EventData extends Event {
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
	private EventTypeDAO eventTypeDAO;

	@RequestMapping(path = "eventView.do")
	private String eventView() {
		return "eventView";
	}

	@RequestMapping(path = "getEventData.do", method = RequestMethod.GET)
	private String getEventData(HttpSession session, int eId, Model model,
			@SessionAttribute(name = "user_id") int userId) {
		Event event = eventDao.findEventFromEventId(eId);

		if (event == null) {
			return "redirect:dashboard.do";
		}

		UserExchange ue = ueDao.findById(new UserExchangeId(eId, userId));

		model.addAttribute("event", event);
		model.addAttribute("exchange", ue);

		return "eventView";
	}

	@GetMapping(path = "createEvent.do")
	public String createGet() {
		return "createEvent";
	}

	@PostMapping(path = "createEvent.do")
	public String createPost(EventData data) {
		return "createEvent";
	}

}
