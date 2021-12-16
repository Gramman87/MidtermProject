package com.skilldistillery.hohohomies.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.hohohomies.entities.Address;

@Transactional
@Repository
public class AddressDAOImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Address store(Address address) {
		em.persist(address);
		return address;

	}

	@Override
	public Address findById(int id) {
		return em.find(Address.class, id);
	}

	@Override
	public Address update(Address address) {
		Address managed = em.find(Address.class, address.getId());
		managed.setCity(address.getCity());
		managed.setState(address.getState());
		managed.setStreet1(address.getStreet1());
		managed.setStreet2(address.getStreet2());
		managed.setZipcode(address.getZipcode());
		return managed;
	}

}
