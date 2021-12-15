package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.skilldistillery.hohohomies.data.AddressDAO;
import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.entities.Address;
import com.skilldistillery.hohohomies.entities.User;

final class ProfileEditData extends User {
	private String newPassword;
	private String confirmNewPassword;

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getConfirmNewPassword() {
		return confirmNewPassword;
	}

	public void setConfirmNewPassword(String confirmNewPassword) {
		this.confirmNewPassword = confirmNewPassword;
	}
}

@Controller
public class DashboardController {

	@Autowired
	private UserDAO userDao;

	@Autowired
	private AddressDAO addDao;

	@RequestMapping(path = "dashboard.do")
	public String dashboard(HttpSession session, Model model, @SessionAttribute(name = "user_id") int userId) {
		model.addAttribute("user", userDao.findById(userId));
		return "userDashboard";
	}

	@GetMapping(path = "editProfile.do")
	public String editProfile(int uId, HttpSession session) {
		session.setAttribute("user", userDao.findById(uId));
		return "editProfile";
	}

	@PostMapping(path = "editProfile.do")
	public String editProfile(ProfileEditData data, @SessionAttribute(name = "user_id") int userId, HttpSession session,
			Model model) {
		User user = userDao.findById(userId);

		if (!user	.getPassword()
					.equals(data.getPassword())) {
			model.addAttribute("message", "Incorrect Password");
			return "editProfile";
		}

		if (data.getNewPassword()
				.equals(data.getConfirmNewPassword())) {
			if (data.getNewPassword()
					.length() > 0) {
				user.setPassword(data.getConfirmNewPassword());
			}
		}

		Address address = user.getAddress();

		user.setFirstName(data.getFirstName());
		user.setLastName(data.getLastName());

		address.setCity(data.getAddress()
							.getCity());
		address.setState(data	.getAddress()
								.getState());
		address.setStreet1(data	.getAddress()
								.getStreet1());
		address.setStreet2(data	.getAddress()
								.getStreet2());
		address.setZipcode(data	.getAddress()
								.getZipcode());

		addDao.update(address);
		userDao.update(user);

		return "redirect:dashboard.do";
	}

}
