package com.skilldistillery.hohohomies.data;

import com.skilldistillery.hohohomies.entities.User;

public interface UserDAO {
	
	public User findByUsername(String username);
	
	public User createUser(User user);

}
