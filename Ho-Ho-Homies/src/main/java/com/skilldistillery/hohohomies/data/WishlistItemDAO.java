package com.skilldistillery.hohohomies.data;

import java.util.List;

import com.skilldistillery.hohohomies.entities.User;
import com.skilldistillery.hohohomies.entities.WishlistItem;

public interface WishlistItemDAO {
	WishlistItem findItemById(int id);
	
	List<WishlistItem> findWishlistByUser(User user);
	
	void store(WishlistItem item);

	void update(WishlistItem item);

}
