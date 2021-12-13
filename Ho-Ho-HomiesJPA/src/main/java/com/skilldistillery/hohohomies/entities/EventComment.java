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
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "event_comment")
public class EventComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String content;

	@Column(name = "posted_on")
	private LocalDateTime postedOn;

	@ManyToOne
	@JoinColumns({ @JoinColumn(name = "event_id", referencedColumnName = "event_id"),
			@JoinColumn(name = "user_id", referencedColumnName = "user_id") })
	private UserExchange exchange;

	@ManyToOne
	@JoinColumn(name = "reply_to")
	private EventComment replyTo;

	@OneToMany(mappedBy = "replyTo")
	private List<EventComment> replies;

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

	public void setPostedOn(LocalDateTime datetime) {
		this.postedOn = datetime;
	}

	public UserExchange getExchange() {
		return exchange;
	}

	public void setExchange(UserExchange exchange) {
		this.exchange = exchange;
	}

	public EventComment getReplyTo() {
		return replyTo;
	}

	public void setReplyTo(EventComment replyTo) {
		this.replyTo = replyTo;
	}

	public List<EventComment> getReplies() {
		return replies;
	}

	public void setReplies(List<EventComment> replies) {
		this.replies = replies;
	}

	public void addReply(EventComment comment) {
		if (replies == null) {
			replies = new ArrayList<>();
		}
		if (!replies.contains(comment)) {
			if (comment.getReplyTo() != null) {
				comment.getReplyTo().removeReply(comment);
			}
			replies.add(comment);
			comment.setReplyTo(this);
		}
	}

	public void removeReply(EventComment comment) {
		if (replies != null && replies.contains(comment)) {
			replies.remove(comment);
			comment.setReplyTo(null);
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
		EventComment other = (EventComment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "EventComment [id=" + id + ", text=" + content + ", datetime=" + postedOn + "]";
	}

}
