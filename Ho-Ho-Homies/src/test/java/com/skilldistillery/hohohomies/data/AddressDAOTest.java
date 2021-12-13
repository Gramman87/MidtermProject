package com.skilldistillery.hohohomies.data;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.hohohomies.entities.Address;

@SpringBootTest
class AddressDAOTest {
	
	@Autowired
	AddressDAO addressDao;
	Address add;

	@BeforeEach
	void setUp() throws Exception {
		add = addressDao.findAddressByAddressId(1);
	}

	@AfterEach
	void tearDown() throws Exception {
		add = null;
	}

	@Test
	void test_find_Address_By_ID() {
		assertNotNull(add);
		assertEquals("123 SomeWhere St.", add.getStreet1());
		assertEquals("12345", add.getZipcode());
	}
	@Test
	void test_update_Address() {
		assertNotNull(add);
		
		add.setCity("North Pole");
		add.setState("North");
		add.setZipcode("00000");
		
		addressDao.updateAddress(add);
		
		add = addressDao.findAddressByAddressId(1);
		
		assertEquals("North Pole", add.getCity());
		assertEquals("North", add.getState());
		assertEquals("00000", add.getZipcode());
		
		add.setCity("Out There");
		add.setState("CO");
		add.setZipcode("12345");
		
		addressDao.updateAddress(add);
		
	}

}
