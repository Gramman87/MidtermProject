package com.skilldistillery.hohohomies.data;

import com.skilldistillery.hohohomies.entities.Address;

public interface AddressDAO {
	public Address findById(int id);

	public Address store(Address address);

	public Address update(Address address);
}
