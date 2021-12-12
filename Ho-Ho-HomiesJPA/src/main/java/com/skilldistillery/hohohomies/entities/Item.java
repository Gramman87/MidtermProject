package com.skilldistillery.hohohomies.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "exchange_item")
public class Item {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "event_id")
	@JoinColumn(name = "user_id")
	private UserExchange exchange;

	private String title;

	private String description;

	@Column(name = "url")
	private String url;

	@Column(name = "is_visible")
	private boolean visible;

	@OneToMany(mappedBy = "item")
	private List<ItemComment> comments;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public UserExchange getExchange() {
		return exchange;
	}

	public void setExchange(UserExchange exchange) {
		this.exchange = exchange;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean isVisible() {
		return visible;
	}

	public void setVisible(boolean visible) {
		this.visible = visible;
	}

	public List<ItemComment> getComments() {
		return comments;
	}

	public void setComments(List<ItemComment> comments) {
		this.comments = comments;
	}

	public void addComment(ItemComment comment) {
		if (comments == null) {
			comments = new ArrayList<>();
		}
		if (!comments.contains(comment)) {
			if (comment.getItem() != null) {
				comment.getItem().removeComment(comment);
			}
			comments.add(comment);
			comment.setItem(this);
		}
	}

	public void removeComment(ItemComment comment) {
		if (comments != null && comments.contains(comment)) {
			comments.remove(comment);
			comment.setItem(null);
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
		Item other = (Item) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "UserExchangeItem [id=" + id + ", title=" + title + ", visible=" + visible + "]";
	}

}
