package com.skilldistillery.hohohomies.data;

import com.skilldistillery.hohohomies.entities.Event;

public interface EventDAO {
	public Event createEvent(Event event);
	public Event findEventFromEventId(Integer eventId);
	public Event updateEvent(Event event);

}
