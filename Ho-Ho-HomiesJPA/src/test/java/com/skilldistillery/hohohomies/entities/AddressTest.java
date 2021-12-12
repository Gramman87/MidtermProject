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

class AddressTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Address address;

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
		address = em.find(Address.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		address = null;
		em.close();
	}

	@Test
	void test_street_mapping() throws Exception {
		assertNotNull(address);
		assertEquals("123 SomeWhere St.", address.getStreet1());
		assertEquals(null, address.getStreet2()); // TODO: provide actual data to test other than NULL
	}

	@Test
	void test_city_mapping() throws Exception {
		assertNotNull(address);
		assertEquals("Out There", address.getCity());
	}

	@Test
	void test_state_mapping() throws Exception {
		assertNotNull(address);
		assertEquals("CO", address.getState());
	}

	@Test
	void test_zipcode_mapping() throws Exception {
		assertNotNull(address);
		assertEquals("12345", address.getZipcode());
	}
}
