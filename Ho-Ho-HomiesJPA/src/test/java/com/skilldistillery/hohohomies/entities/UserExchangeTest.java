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

class UserExchangeTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserExchange ex;

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
		UserExchangeId id = new UserExchangeId();
		id.setEventId(1);
		id.setUserId(1);
		ex = em.find(UserExchange.class, id);
	}

	@AfterEach
	void tearDown() throws Exception {
		ex = null;
		em.close();
	}

	@Test
	void test_items_mapping() throws Exception {
		assertNotNull(ex);
		assertNotNull(ex.getItems());
		assertTrue(ex.getItems().size() > 0);
	}

	@Test
	void test_event_mapping() throws Exception {
		assertNotNull(ex);
		assertNotNull(ex.getEvent());
		assertEquals(1, ex.getEvent().getId());
	}

	@Test
	void test_user_mapping() throws Exception {
		assertNotNull(ex);
		assertNotNull(ex.getUser());
		assertEquals(1, ex.getUser().getId());
	}

	@Test
	void test_giftee_mapping() throws Exception {
		assertNotNull(ex);
		assertEquals(2, ex.getGiftee().getId());
		
	}

	@Test
	void test_attending_mapping() throws Exception {
		assertNotNull(ex);
		assertEquals(true, ex.isAttending());
	}

	@Test
	void test_comment_mapping() throws Exception {
		assertNotNull(ex);
		assertEquals("yo yo yo cant wait", ex.getComment());
	}

	@Test
	void test_date_invited_mapping() throws Exception {
		assertNotNull(ex);
		assertNotNull(ex.getDateInvited());
		assertEquals(2021, ex.getDateInvited().getYear());
		assertEquals(12, ex.getDateInvited().getMonthValue());
		assertEquals(1, ex.getDateInvited().getMinute());
		assertEquals(1, ex.getDateInvited().getSecond());
	}
}
