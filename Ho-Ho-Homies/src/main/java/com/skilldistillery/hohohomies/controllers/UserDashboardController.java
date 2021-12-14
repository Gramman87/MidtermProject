package com.skilldistillery.hohohomies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.entities.User;

@Controller
public class UserDashboardController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path="userDashboard.do")
	public String userDashboard(User user, Model model) {
		
		model.addAttribute(user);
		
		return "wishlist";
	}
	


}
