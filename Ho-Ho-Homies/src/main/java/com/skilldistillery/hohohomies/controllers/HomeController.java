package com.skilldistillery.hohohomies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.entities.User;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path= {"/", "home.do"})
	public String home(Model model) {
		//model.addAttribute("DEBUG", userDao.findByUsername("admin@gmail.com"));
		return "home";
	}
	
	@RequestMapping(path="register.do")
	public String registerAccount() {
		return "register";
	}

	@RequestMapping(path="register.do")
	public ModelAndView registerAccount(@ModelAttribute("user") User user) {
		ModelAndView mv = new ModelAndView();
		User newUser = userDao.createUser(user);
		if(newUser != null) {
			mv.addObject("newUser", newUser);
			mv.setViewName("userDashboard");
		}
		
		
		return mv;
	}

}
