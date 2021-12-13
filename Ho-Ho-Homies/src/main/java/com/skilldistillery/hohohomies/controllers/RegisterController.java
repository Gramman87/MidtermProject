package com.skilldistillery.hohohomies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.entities.User;

@Controller
public class RegisterController {
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path="registerNew.do")
	public ModelAndView registerAccount(@ModelAttribute("user") User user) {
		ModelAndView mv = new ModelAndView();
		User newUser = userDAO.createUser(user);
		

		if(newUser != null) {
			mv.addObject("newUser", newUser);
			mv.setViewName("userDashboard");
		}
		
		
		return mv;
	}

	
	//reference about checking emails
//	public static boolean isValidEmailAddress(String email) {
//		   boolean result = true;
//		   try {
//		      InternetAddress emailAddr = new InternetAddress(email);
//		      emailAddr.validate();
//		   } catch (AddressException ex) {
//		      result = false;
//		   }
//		   return result;
//		}
}
