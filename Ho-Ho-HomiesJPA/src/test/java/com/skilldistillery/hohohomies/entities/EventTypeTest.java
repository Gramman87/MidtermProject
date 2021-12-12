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

class EventTypeTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventType type;

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
		type = em.find(EventType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		type = null;
		em.close();
	}

	@Test
	void test_name_mapping() throws Exception {
		assertNotNull(type);
		assertEquals("Secret Santa Test", type.getName());
	}

	@Test
	void test_description_mapping() throws Exception {
		assertNotNull(type);
		assertEquals("Mic check 123", type.getDescription());
	}

	@Test
	void test_image_url_mapping() throws Exception {
		assertNotNull(type);
		assertEquals("https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg",
				type.getImageURL());

		
//		throw new Exception("unimplemented"); // TODO: provide actual data to test other than NULL
	}

	@Test
	void test_event_mapping() throws Exception {
		assertNotNull(type);
		assertNotNull(type.getEvents());
		assertTrue(type.getEvents().size() > 0);
	}

}
