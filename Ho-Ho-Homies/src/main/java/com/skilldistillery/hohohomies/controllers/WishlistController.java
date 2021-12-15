package com.skilldistillery.hohohomies.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

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
	public String wishlistDisplay(HttpSession session, Model model, @SessionAttribute(name = "user_id") int userId) {
		// pass wishlist to view
		model.addAttribute("items", wishlistDAO.findAllById(userId));
		return "wishlist";
	}

	@PostMapping(path = "wishlist.do")
	public String wishlistNew(HttpSession session, WishlistItem item, Model model,
			@SessionAttribute(name = "user_id") int userId) {
		// link item to session user
		item.setUser(userDAO.findById(userId));

		// create new wishlist item
		wishlistDAO.store(item);

		// pass wishlist to view
		model.addAttribute("items", wishlistDAO.findAllById(userId));

		return "wishlist";
	}

	@GetMapping(path = "wishlistRemove.do")
	public String wishlistRemove(HttpSession session, @SessionAttribute(name = "user_id") int userId, int id) {
		WishlistItem item = wishlistDAO.findById(id);
		// Make sure the session user actually owns this wishlist item
		if (item.getUser()
				.getId() == userId) {
			wishlistDAO.delete(item);
		}
		return "redirect:wishlist.do";
	}

}
