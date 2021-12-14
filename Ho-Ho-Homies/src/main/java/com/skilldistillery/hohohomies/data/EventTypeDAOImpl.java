package com.skilldistillery.hohohomies.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.hohohomies.entities.EventType;

@Repository
@Transactional
public class EventTypeDAOImpl implements EventTypeDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public EventType findById(int id) {
		return em.find(EventType.class, id);
	}

	@Override
	public EventType store(EventType type) {
		em.persist(type);
		return type;
	}

	@Override
	public EventType update(EventType type) {
		EventType managed = em.find(EventType.class, type.getId());
		managed.setName(type.getName());
		managed.setDescription(type.getDescription());
		managed.setImageURL(type.getImageURL());
		return managed;
	}

}
