package com.skilldistillery.hohohomies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.skilldistillery.hohohomies.data.UserDAO;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path= {"/", "home.do"})
	public String home(Model model) {
		//model.addAttribute("DEBUG", userDao.findByUsername("admin@gmail.com"));
		return "home";
	}
	
	@RequestMapping(path="register.do")
	public String registerAccount() {
		return "register";
	}



}
