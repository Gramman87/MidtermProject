package com.skilldistillery.hohohomies.data;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.hohohomies.entities.EventInvite;

@SpringBootTest
class EventInviteDAOTest {

	@Autowired
	EventInviteDAO inviteDao;
	EventInvite invite;

	@BeforeEach
	void setUp() throws Exception {
		invite = inviteDao.findById(1);
	}

	@AfterEach
	void tearDown() throws Exception {
		invite = null;
	}

	@Test
	void test_find_by_id() throws Exception {
		assertNotNull(invite);
		assertEquals(1, invite.getId());
	}

	@Test
	void test_find_by_event_id() throws Exception {
		List<EventInvite> invites = inviteDao.findAllByEventId(1);
		assertNotNull(invites);
		assertTrue(invites.size() > 0);
	}

}
