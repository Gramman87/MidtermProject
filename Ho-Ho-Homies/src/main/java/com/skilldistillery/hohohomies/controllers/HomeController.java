package com.skilldistillery.hohohomies.controllers;

import java.util.List;

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
	
	@RequestMapping(path= {"/", "home.do"})
	public String home(Model model) {
		//model.addAttribute("DEBUG", userDao.findByUsername("admin@gmail.com"));
		return "home";
	}
	
	@RequestMapping(path="login.do")
	public String logIn(String password, String email, Model model) {
		User user = userDAO.findByPasswordAndEmailForLogin(password, email);
		
		if(user == null) {
			return "emailNotFound";
		}
			
		model.addAttribute("user", user);
		return "userDashboard";
	}
	
	@RequestMapping(path="register.do")
	public String registerAccount() {
		return "register";
	}
	
	



}
