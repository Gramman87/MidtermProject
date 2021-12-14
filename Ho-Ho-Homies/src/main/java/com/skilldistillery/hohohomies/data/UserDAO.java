package com.skilldistillery.hohohomies.data;

import com.skilldistillery.hohohomies.entities.Address;
import com.skilldistillery.hohohomies.entities.User;

public interface UserDAO {

	User findByEmail(String username) throws RuntimeException;

	User registerUser(User user) throws RuntimeException;

	Address registerAddress(Address address) throws RuntimeException;

	User update(User user);
	
	User findByPasswordAndEmailForLogin(String password, String username);

}
