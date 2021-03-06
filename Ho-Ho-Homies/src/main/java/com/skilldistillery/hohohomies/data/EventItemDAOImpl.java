package com.skilldistillery.hohohomies.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.hohohomies.entities.EventItem;
import com.skilldistillery.hohohomies.entities.UserExchangeId;

@Repository
@Transactional
public class EventItemDAOImpl implements EventItemDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<EventItem> findAllByEventId(int id) {
		return em.createQuery(
				"SELECT i FROM EventItem i WHERE i.exchange.event.id=:id",
				EventItem.class).setParameter("id", id).getResultList();
	}

	@Override
	public List<EventItem> findAllByExchangeId(UserExchangeId id) {
		return em.createQuery(
				"SELECT i FROM EventItem i WHERE i.exchange.id=:id",
				EventItem.class).setParameter("id", id).getResultList();
	}

	@Override
	public List<EventItem> findAllByUserId(int id) {
		return em.createQuery(
				"SELECT i FROM EventItem i WHERE i.exchange.event.id=:id",
				EventItem.class).setParameter("id", id).getResultList();
	}

	@Override
	public void store(EventItem item) {
		em.persist(item);
	}

	@Override
	public void update(EventItem item) {
		EventItem managed = em.find(EventItem.class, item.getId());

		managed.setExchange(item.getExchange());
		managed.setTitle(item.getTitle());
		managed.setDescription(item.getDescription());
		managed.setUrl(item.getUrl());
		managed.setVisible(item.isVisible());
	}

}
