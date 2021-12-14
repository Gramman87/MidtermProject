package com.skilldistillery.hohohomies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.hohohomies.data.EventDAO;
import com.skilldistillery.hohohomies.data.EventTypeDAO;
import com.skilldistillery.hohohomies.entities.Event;

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
	public String createPost(Event event, @RequestParam(name = "invites[]") String[] invites) {
		System.out.println(event);
		for (String invite : invites) {
			System.out.println(invite);
		}
		return "createEvent";
	}

}
