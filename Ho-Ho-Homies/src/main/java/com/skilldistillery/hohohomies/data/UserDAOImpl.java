package com.skilldistillery.hohohomies.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.hohohomies.entities.User;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findByUsername(String username) {

		String jpql = "SELECT u FROM User u WHERE u.email = :n";

		try {
			return em.createQuery(jpql, User.class).setParameter("n", username).getSingleResult();
		} catch (Exception e) {
			System.err.println("Invalid user name: " + username);
			return null;
		}
	}

	@Override
	public User createUser(User user) {
		em.getTransaction();

		em.persist(user);

		em.flush();
		em.getTransaction().commit();
		em.close();

		return user;
	}

}
