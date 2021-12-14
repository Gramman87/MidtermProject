package com.skilldistillery.hohohomies.data;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.hohohomies.entities.EventType;

@SpringBootTest
public class EventTypeDAOTest {

	@Autowired
	private EventTypeDAO dao;

	@Test
	void test_find_by_id() throws Exception {
		EventType type = dao.findById(1);
		assertNotNull(type);
	}

}
