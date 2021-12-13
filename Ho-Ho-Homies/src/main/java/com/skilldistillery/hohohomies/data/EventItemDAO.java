package com.skilldistillery.hohohomies.data;

import java.util.List;

import com.skilldistillery.hohohomies.entities.Event;
import com.skilldistillery.hohohomies.entities.EventItem;
import com.skilldistillery.hohohomies.entities.UserExchange;

public interface EventItemDAO {
	List<EventItem> findByEventId(int id);

	void store(EventItem item);

	void update(EventItem item);
}
