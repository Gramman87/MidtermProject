package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(path = { "/", "home.do" })
	public String home(HttpSession session, Model model) {
		// If the session is logged in, redirect to dashboard.
		if (session.getAttribute("user_id") != null) {
			return "redirect:dashboard.do";
		}
		return "home";
	}

}
