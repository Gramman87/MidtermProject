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

class EventItemTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventItem item;

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
		item = em.find(EventItem.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		item = null;
		em.close();
	}

	@Test
	void test_comment_mapping() throws Exception {
		assertNotNull(item);
		assertNotNull(item.getComments());
		assertTrue(item.getComments().size() > 0);

		assertEquals("Wow, this is the best gift for sure",
				item.getComments().get(0).getContent());

	}

	@Test
	void text_comment_temporal_mapping() throws Exception {
		assertEquals(2021, item.getComments().get(0).getPostedOn().getYear());
		assertEquals(12,
				item.getComments().get(0).getPostedOn().getMonthValue());
		assertEquals(1, item.getComments().get(0).getPostedOn().getMinute());
		assertEquals(1, item.getComments().get(0).getPostedOn().getSecond());
	}

	@Test
	void test_exchange_mapping() throws Exception {
		assertNotNull(item);
		assertNotNull(item.getExchange());
		assertEquals(1, item.getExchange().getId().getUserId());
		assertEquals(1, item.getExchange().getId().getEventId());
	}

	@Test
	void test_title_mapping() throws Exception {
		assertNotNull(item);
		assertEquals("Best Gift", item.getTitle());
	}

	@Test
	void test_description_mapping() throws Exception {
		assertNotNull(item);
		assertEquals("The bestest gift you could ask for",
				item.getDescription());
	}

	@Test
	void test_url_mapping() throws Exception {
		assertNotNull(item);
		assertEquals("https://memegenerator.net/img/instances/80456411.jpg",
				item.getUrl());
	}

	@Test
	void test_visible_mapping() throws Exception {
		assertNotNull(item);
		assertEquals(true, item.isVisible());
	}
}
