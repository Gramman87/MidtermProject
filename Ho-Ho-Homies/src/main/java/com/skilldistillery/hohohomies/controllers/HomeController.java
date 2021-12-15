package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.entities.User;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String home(HttpSession session, Model model) {
		Object userId = session.getAttribute("user_id");
		if(userId != null) {
			return "redirect:dashboard.do";
		}
		return "home";
	}

	@RequestMapping(path = "login.do")
	public String logIn(HttpSession session, String password, String email) {
		User user = userDAO.findByPasswordAndEmailForLogin(password, email);
		if (user == null) {
			return "emailNotFound";
		}

		// store our user in the session
		session.setAttribute("user_id", user.getId());
		return "redirect:dashboard.do";
	}


	@RequestMapping(path= "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		
		return "redirect:home.do";
	}

}
