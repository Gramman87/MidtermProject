package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.entities.User;

@Controller
public class LoginController {

	@Autowired
	private UserDAO userDAO;

	@PostMapping(path = "/login")
	public String login(HttpSession session, String password, String email,
			RedirectAttributes redir) {
		User user = userDAO.findByEmailAndPassword(email, password);

		if (user == null) {
			redir.addFlashAttribute("message", "Invalid email or password.");
			return "redirect:/";
		}

		// store our user in the session
		session.setAttribute("user_id", user.getId());
		return "redirect:/dashboard";
	}

	@RequestMapping(path = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		return "redirect:/";
	}

}
