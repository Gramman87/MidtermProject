package com.skilldistillery.hohohomies.data;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.hohohomies.entities.EventItem;
import com.skilldistillery.hohohomies.entities.UserExchangeId;

@SpringBootTest
class EventItemDAOTest {

	@Autowired
	private EventItemDAO dao;

	@Test
	void test_find_all_by_event_id() {
		List<EventItem> items = dao.findAllByEventId(1);
		assertNotNull(items);
		assertTrue(items.size() > 0);
	}

	@Test
	void test_find_all_by_exchange_id() throws Exception {
		List<EventItem> items = dao.findAllByExchangeId(
				new UserExchangeId(1, 1));
		assertNotNull(items);
		assertTrue(items.size() > 0);
	}

	@Test
	void test_find_all_by_user_id() throws Exception {
		List<EventItem> items = dao.findAllByUserId(1);
		assertNotNull(items);
		assertTrue(items.size() > 0);
	}

}
