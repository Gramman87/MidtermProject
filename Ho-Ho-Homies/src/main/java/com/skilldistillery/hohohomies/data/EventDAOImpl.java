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
//		String jpql = "SELECT e "
		
		
		return null;
	}

}
