package com.skilldistillery.hohohomies.data;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.hohohomies.entities.User;

@SpringBootTest
class UserDAOTest {

	@Autowired
	private UserDAO userDao;
	private User user;

	@BeforeEach
	void setUp() throws Exception {
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void test_userDao() throws Exception {
		user = userDao.findByEmail("admin@gmail.com");
		assertNotNull(user);

		user.setFirstName("Kris");
		user.setLastName("Kringle");

		userDao.update(user);

		user = userDao.findByEmail("admin@gmail.com");

		assertEquals("Kris", user.getFirstName());
		assertEquals("Kringle", user.getLastName());

		user.setFirstName("Santa");
		user.setLastName("Clause");

		userDao.update(user);
		user = null;

	}
	
	@Test
	void test_find_by_id() throws Exception {
		user = userDao.findById(1);
		
		assertNotNull(user);
		assertEquals("admin@gmail.com", user.getEmail());
		assertEquals("Santa", user.getFirstName());
		assertEquals("Clause", user.getLastName());
		
		
		user = null;
		
	}

}
