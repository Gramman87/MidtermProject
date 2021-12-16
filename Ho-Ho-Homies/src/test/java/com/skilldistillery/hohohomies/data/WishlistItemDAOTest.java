package com.skilldistillery.hohohomies.data;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.hohohomies.entities.WishlistItem;

@SpringBootTest
class WishlistItemDAOTest {

	@Autowired
	private WishlistItemDAO itemDao;
	private WishlistItem item;

	@BeforeEach
	void setUp() throws Exception {
	}

	@AfterEach
	void tearDown() throws Exception {

	}

	@Test
	void test_find_by_id() {
		item = itemDao.findById(1);

		assertNotNull(item);

		assertEquals(70, item.getCost());
		assertEquals("Tech", item.getName());

		item = null;
	}

	@Test
	void test_find_all_by_user_id() {
		List<WishlistItem> items = itemDao.findAllById(1);

		assertNotNull(items);
		assertTrue(items.size() > 0);

	}

}
