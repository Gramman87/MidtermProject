package com.skilldistillery.hohohomies.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.hohohomies.data.UserDAO;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDao;

}
