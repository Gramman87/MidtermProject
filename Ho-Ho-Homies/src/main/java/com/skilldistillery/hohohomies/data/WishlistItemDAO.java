package com.skilldistillery.hohohomies.data;

import java.util.List;

import com.skilldistillery.hohohomies.entities.WishlistItem;

public interface WishlistItemDAO {
	WishlistItem findById(int id);

	List<WishlistItem> findAllById(int id);

	void store(WishlistItem item);

	void update(WishlistItem item);

	void delete(WishlistItem item);

}
