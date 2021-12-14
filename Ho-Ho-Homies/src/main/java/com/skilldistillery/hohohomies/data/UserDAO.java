package com.skilldistillery.hohohomies.data;

import com.skilldistillery.hohohomies.entities.User;

public interface UserDAO {
	User findById(int id);

	User findByEmail(String username) throws RuntimeException;

	User register(User user) throws RuntimeException;

	User update(User user);

}
