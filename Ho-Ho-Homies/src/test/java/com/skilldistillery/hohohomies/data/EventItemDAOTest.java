package com.skilldistillery.hohohomies.data;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class EventItemDAOTest {

	@Autowired
	private EventItemDAO dao;

	@BeforeEach
	void setUp() throws Exception {
		dao = new EventItemDAOImpl();
	}

	@AfterEach
	void tearDown() throws Exception {
		dao = null;
	}

	@Test
	void test() {
		System.out.println(dao.findByEventId(1));
	}

}
