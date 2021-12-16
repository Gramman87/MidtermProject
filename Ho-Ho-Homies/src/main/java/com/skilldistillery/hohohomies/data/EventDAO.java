package com.skilldistillery.hohohomies.data;

import com.skilldistillery.hohohomies.entities.Event;

public interface EventDAO {
	public Event findById(int id);

	public Event store(Event event);

	public Event update(Event event);
}
