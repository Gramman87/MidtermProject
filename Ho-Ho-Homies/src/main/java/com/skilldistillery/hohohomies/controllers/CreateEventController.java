package com.skilldistillery.hohohomies.controllers;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skilldistillery.hohohomies.data.EventDAO;
import com.skilldistillery.hohohomies.data.EventTypeDAO;
import com.skilldistillery.hohohomies.entities.Event;

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
public class CreateEventController {

	@Autowired
	private EventDAO eventDAO;

	@Autowired
	private EventTypeDAO eventTypeDAO;

	@GetMapping(path = "/createEvent.do")
	public String createGet() {
		return "createEvent";
	}

	@PostMapping(path = "/createEvent.do")
	public String createPost(EventData data) {
		System.out.println(data);
		System.out.println(Arrays.toString(data.getInvites()));
		return "createEvent";
	}

}
