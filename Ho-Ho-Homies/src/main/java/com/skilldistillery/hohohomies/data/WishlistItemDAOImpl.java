package com.skilldistillery.hohohomies.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.hohohomies.entities.WishlistItem;

@Transactional
@Repository
public class WishlistItemDAOImpl implements WishlistItemDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public WishlistItem findById(int id) {
		String jpql = "SELECT i FROM WishlistItem i WHERE i.id = :id";
		return em	.createQuery(jpql, WishlistItem.class)
					.setParameter("id", id)
					.getSingleResult();
	}

	@Override
	public List<WishlistItem> findAllById(int id) {
		String jpql = "SELECT i FROM WishlistItem i WHERE i.user.id = :id";
		return em	.createQuery(jpql, WishlistItem.class)
					.setParameter("id", id)
					.getResultList();
	}

	@Override
	public void store(WishlistItem item) {
		em.persist(item);
	}

	@Override
	public void update(WishlistItem item) {
		WishlistItem managed = em.find(WishlistItem.class, item);

		managed.setName(item.getName());
		managed.setCost(item.getCost());
		managed.setUser(item.getUser());
		managed.setShoppingURL(item.getShoppingURL());
		managed.setDescription(item.getDescription());
	}

	@Override
	public void delete(WishlistItem item) {
		em.remove(item);
	}

}
