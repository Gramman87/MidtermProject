package com.skilldistillery.hohohomies.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.hohohomies.entities.Event;

@Transactional
@Repository
public class EventDAOImpl implements EventDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Event createEvent(Event event) {
		
		em.persist(event);
		return event;
	}

	@Override
	public Event findEventFromEventId(Integer eventId) {
		String jpql = "SELECT e FROM event e WHERE e.id = :eId";
		Event eventMatchingId = null;
		try {
			em.createQuery(jpql, Event.class)
			.setParameter("eId", eventId)
			.getSingleResult();
		}catch(Exception e) {
			System.err.println("Invalid Event ID: " + eventId);
			return eventMatchingId;
		}
		
		return eventMatchingId;
	}

}
