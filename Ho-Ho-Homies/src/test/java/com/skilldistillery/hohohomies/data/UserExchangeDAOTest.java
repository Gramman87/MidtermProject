package com.skilldistillery.hohohomies.data;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.hohohomies.entities.UserExchange;
import com.skilldistillery.hohohomies.entities.UserExchangeId;

@SpringBootTest
class UserExchangeDAOTest {

	@Autowired
	private UserExchangeDAO dao;

	@Test
	void test_find_all_by_event_id() throws Exception {
		List<UserExchange> ex = dao.findAllByEventId(1);
		assertNotNull(ex);
		assertTrue(ex.size() > 0);
	}

	@Test
	void test_find_all_by_user_id() throws Exception {
		List<UserExchange> ex = dao.findAllByUserId(2);
		assertNotNull(ex);
		assertTrue(ex.size() > 0);
	}

	@Test
	void test_find_by_id() throws Exception {
		assertNotNull(dao.findById(new UserExchangeId(1, 1)));
	}

}
