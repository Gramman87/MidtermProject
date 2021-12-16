package com.skilldistillery.hohohomies.data;

import java.util.List;

import com.skilldistillery.hohohomies.entities.EventInvite;

public interface EventInviteDAO {
	List<EventInvite> findAllByEventId(int id);

	EventInvite findById(int id);
	
	void store(EventInvite invite);

	void delete(EventInvite invite);
}
