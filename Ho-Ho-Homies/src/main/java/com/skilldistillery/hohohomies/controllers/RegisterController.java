package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.hohohomies.data.AddressDAO;
import com.skilldistillery.hohohomies.data.EventInviteDAO;
import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.entities.User;

final class RegisterData {
	private String confirmPassword;
	private String confirmEmail;

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getConfirmEmail() {
		return confirmEmail;
	}

	public void setConfirmEmail(String confirmEmail) {
		this.confirmEmail = confirmEmail;
	}
}

@Controller
public class RegisterController {
	@Autowired
	private UserDAO userDAO;

	@Autowired
	private AddressDAO addressDAO;

	@Autowired
	private EventInviteDAO inviteDAO;

	@GetMapping(path = "/register")
	public String register() {
		return "register";
	}

	@PostMapping(path = "/register")
	public String register(User user, RegisterData data, HttpSession session,
			RedirectAttributes redir) {
		if (!data.getConfirmEmail().equals(user.getEmail())) {
			redir.addFlashAttribute("message", "Your emails did not match.");
			return "redirect:/register";
		}
		if (!data.getConfirmPassword().equals(user.getPassword())) {
			redir.addFlashAttribute("message", "Your passwords did not match.");
			return "redirect:/register";
		}
		if (userDAO.findByEmail(user.getEmail()) != null) {
			redir.addFlashAttribute("message", "Username already exists.");
			return "redirect:/register";
		}

		addressDAO.store(user.getAddress());
		userDAO.register(user);

		// TODO: Check invites for this users email and notify them to join the
		// exchanges

		session.setAttribute("user_id", user.getId());
		return "redirect:/dashboard";
	}
}
