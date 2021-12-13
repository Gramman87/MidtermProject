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
	public User findByUsername(String username) throws RuntimeException {

		String jpql = "SELECT u FROM User u WHERE u.email = :n";

		return em.createQuery(jpql, User.class).setParameter("n", username).getSingleResult();
	}
	
	@Override
	public User registerUser(User user) throws RuntimeException {
		em.persist(user);
		
		return user;
	}

	@Override
	public User updateUser(User user) {
		User managed = em.find(User.class, user.getId());
		
		managed.setEmail(user.getEmail());
		managed.setPassword(user.getPassword());
		managed.setFirstName(user.getFirstName());
		managed.setLastName(user.getLastName());
		managed.setAddress(user.getAddress());
		managed.setEnabled(user.isEnabled());
		managed.setRole(user.getRole());
		managed.setImageURL(user.getImageURL());
		
		return managed;
	}

}
