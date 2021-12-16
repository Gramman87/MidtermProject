package com.skilldistillery.hohohomies.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class EventInviteTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventInvite invite;

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
		invite = em.find(EventInvite.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		invite = null;
		em.close();
	}

	@Test
	void test_email_mapping() throws Exception {
		assertNotNull(invite);
		assertEquals("jk@gmail.com", invite.getEmail());
	}

	@Test
	void test_event_mapping() throws Exception {
		assertNotNull(invite);
		assertNotNull(invite.getEvent());
		assertEquals(1, invite.getEvent().getId());
	}
}
