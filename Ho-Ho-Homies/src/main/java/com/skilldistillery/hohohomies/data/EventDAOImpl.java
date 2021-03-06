package com.skilldistillery.hohohomies.data;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.hohohomies.entities.Event;
import com.skilldistillery.hohohomies.entities.User;

@Transactional
@Repository
public class EventDAOImpl implements EventDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Event findById(int eventId) {
		return em.find(Event.class, eventId);
	}

	@Override
	public Event store(Event event) {
		em.persist(event);
		return event;
	}

	public Event update(Event event) {
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
	
//	@Override
//	public Event gifteesMatched(int eventId) {
//		
//		String jpql = "SELECT u FROM User u JOIN Event e WHERE e.id = :"
//		em.find("", em)		
//		
//		return null;
//	}

}
