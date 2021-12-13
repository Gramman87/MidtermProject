package com.skilldistillery.hohohomies.data;

import static org.junit.jupiter.api.Assertions.assertEquals;
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
	void test_find_Event_By_EventId() {
		assertNotNull(event);
		assertEquals(2021, event.getBeginsOn().getYear());
		assertEquals(12, event.getBeginsOn().getMonthValue());
		assertEquals(24, event.getBeginsOn().getDayOfMonth());
	}
	
	@Test
	void test_update_Event() {
		assertNotNull(event);
		
		event.setTitle("HO HO HO");
		event.setPriceMax(16.00);
		event.setPriceMin(2.00);
		
		eventDao.updateEvent(event);
		
		event = eventDao.findEventFromEventId(1);
		
		assertEquals("HO HO HO", event.getTitle());
		assertEquals(16, event.getPriceMax());
		assertEquals(2, event.getPriceMin());
		
		event.setTitle("Secret Santa Test");
		event.setPriceMax(75.00);
		event.setPriceMin(25.00);
		
		eventDao.updateEvent(event);
		

	}

}
