package com.skilldistillery.hohohomies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.entities.Event;

@Controller
public class EventViewController {
	
	@Autowired 
	UserDAO userDao;
	
	@RequestMapping(path="logout.do")
	private String logout() {
		return "home";
	}
	
	@RequestMapping(path="eventView.do")
	private String eventView() {
		return "eventView";
	}
	@RequestMapping(path="getEventData.do", method=RequestMethod.GET)
	private String getEventData(Event event, Model model) {
		model.addAttribute("event", event);
		
		return "eventView";
	}

}
