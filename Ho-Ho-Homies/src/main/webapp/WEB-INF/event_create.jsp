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
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-10">
				<a href="https://ibb.co/hmNGWXg"><img
					src="https://i.ibb.co/P6y2hTr/hohohomies.png" alt="hohohomies"
					style="max-height: 100%; max-width: 100%;" /></a>
			</div>
		</div>
		<form id="create" method="POST">
			<div class="col-10">
				<label>Title: <input name="title" /></label>
			</div>

			<div class="col-90">
				<label>Type of Exchange <select name="type.name">
						<option>Secret Santa</option>
						<option>White Elephant</option>
						<option>Potluck</option>
						<option>Custom</option>
				</select></label>
			</div>

			<div class="col-10">
				<label>Custom Rules: </label>
			</div>
			<div class="col-90">
				<textarea name="type.description" rows="4"></textarea>
			</div>

			<div class="col-10">
				<label>Image (URL): </label>
			</div>
			<div class="col-90">
				<input name="imageURL" />
			</div>
			<div class="col-10">
				<label>Begins on: </label>
			</div>
			<div class="col-90">
				<input name="beginsOn" type="datetime-local" />
			</div>

			<div class="col-10">
				<label>RSVP by: </label>
			</div>
			<div class="col-90">
				<input name="rsvpBy" type="date" />
			</div>

			<div class="col-10">
				<label>Price Minimum: </label>
			</div>
			<div class="col-90">
				<input name="priceMin" type="number" value="1" />
			</div>

			<div class="col-10">
				<label>Price Maximum: </label>
			</div>
			<div class='col-90'>
				<input name="priceMax" type="number" value="10" />
			</div>

			<div class="col-10"><!-- where new column can start -->
				<p>Location</p>
				<div class="col-10">
					<label>Street: </label>
				</div>	
				<div class="col-90">	
					<input name="address.street1" />
				</div>
				<div class="col-10">
					<label>Street 2: </label>
				</div>	
				<div class="col-90">	
					<input name="address.street2" />
				</div>
				<div class="col-10">
					<label>State: </label>
				</div>
				<div class="col-90">						
					<input name="address.state" />
				</div>
				<div class="col-10">
					<label>City: </label>
				</div>	
				<div class="col-90">
					<input name="address.city" />
				</div>
				<div class="col-10">
					<label>Zipcode: </label>
				</div>
				<div class="col-90">
					<input name="address.zipcode" />
				</div>
			</div>

			<div id="invites-form" style="display: none"></div>
		</form>
		<div id="invites-preview">
			<p>Invites</p>
			<div>
				<input id="invite-input" type="text" />
				<button onclick="addInvitee()" class="btn btn-success">Add</button>
			</div>
		</div>

		<div>
			<input type="submit" form="create" class="btn btn-success"/>
		</div>
	</div>


</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>