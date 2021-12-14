package com.skilldistillery.hohohomies.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.hohohomies.entities.Address;
import com.skilldistillery.hohohomies.entities.User;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int id) {
		String jpql = "SELECT u FROM User u WHERE u.id = :id";

		return em.createQuery(jpql, User.class).setParameter("id", id).getSingleResult();
	}

	@Override
	public User findByEmail(String username) throws RuntimeException {

		String jpql = "SELECT u FROM User u WHERE u.email = :n";

		return em.createQuery(jpql, User.class).setParameter("n", username).getSingleResult();
	}

	@Override
	public User findByPasswordAndEmailForLogin(String password, String username) throws RuntimeException {

		String jpql = "SELECT u FROM User u WHERE u.password = :password AND u.email = :email";

		return em.createQuery(jpql, User.class)
				 .setParameter("password", password)
				 .setParameter("email", username)
				 .getSingleResult();
	}
	

	@Override
	public User registerUser(User user) throws RuntimeException {
		em.persist(user);

		return user;
	}

	@Override
	public Address registerAddress(Address address) throws RuntimeException {
		em.persist(address);
		
		return address;
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
