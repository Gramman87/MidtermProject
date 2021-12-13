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

class ItemCommentTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ItemComment com;

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
		com = em.find(ItemComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		com = null;
		em.close();
	}

	@Test
	void test_text_mapping() throws Exception {
		assertNotNull(com);
		assertEquals("Wow, this is the best gift for sure", com.getContent());
	}

	@Test
	void test_when_mapping() throws Exception {
		assertNotNull(com);
		assertEquals(2021, com.getPostedOn().getYear());
		assertEquals(12, com.getPostedOn().getMonthValue());
		assertEquals(1, com.getPostedOn().getMinute());
		assertEquals(1, com.getPostedOn().getSecond());
	}

	@Test
	void test_user_mapping() throws Exception {
		assertNotNull(com);
		assertNotNull(com.getUser());
		assertEquals(1, com.getUser().getId());
	}

	@Test
	void test_item_mapping() throws Exception {
		assertNotNull(com);
		assertNotNull(com.getItem());
		assertEquals(1, com.getItem().getId());
	}

	@Test
	void test_image_url_mapping() throws Exception {
		assertNotNull(com);
		assertNotNull(com.getImageURL());
		assertEquals("https://upload.wikimedia.org/wikipedia/commons/4/49/Jonathan_G_Meath_portrays_Santa_Claus.jpg",
				com.getImageURL());


		
//		throw new Exception("unimplemented");
	}
}
