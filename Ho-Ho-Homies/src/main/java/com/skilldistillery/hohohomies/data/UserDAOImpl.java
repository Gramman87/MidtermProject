package com.skilldistillery.hohohomies.data;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
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
	public User findById(int id) {
		String jpql = "SELECT u FROM User u WHERE u.id = :id";
		return em	.createQuery(jpql, User.class)
					.setParameter("id", id)
					.getSingleResult();
	}

	@Override
	public User findByEmail(String email) throws RuntimeException {
		String jpql = "SELECT u FROM User u WHERE u.email = :n";
		try {
			return em	.createQuery(jpql, User.class)
						.setParameter("n", email)
						.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public User findByEmailAndPassword(String email, String password)
			throws RuntimeException {
		String jpql = "SELECT u FROM User u WHERE u.password = :password AND u.email = :email";
		try {
			return em	.createQuery(jpql, User.class)
						.setParameter("password", password)
						.setParameter("email", email)
						.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public User register(User user) throws RuntimeException {
		em.persist(user);
		return user;
	}

	@Override
	public User update(User user) {
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
