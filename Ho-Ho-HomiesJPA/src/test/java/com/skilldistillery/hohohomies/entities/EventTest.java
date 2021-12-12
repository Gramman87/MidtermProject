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

class EventTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Event event;

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
		event = em.find(Event.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		event = null;
		em.close();
	}

//	@Test
//	void test_comments_mapping() throws Exception {
//		assertNotNull(event);
//		assertNotNull(event.getComments());
//		assertTrue(event.getComments().size() > 0);
//	}

	@Test
	void test_exchange_mapping() throws Exception {
		assertNotNull(event);
		assertNotNull(event.getExchanges());
		assertTrue(event.getExchanges().size() > 0);
	}

	@Test
	void test_custom_rules_mapping() throws Exception {
		assertNotNull(event);
		assertEquals("Take a drink everytime politics are mentioned", event.getCustomRules());
	}

	@Test
	void test_address_mapping() throws Exception {
		assertNotNull(event);
		assertNotNull(event.getAddress());
		assertEquals(1, event.getAddress().getId());
	}

	@Test
	void test_datetime_start_mapping() throws Exception {
		assertNotNull(event);
		assertNotNull(event.getDate());
		assertEquals(2021, event.getDate().getYear());
		assertEquals(12, event.getDate().getMonthValue());
		assertEquals(12, event.getDate().getDayOfMonth());
	}

	@Test
	void test_price_mapping() throws Exception {
		assertNotNull(event);
		assertEquals(25, event.getPriceMin());
		assertEquals(75, event.getPriceMax());
	}

	@Test
	void test_owner_mapping() throws Exception {
		assertNotNull(event);
		assertNotNull(event.getOwner());
		assertEquals(1, event.getOwner().getId());
	}

	@Test
	void test_complete_mapping() throws Exception {
		assertNotNull(event);
		assertEquals(false, event.isComplete());
	}

	@Test
	void test_type_mapping() throws Exception {
		assertNotNull(event);
		assertNotNull(event.getType());
		assertEquals(1, event.getType().getId());
	}

	@Test
	void test_title_mapping() throws Exception {
		assertNotNull(event);
		assertEquals("Secret Santa Test", event.getTitle());
	}

	@Test
	void test_image_url_mapping() throws Exception {
		assertNotNull(event);
		assertNotNull(event.getImageURL());
		assertEquals("https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg", 
				event.getImageURL());

		
//		throw new Exception("unimplemented"); // TODO: provide actual data to test other than NULL
	}

	@Test
	void test_last_update_mapping() throws Exception {
		assertNotNull(event);
		assertNotNull(event.getLastUpdate());
		assertEquals(2021, event.getLastUpdate().getYear());
		assertEquals(12, event.getLastUpdate().getMonthValue());
		assertEquals(11, event.getLastUpdate().getDayOfMonth());
		
//		throw new Exception("unimplemented"); // TODO: provide actual data to test other than NULL
	}

	@Test
	void test_rsvp_by_mapping() throws Exception {
		assertNotNull(event);
		assertNotNull(event.getRsvpBy());
		assertEquals(2021, event.getRsvpBy().getYear());
		assertEquals(12, event.getRsvpBy().getMonthValue());
		assertEquals(20, event.getRsvpBy().getDayOfMonth());
		
//		throw new Exception("unimplemented"); // TODO: provide actual data to test other than NULL
	}

	@Test
	void test_time_mapping() throws Exception {
		assertNotNull(event);
		assertNotNull(event.getTime());
		assertEquals(12, event.getTime().getHour());
		assertEquals(0, event.getTime().getMinute());
		assertEquals(0, event.getTime().getSecond());
		
//		throw new Exception("unimplemented"); // TODO: provide actual data to test other than NULL
	}

	@Test
	void test_create_date_mapping() throws Exception {
		assertNotNull(event);
		assertNotNull(event.getCreateDate());
		assertEquals(2021, event.getCreateDate().getYear());
		assertEquals(12, event.getCreateDate().getMonthValue());
		assertEquals(01, event.getCreateDate().getDayOfMonth());
		
//		throw new Exception("unimplemented"); // TODO: provide actual data to test other than NULL
	}

}
