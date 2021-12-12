package com.skilldistillery.hohohomies.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class UserExchangeId implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "event_id")
	private int eventId;

	@Column(name = "user_id")
	private int userId;

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int exchangeId) {
		this.eventId = exchangeId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(eventId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserExchangeId other = (UserExchangeId) obj;
		return eventId == other.eventId && userId == other.userId;
	}

	@Override
	public String toString() {
		return "UserExchangeId [exchangeId=" + eventId + ", userId=" + userId + "]";
	}

}
