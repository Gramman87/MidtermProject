package com.skilldistillery.hohohomies.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.hohohomies.entities.EventComment;
import com.skilldistillery.hohohomies.entities.UserExchange;

@Repository
@Transactional
public class EventCommentDAOImpl implements EventCommentDAO {

	private static final String QUERY_PREFIX = "SELECT c FROM EventComment c WHERE ";

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<EventComment> findAllByExchange(UserExchange exchange) {
		return em.createQuery(QUERY_PREFIX + "c.exchange=:e",
				EventComment.class).setParameter("e", exchange).getResultList();
	}

	@Override
	public List<EventComment> findAllByEventId(int id) {
		return em.createQuery(QUERY_PREFIX + "c.exchange.event.id=:id",
				EventComment.class).setParameter("id", id).getResultList();
	}

	@Override
	public List<EventComment> findAllByUserId(int id) {
		return em.createQuery(QUERY_PREFIX + "c.exchange.user.id=:id",
				EventComment.class).setParameter("id", id).getResultList();
	}

	@Override
	public EventComment findById(int id) {
		return em.find(EventComment.class, id);
	}

	@Override
	public List<EventComment> findAllRepliesToId(int id) {
		return em.createQuery(
				QUERY_PREFIX + "c.replyTo.id=:id ORDER BY c.postedOn ASC",
				EventComment.class).setParameter("id", id).getResultList();
	}

	@Override
	public EventComment store(EventComment comment) {
		em.persist(comment);
		return comment;
	}

	@Override
	public EventComment update(EventComment comment) {
		EventComment managed = em.find(EventComment.class, comment.getId());
		managed.setContent(comment.getContent());
		managed.setPostedOn(comment.getPostedOn());
		managed.setExchange(comment.getExchange());
		managed.setReplyTo(comment.getReplyTo());
		return managed;
	}

}
