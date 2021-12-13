package com.skilldistillery.hohohomies.data;

import com.skilldistillery.hohohomies.entities.WishlistItem;

public interface WIshlistItemDAO {
	WishlistItem findItemById(int id);
	
	void store(WishlistItem item);

	void update(WishlistItem item);

}
