package com.skilldistillery.hohohomies.entities;

import java.time.LocalDate;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "exchange_event")
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "custom_rules")
	private String customRules;

	@ManyToOne
	private Address address;

	@Column(name = "price_min")
	private double priceMin;

	@Column(name = "price_max")
	private double priceMax;

	@ManyToOne
	private User owner;

	private boolean complete;

	@ManyToOne
	@JoinColumn(name = "event_type_id")
	private EventType type;

	private String title;

	@Column(name = "image_url")
	private String imageURL;

	@Column(name = "last_update")
	private LocalDateTime lastUpdate;

	@Column(name = "rsvp_by")
	private LocalDate rsvpBy;

	@Column(name = "begins_on")
	private LocalDateTime beginsOn;

	@Column(name = "create_date")
	private LocalDateTime createDate;

	@OneToMany(mappedBy = "event")
	private List<UserExchange> exchanges;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCustomRules() {
		return customRules;
	}

	public void setCustomRules(String customRules) {
		this.customRules = customRules;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public double getPriceMin() {
		return priceMin;
	}

	public void setPriceMin(double priceMin) {
		this.priceMin = priceMin;
	}

	public double getPriceMax() {
		return priceMax;
	}

	public void setPriceMax(double priceMax) {
		this.priceMax = priceMax;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public boolean isComplete() {
		return complete;
	}

	public void setComplete(boolean complete) {
		this.complete = complete;
	}

	public EventType getType() {
		return type;
	}

	public void setType(EventType type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public LocalDate getRsvpBy() {
		return rsvpBy;
	}

	public void setRsvpBy(LocalDate rsvpBy) {
		this.rsvpBy = rsvpBy;
	}

	public LocalDateTime getBeginsOn() {
		return beginsOn;
	}

	public void setBeginsOn(LocalDateTime beginsOn) {
		this.beginsOn = beginsOn;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public List<UserExchange> getExchanges() {
		return exchanges;
	}

	public void setExchanges(List<UserExchange> userExchanges) {
		this.exchanges = userExchanges;
	}

	public void addExchange(UserExchange exchange) {
		if (exchanges == null) {
			exchanges = new ArrayList<>();
		}
		if (!exchanges.contains(exchange)) {
			if (exchange.getEvent() != null) {
				exchange.getEvent().removeExchange(exchange);
			}
			exchanges.add(exchange);
			exchange.setEvent(this);
		}
	}

	public void removeExchange(UserExchange exchange) {
		if (exchanges != null && exchanges.contains(exchange)) {
			exchanges.remove(exchange);
			exchange.setEvent(null);
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
		Event other = (Event) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "ExchangeEvent [id=" + id + ", complete=" + complete + ", type=" + type + ", title=" + title + "]";
	}

}
