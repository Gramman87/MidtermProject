package com.skilldistillery.hohohomies.data;

import java.util.List;

import com.skilldistillery.hohohomies.entities.Event;
import com.skilldistillery.hohohomies.entities.User;

public interface EventDAO {
	public Event storeEvent(Event event);
	public Event findEventFromEventId(int eventId);
	public Event updateEvent(Event event);

}
