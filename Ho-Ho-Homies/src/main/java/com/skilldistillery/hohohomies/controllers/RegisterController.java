package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.hohohomies.data.AddressDAO;
import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.entities.User;

@Controller
public class RegisterController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private AddressDAO addressDAO;
	
	@RequestMapping(path="registerNew.do")
	public String registerAccount(User user, HttpSession session, Model model) {
		userDAO.registerUser(user);
		
		if(user != null) {
			session.setAttribute("user_id", user.getId());
			return "userDashboard";
		}

		
		return "registerNew.do";
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
