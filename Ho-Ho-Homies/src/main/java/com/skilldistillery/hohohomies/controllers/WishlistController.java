package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.skilldistillery.hohohomies.data.WishlistItemDAO;
import com.skilldistillery.hohohomies.entities.User;
import com.skilldistillery.hohohomies.entities.WishlistItem;

@Controller
public class WishlistController {

	@Autowired
	private WishlistItemDAO wishlistDAO;

	@GetMapping(path = "wishlist.do")
	public String wishlistDisplay(HttpSession session, Model model) {
		Object user = session.getAttribute("user");

		if (user == null) {
			// TODO: show error page
			return "wishlist";
		}

		model.addAttribute("items", wishlistDAO.findWishlistByUserId(((User) user).getId()));

		return "wishlist";
	}

	@PostMapping(path = "wishlist.do")
	public String wishlistNew(HttpSession session, WishlistItem item, Model model) {
		Object user = session.getAttribute("user");

		if (user == null) {
			// TODO: show error page
			return "wishlist";
		}

		item.setUser((User) user);
		wishlistDAO.store(item);

		model.addAttribute("items", wishlistDAO.findWishlistByUserId(((User) user).getId()));

		return "wishlist";
	}

}
