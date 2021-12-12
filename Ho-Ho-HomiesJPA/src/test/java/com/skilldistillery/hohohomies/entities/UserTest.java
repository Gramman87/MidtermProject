package com.skilldistillery.hohohomies.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_email_mapping() {
		assertNotNull(user);
		assertEquals("admin@gmail.com", user.getEmail());
	}

	@Test
	void test_name_mapping() throws Exception {
		assertNotNull(user);
		assertEquals("Santa", user.getFirstName());
		assertEquals("Clause", user.getLastName());
	}

	@Test
	void test_password_mapping() throws Exception {
		assertNotNull(user);
		assertEquals("admin", user.getPassword());
	}

	@Test
	void test_role_mapping() throws Exception {
		assertNotNull(user);
		assertEquals("Gifter", user.getRole());
	}

	@Test
	void test_address_mapping() throws Exception {
		assertNotNull(user);
		assertNotNull(user.getAddress());
		assertEquals(1, user.getAddress().getId());
	}

	@Test
	void test_enabled_mapping() throws Exception {
		assertNotNull(user);
		assertEquals(true, user.isEnabled());
	}

	@Test
	void test_profile_img_url_mapping() throws Exception {
		throw new Exception("unimplemented"); // TODO: provide actual data to test other than NULL
	}

	@Test
	void test_wishlist_mapping() throws Exception {
		assertNotNull(user);
		assertNotNull(user.getWishlist());
		assertTrue(user.getWishlist().size() > 0);
	}

	@Test
	void test_exchange_mapping() throws Exception {
		assertNotNull(user);
		assertNotNull(user.getExchanges());
		assertTrue(user.getExchanges().size() > 0);
	}
}
