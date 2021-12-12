package com.skilldistillery.hohohomies.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "event_type")
public class EventType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	@Column(name = "image_url")
	private String imageURL;

	@OneToMany(mappedBy = "type")
	private List<Event> events;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public void addEvent(Event event) {
		if (events == null) {
			events = new ArrayList<>();
		}
		if (!events.contains(event)) {
			if (event.getType() != null) {
				event.getType().removeEvent(event);
			}
			events.add(event);
			event.setType(this);
		}
	}

	public void removeEvent(Event event) {
		if (events != null && events.contains(event)) {
			events.remove(event);
			event.setType(null);
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
		EventType other = (EventType) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "EventType [id=" + id + ", name=" + name + ", description=" + description + ", imageURL=" + imageURL
				+ "]";
	}

}
