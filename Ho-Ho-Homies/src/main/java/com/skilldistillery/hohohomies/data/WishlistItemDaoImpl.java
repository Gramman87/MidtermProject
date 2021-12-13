package com.skilldistillery.hohohomies.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.hohohomies.entities.WishlistItem;

@Transactional
@Repository
public class WishlistItemDaoImpl implements WIshlistItemDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public WishlistItem findItemById(int id) {
		return em.createQuery("SELECT wi FROM wishlist_item wi WHERE wi.id = :id", WishlistItem.class).setParameter("id", id).getSingleResult();
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
	
	

}
