package com.skilldistillery.hohohomies.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.hohohomies.entities.UserExchange;
import com.skilldistillery.hohohomies.entities.UserExchangeId;

@Repository
@Transactional
public class UserExchangeDAOImpl implements UserExchangeDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<UserExchange> findAllByEventId(int id) {
		return em.createQuery(
				"SELECT e FROM UserExchange e WHERE e.event.id=:id",
				UserExchange.class).setParameter("id", id).getResultList();
	}

	@Override
	public List<UserExchange> findAllByUserId(int id) {
		return em.createQuery(
				"SELECT e FROM UserExchange e WHERE e.user.id=:id",
				UserExchange.class).setParameter("id", id).getResultList();
	}

	@Override
	public UserExchange findById(UserExchangeId id) {
		return em.createQuery("SELECT e FROM UserExchange e WHERE e.id=:id",
				UserExchange.class).setParameter("id", id).getSingleResult();
	}

	@Override
	public UserExchange store(UserExchange exchange) {
		em.persist(exchange);
		return exchange;
	}

	@Override
	public UserExchange update(UserExchange exchange) {
		UserExchange managed = em.find(UserExchange.class, exchange.getId());
		managed.setUser(exchange.getUser());
		managed.setEvent(exchange.getEvent());
		managed.setGiftee(exchange.getGiftee());
		managed.setAttending(exchange.isAttending());
		managed.setComment(exchange.getComment());
		managed.setDateInvited(exchange.getDateInvited());
		return managed;
	}

	@Override
	public void delete(UserExchange exchange) {
		em.remove(exchange);
	}

}
