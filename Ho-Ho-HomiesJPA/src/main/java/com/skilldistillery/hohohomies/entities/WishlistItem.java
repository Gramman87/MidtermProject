package com.skilldistillery.hohohomies.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "wishlist_item")
public class WishlistItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private double cost;

	@ManyToOne
	private User user;

	@Column(name = "shopping_url")
	private String shoppingURL;

	private String description;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getShoppingURL() {
		return shoppingURL;
	}

	public void setShoppingURL(String shoppingURL) {
		this.shoppingURL = shoppingURL;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		WishlistItem other = (WishlistItem) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "WishlistItem [id=" + id + ", name=" + name + ", cost=" + cost + ", user=" + user + ", shoppingURL="
				+ shoppingURL + ", description=" + description + "]";
	}

}
