package com.skilldistillery.hohohomies.data;

import java.util.List;

import com.skilldistillery.hohohomies.entities.EventItem;
import com.skilldistillery.hohohomies.entities.UserExchangeId;

public interface EventItemDAO {
	List<EventItem> findAllByEventId(int id);

	List<EventItem> findAllByUserId(int id);

	List<EventItem> findAllByExchangeId(UserExchangeId id);

	void store(EventItem item);

	void update(EventItem item);
}
