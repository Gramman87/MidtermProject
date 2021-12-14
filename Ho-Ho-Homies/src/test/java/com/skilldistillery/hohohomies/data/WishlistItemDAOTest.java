package com.skilldistillery.hohohomies.data;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.hohohomies.entities.User;
import com.skilldistillery.hohohomies.entities.WishlistItem;

@SpringBootTest
class WishlistItemDAOTest {
	
	@Autowired
	private WishlistItemDAO itemDao;
	private WishlistItem item;
	private UserDAO userDao;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {
		item = itemDao.findItemById(1);
		user = userDao.findById(1);
	}

	@AfterEach
	void tearDown() throws Exception {
		user = null;
	}
	
	@Test
	void test_find_by_id() {
		assertNotNull(item);
		
		assertEquals(70, item.getCost());
		assertEquals("Tech", item.getName());
	}

	@Test
	void test_find_all_by_user() {
		List<WishlistItem> items = itemDao.findWishlistByUser(user);
		
		assertNotNull(items);
		
		assertTrue(user.getWishlist().size() > 0);
	}

}
