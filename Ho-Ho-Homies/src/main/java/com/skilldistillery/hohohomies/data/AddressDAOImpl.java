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
	public Address storeAddress(Address address) {
		em.persist(address);
		return address;
		
	}

	@Override
	public Address findAddressByAddressId(Integer addressId) {
		String jpql = "SELECT a FROM Address a WHERE a.id = :n";
		Address addressMatchingId = em.createQuery(jpql, Address.class)
				.setParameter("n", addressId)
				.getSingleResult();
		return addressMatchingId;
	}

	@Override
	public Address updateAddress(Address address) {
		Address managed = em.find(Address.class, address.getId());
		
		managed.setCity(address.getCity());
		managed.setState(address.getState());
		managed.setStreet1(address.getStreet1());
		managed.setStreet2(address.getStreet2());
		managed.setZipcode(address.getZipcode());
		
		return managed;
	}

}
