package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.hohohomies.data.AddressDAO;
import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.entities.User;

@Controller
public class RegisterController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private AddressDAO addressDAO;

	@GetMapping(path = "register.do")
	public String register() {
		return "register";
	}

	@PostMapping(path = "register.do")
	public String register(User user, HttpSession session, RedirectAttributes redir) {
		boolean success = false;
		String message = "Unspecified Error";

		if (userDAO.findByEmail(user.getEmail()) == null) {
			addressDAO.store(user.getAddress());
			userDAO.register(user);
			success = true;
		} else {
			message = "Username already exists.";
		}

		if (success) {
			session.setAttribute("user_id", user.getId());
			return "redirect:dashboard.do";
		}

		redir.addFlashAttribute("message", message);

		return "redirect:register.do";
	}

}
