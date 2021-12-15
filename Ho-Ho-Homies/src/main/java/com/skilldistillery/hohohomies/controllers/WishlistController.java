package com.skilldistillery.hohohomies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.hohohomies.data.WishlistItemDAO;
import com.skilldistillery.hohohomies.entities.User;

@Controller
public class WishlistController {
	
	@Autowired
	private WishlistItemDAO listDao;
	
	@RequestMapping(path = "wishlist.do")
	public String wishlistDisplay(@ModelAttribute("user") User user, Model model) {
		
		model.addAttribute("items", listDao.findWishlistByUserId(user.getId()));
		
		return "wishlist";
	}

}
