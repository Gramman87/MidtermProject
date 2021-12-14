package com.skilldistillery.hohohomies.data;

import java.util.List;

import com.skilldistillery.hohohomies.entities.UserExchange;
import com.skilldistillery.hohohomies.entities.UserExchangeId;

public interface UserExchangeDAO {

	List<UserExchange> findAllByUserId(int id);

	List<UserExchange> findAllByEventId(int id);

	UserExchange findById(UserExchangeId id);

	UserExchange store(UserExchange exchange);

	UserExchange update(UserExchange exchange);

}
