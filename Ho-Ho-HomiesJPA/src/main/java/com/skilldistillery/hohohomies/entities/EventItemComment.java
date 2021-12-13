package com.skilldistillery.hohohomies.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "item_comment")
public class EventItemComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String content;

	@Column(name = "posted_on")
	private LocalDateTime postedOn;

	@ManyToOne
	private User user;

	@ManyToOne
	@JoinColumn(name = "exchange_item_id")
	private EventItem item;

	@Column(name = "image_url")
	private String imageURL;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String text) {
		this.content = text;
	}

	public LocalDateTime getPostedOn() {
		return postedOn;
	}

	public void setPostedOn(LocalDateTime when) {
		this.postedOn = when;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public EventItem getItem() {
		return item;
	}

	public void setItem(EventItem item) {
		this.item = item;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
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
		EventItemComment other = (EventItemComment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "ExchangeItemComment [id=" + id + ", text=" + content + "]";
	}

}
