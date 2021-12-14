package com.skilldistillery.hohohomies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.hohohomies.data.WishlistItemDAO;
import com.skilldistillery.hohohomies.entities.User;

@Controller
public class WishlistController {
	
	@Autowired
	private WishlistItemDAO listDao;
	
	@RequestMapping(path = "wishlist.do", method = RequestMethod.POST)
	public String wishlistDisplay(User user, Model model) {
		
		model.addAllAttributes(listDao.findWishlistByUser(user));
		
		return "wishlist";
	}

}
