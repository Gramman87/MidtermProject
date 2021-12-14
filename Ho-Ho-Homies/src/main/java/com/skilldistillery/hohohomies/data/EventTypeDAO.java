package com.skilldistillery.hohohomies.data;

import com.skilldistillery.hohohomies.entities.EventType;

public interface EventTypeDAO {
	EventType findById(int id);

	EventType store(EventType type);

	EventType update(EventType type);
}
