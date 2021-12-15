package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skilldistillery.hohohomies.data.UserDAO;
import com.skilldistillery.hohohomies.data.WishlistItemDAO;
import com.skilldistillery.hohohomies.entities.WishlistItem;

@Controller
public class WishlistController {

	@Autowired
	private WishlistItemDAO wishlistDAO;

	@Autowired
	private UserDAO userDAO;

	@GetMapping(path = "wishlist.do")
	public String wishlistDisplay(HttpSession session, Model model) {
		Object o = session.getAttribute("user_id");

		if (o != null) {
			model.addAttribute("items", wishlistDAO.findWishlistByUserId((int) o));
		}

		return "wishlist";
	}

	@PostMapping(path = "wishlist.do")
	public String wishlistNew(HttpSession session, WishlistItem item, Model model) {
		Object o = session.getAttribute("user_id");

		if (o != null) {
			int userId = (int) o;

			item.setUser(userDAO.findById(userId));
			wishlistDAO.store(item);

			model.addAttribute("items", wishlistDAO.findWishlistByUserId(userId));
		}

		return "wishlist";
	}

}
