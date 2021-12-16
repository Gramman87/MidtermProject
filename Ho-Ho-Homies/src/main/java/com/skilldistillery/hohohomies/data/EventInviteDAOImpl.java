package com.skilldistillery.hohohomies.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.hohohomies.entities.EventInvite;

@Repository
@Transactional
public class EventInviteDAOImpl implements EventInviteDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<EventInvite> findAllByEventId(int id) {
		return em.createQuery(
				"SELECT i FROM EventInvite i WHERE i.event.id = :id",
				EventInvite.class).setParameter("id", id).getResultList();
	}

	@Override
	public EventInvite findById(int id) {
		return em.find(EventInvite.class, id);
	}

	@Override
	public EventInvite findByEmail(String email) {
		try {
			return em	.createQuery(
								"SELECT i FROM EventInvite i WHERE i.email = :email",
								EventInvite.class)
						.setParameter("email", email)
						.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public void store(EventInvite invite) {
		em.persist(invite);
	}

	@Override
	public void delete(EventInvite invite) {
		em.remove(invite);
	}

}
