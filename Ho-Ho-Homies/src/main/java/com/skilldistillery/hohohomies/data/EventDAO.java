package com.skilldistillery.hohohomies.data;

import com.skilldistillery.hohohomies.entities.Event;

public interface EventDAO {
	public Event storeEvent(Event event);
	public Event findEventFromEventId(int eventId);
	public Event updateEvent(Event event);

}
