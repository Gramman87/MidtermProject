package com.skilldistillery.hohohomies.data;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.hohohomies.entities.EventInvite;

@SpringBootTest
class EventInviteDAOTest {

	@Autowired
	EventInviteDAO inviteDao;

	@Test
	void test_find_by_id() throws Exception {
		assertNotNull(inviteDao.findById(1));
	}

	@Test
	void test_find_by_event_id() throws Exception {
		List<EventInvite> invites = inviteDao.findAllByEventId(1);
		assertNotNull(invites);
		assertTrue(invites.size() > 0);
	}

	@Test
	void test_find_by_email() throws Exception {
		assertNotNull(inviteDao.findByEmail("jk@gmail.com"));
	}

}
