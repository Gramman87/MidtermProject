package com.skilldistillery.hohohomies.data;

import java.time.LocalDateTime;

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
		String jpql = "SELECT e FROM Event e WHERE e.id = :eId";
		Event eventMatchingId = null;
		
		return eventMatchingId = em.createQuery(jpql, Event.class)
			.setParameter("eId", eventId)
			.getSingleResult();
		
	}
	public Event updateEvent(Event event) {
		Event managed = em.find(Event.class, event.getId());
		
		managed.setAddress(event.getAddress());
		managed.setBeginsOn(event.getBeginsOn());
		managed.setComplete(event.isComplete());
		managed.setCustomRules(event.getCustomRules());
		managed.setImageURL(event.getImageURL());
		managed.setLastUpdate(LocalDateTime.now()); 
		managed.setPriceMax(event.getPriceMax());
		managed.setPriceMin(event.getPriceMin());
		managed.setRsvpBy(event.getRsvpBy());
		managed.setTitle(event.getTitle());
		managed.setType(event.getType());
		
		return managed;
	}

}
