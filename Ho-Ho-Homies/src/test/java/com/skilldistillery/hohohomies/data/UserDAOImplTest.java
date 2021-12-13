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
class UserDAOImplTest {

	@Autowired
	UserDAO userDao;
	User user;

	@BeforeEach
	void setUp() throws Exception {
		user = userDao.findByEmail("admin@gmail.com");
	}

	@AfterEach
	void tearDown() throws Exception {
		user = null;
	}

	@Test
	void test_userDao() throws Exception {
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

	}

}
