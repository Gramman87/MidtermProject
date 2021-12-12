package com.skilldistillery.hohohomies.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String email;

	private String password;

	@Column(name = "create_date")
	private LocalDateTime createDate;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@OneToOne
	private Address address;

	private boolean enabled;

	private String role;

	@Column(name = "profile_image_url")
	private String imageURL;

	@OneToMany(mappedBy = "user")
	private List<WishlistItem> wishlist;

	@OneToMany(mappedBy = "user")
	private List<UserExchange> exchanges;
	

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public List<WishlistItem> getWishlist() {
		return wishlist;
	}

	public void setWishlist(List<WishlistItem> wishlist) {
		this.wishlist = wishlist;
	}

	public void addWishlistItem(WishlistItem item) {
		if (wishlist == null) {
			wishlist = new ArrayList<>();
		}
		if (!wishlist.contains(item)) {
			if (item.getUser() != null) {
				item.getUser().removeWishlistItem(item);
			}
			wishlist.add(item);
			item.setUser(this);
		}
	}

	public void removeWishlistItem(WishlistItem item) {
		if (wishlist != null && wishlist.contains(item)) {
			wishlist.remove(item);
			item.setUser(null);
		}
	}

	public List<UserExchange> getExchanges() {
		return exchanges;
	}

	public void setExchanges(List<UserExchange> exchanges) {
		this.exchanges = exchanges;
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
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + "]";
	}

}
