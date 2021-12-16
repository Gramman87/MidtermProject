<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<c:set var="title" value="Create Event" scope="application" />
<c:set var="style" value="event/create.css" scope="application" />
<c:set var="script" value="event/create.js" scope="application" />
<c:import url="header.jsp" />
<body>

	<form id="create" method="POST">
		<div>
			<label>Title: <input name="title" /></label>
		</div>

		<div>
			<label>Type of Exchange <select name="type.name">
					<option>Secret Santa</option>
					<option>White Elephant</option>
					<option>Potluck</option>
					<option>Custom</option>
			</select></label>
		</div>

		<div>
			<label>Custom Rules: <textarea name="type.description"
					rows="4" cols="120"></textarea></label>
		</div>

		<div>
			<label>Image (URL): <input name="imageURL" /></label>
		</div>

		<div>
			<label>Begins on: <input name="beginsOn"
				type="datetime-local" /></label>
		</div>

		<div>
			<label>RSVP by: <input name="rsvpBy" type="date" /></label>
		</div>

		<div>
			<label>Price Minimum: <input name="priceMin" type="number"
				value="1" /></label>
		</div>

		<div>
			<label>Price Maximum: <input name="priceMax" type="number"
				value="10" /></label>
		</div>

		<div>
			<p>Location</p>
			<div>
				<label>Street: <input name="address.street1" /></label>
			</div>
			<div>
				<label>Street 2: <input name="address.street2" /></label>
			</div>
			<div>
				<label>State: <input name="address.state" /></label>
			</div>
			<div>
				<label>City: <input name="address.city" /></label>
			</div>
			<div>
				<label>Zipcode: <input name="address.zipcode" /></label>
			</div>
		</div>

		<div id="invites-form" style="display: none"></div>
	</form>

	<div id="invites-preview">
		<p>Invites</p>
		<div>
			<input id="invite-input" type="text" />
			<button onclick="addInvitee()">Add</button>
		</div>
	</div>

	<div>
		<input type="submit" form="create" />
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>