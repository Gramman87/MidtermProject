package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

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

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		// model.addAttribute("DEBUG", userDao.findByUsername("admin@gmail.com"));
		return "home";
	}

	@RequestMapping(path = "login.do")
	public String logIn(HttpSession session, String password, String email, Model model) {
		User user = userDAO.findByPasswordAndEmailForLogin(password, email);

		if (user == null) {
			return "emailNotFound";
		}

		// store our user in the session
		session.setAttribute("user", user);

		model.addAttribute("user", user);
		
		return "userDashboard";
	}

//	@RequestMapping(path="logout.do")
//	protected void logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		HttpSession session = request.getSession(false);
//		
//		if(session != null) {
//			session.removeAttribute("user");
//		}
//		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("home.do");
//		dispatcher.forward(request, response);
//	}

	@RequestMapping(path = "register.do")
	public String registerAccount() {
		return "register";
	}

}
