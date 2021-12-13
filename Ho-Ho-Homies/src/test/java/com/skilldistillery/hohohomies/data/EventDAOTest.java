package com.skilldistillery.hohohomies.data;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.hohohomies.entities.Event;

@SpringBootTest
class EventDAOTest {
	
	@Autowired
	EventDAO eventDao;
	Event event;
	
	@BeforeEach
	void setUp() throws Exception {
	    event = eventDao.findEventFromEventId(1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    event = null;
	}

	@Test
	void test_findEventByEventId() {
		assertNotNull(event);
	}

}
