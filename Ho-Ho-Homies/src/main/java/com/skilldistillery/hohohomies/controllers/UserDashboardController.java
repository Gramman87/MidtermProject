package com.skilldistillery.hohohomies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.hohohomies.data.UserDAO;

@Controller
public class UserDashboardController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path="userDashboard.do")
	public String userDashboard() {
		return "userDashboard";
	}

}
