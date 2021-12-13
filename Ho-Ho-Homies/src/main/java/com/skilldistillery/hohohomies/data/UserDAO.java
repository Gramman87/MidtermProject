package com.skilldistillery.hohohomies.data;

import com.skilldistillery.hohohomies.entities.User;

public interface UserDAO {
	
	User findByUsername(String username) throws RuntimeException;
	
	User updateUser(User user);
	
	User registerUser(User user) throws RuntimeException;
	
}
