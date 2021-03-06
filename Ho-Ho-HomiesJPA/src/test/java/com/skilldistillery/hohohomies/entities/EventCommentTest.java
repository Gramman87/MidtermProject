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

class EventCommentTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventComment com;

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
		com = em.find(EventComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		com = null;
		em.close();
	}

	@Test
	void test_text_mapping() throws Exception {
		assertNotNull(com);
		assertEquals("This will be THE event of the year", com.getContent());
	}

	@Test
	void test_when_mapping() throws Exception {
		assertNotNull(com);
		assertNotNull(com.getPostedOn());
		assertEquals(2021, com.getPostedOn().getYear());
		assertEquals(12, com.getPostedOn().getMonthValue());
		assertEquals(1, com.getPostedOn().getMinute());
		assertEquals(1, com.getPostedOn().getSecond());
	}

	@Test
	void test_reply_to_mapping() throws Exception {
		assertNotNull(com);
		assertNotNull(com.getReplyTo());
		assertEquals(1, com.getReplyTo().getId()); //Added by Jack
	}

	@Test
	void test_exchange_mapping() throws Exception {
		assertNotNull(com);
		assertNotNull(com.getExchange());
		assertEquals(1, com.getExchange().getId().getUserId());
		assertEquals(1, com.getExchange().getId().getEventId());
	}

}
