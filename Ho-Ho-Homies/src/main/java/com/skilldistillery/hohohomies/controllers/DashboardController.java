package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.skilldistillery.hohohomies.data.UserDAO;

@Controller
public class DashboardController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "/dashboard")
	public String dashboard(HttpSession session, Model model,
			@SessionAttribute(name = "user_id") int userId) {
		model.addAttribute("user", userDao.findById(userId));
		return "dashboard";
	}

}
