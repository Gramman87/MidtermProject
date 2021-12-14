package com.skilldistillery.hohohomies.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user_exchange")
public class UserExchange {

	@EmbeddedId
	private UserExchangeId id;

	@ManyToOne
	@JoinColumn(name = "user_id") // Column in DB
	@MapsId(value = "userId") // Field in Id class
	private User user;

	@ManyToOne
	@JoinColumn(name = "event_id") // Column in DB
	@MapsId(value = "eventId") // Field in Id class
	private Event event;

	@ManyToOne
	private User giftee;

	private boolean attending;

	private String comment;

	@Column(name = "date_invited")
	private LocalDateTime dateInvited;

	@OneToMany(mappedBy = "exchange")
	private List<EventItem> items;

	public UserExchangeId getId() {
		return id;
	}

	public void setId(UserExchangeId id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public User getGiftee() {
		return giftee;
	}

	public void setGiftee(User giftee) {
		this.giftee = giftee;
	}

	public boolean isAttending() {
		return attending;
	}

	public void setAttending(boolean attending) {
		this.attending = attending;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public LocalDateTime getDateInvited() {
		return dateInvited;
	}

	public void setDateInvited(LocalDateTime dateInvited) {
		this.dateInvited = dateInvited;
	}

	public List<EventItem> getItems() {
		return items;
	}

	public void setItems(List<EventItem> items) {
		this.items = items;
	}

	public void addItem(EventItem item) {
		if (items == null) {
			items = new ArrayList<>();
		}
		if (!items.contains(item)) {
			if (item.getExchange() != null) {
				item.getExchange().removeItem(item);
			}
			items.add(item);
			item.setExchange(this);
		}
	}

	public void removeItem(EventItem item) {
		if (items != null && items.contains(item)) {
			items.remove(item);
			item.setExchange(null);
		}
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
		UserExchange other = (UserExchange) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "UserExchange [id=" + id + ", giftee=" + giftee + ", attending=" + attending + ", comment=" + comment
				+ ", dateInvited=" + dateInvited + "]";
	}

}
