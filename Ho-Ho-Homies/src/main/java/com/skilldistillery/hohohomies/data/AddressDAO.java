package com.skilldistillery.hohohomies.data;

import com.skilldistillery.hohohomies.entities.Address;

public interface AddressDAO {
	
	public Address storeAddress(Address address);
	public Address findAddressByAddressId(int addressId);
	public Address updateAddress(Address address);

}
