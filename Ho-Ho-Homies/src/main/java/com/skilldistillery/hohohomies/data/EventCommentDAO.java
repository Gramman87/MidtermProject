package com.skilldistillery.hohohomies.data;

import java.util.List;

import com.skilldistillery.hohohomies.entities.EventComment;
import com.skilldistillery.hohohomies.entities.UserExchange;

public interface EventCommentDAO {
	List<EventComment> findAllByExchange(UserExchange exchange);

	List<EventComment> findAllByEventId(int id);

	List<EventComment> findAllByUserId(int id);

	EventComment findById(int id);

	List<EventComment> findAllRepliesToId(int id);

	EventComment store(EventComment comment);

	EventComment update(EventComment comment);
}
