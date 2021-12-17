package com.skilldistillery.hohohomies.data;

import java.util.List;

import com.skilldistillery.hohohomies.entities.Event;
import com.skilldistillery.hohohomies.entities.User;

public interface EventDAO {
	public Event findById(int id);

	public Event store(Event event);

	public Event update(Event event);
	
	//public Event gifteesMatched(List<User> users);
}
