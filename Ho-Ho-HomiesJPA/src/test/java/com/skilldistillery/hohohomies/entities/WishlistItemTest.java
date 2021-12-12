package com.skilldistillery.hohohomies.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class WishlistItemTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private WishlistItem item;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("Ho-Ho-HomiesJPA");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		item = em.find(WishlistItem.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		item = null;
		em.close();
	}

	@Test
	void test_name_mapping() throws Exception {
		assertNotNull(item);
		assertEquals("Tech", item.getName());
	}

	@Test
	void test_cost_mapping() throws Exception {
		assertNotNull(item);
		assertEquals(70.0, item.getCost());
	}

	@Test
	void test_user_mapping() throws Exception {
		assertNotNull(item);
		assertNotNull(item.getUser());
		assertEquals(1, item.getUser().getId());
	}

	@Test
	void test_shopping_url_mapping() throws Exception {
		assertNotNull(item);
		assertEquals("https://m.media-amazon.com/images/I/61MPy3uLBNL._AC_UL1400_.jpg", item.getShoppingURL());
	}

	@Test
	void test_description_mapping() throws Exception {
		assertNotNull(item);
		assertEquals("Techy tech", item.getDescription());
	}

}
