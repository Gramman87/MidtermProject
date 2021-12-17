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
			<div class="col-8">
				<a href="https://ibb.co/hmNGWXg"><img
					src="https://i.ibb.co/P6y2hTr/hohohomies.png" alt="hohohomies"
					style="max-height: 100%; max-width: 100%;" /></a>
			
		
		<form id="create" method="POST">
			<div class="col-md-8">
				<label class="form-label">Title: </label>
				<input name="title" class="form-control"/>
			</div>
			<div class="col-md-8">
				<label class="form-label">Type of Exchange </label>
				<select name="type.name" class="form-control">
						<option>Secret Santa</option>
						<option>White Elephant</option>
						<option>Potluck</option>
						<option>Custom</option>
				</select>
			</div>
			<div class="col-md-8">
				<label class="form-label">Custom Rules: </label>
				<textarea name="type.description" rows="4" class="form-control"></textarea>
			</div>
			<div class="col-md-8">
				<label class="form-label">Image (URL): </label> 
				<input name="imageURL" class="form-control"/>
			</div>
			<div class="col-md-8">
				<label class="form-label">Begins on: </label> 
				<input name="beginsOn" type="datetime-local" class="form-control"/>
			</div>
			<div class="col-md-8">
				<label class="form-label">RSVP by: </label> 
				<input name="rsvpBy" type="date" class="form-control" />
			</div>
			<div class="col-md-8">
				<label class="form-label">Price Minimum: </label> 
				<input name="priceMin" type="number" value="1" class="form-control"/>
			</div>
			<div class="col-md-8">
				<label class="form-label">Price Maximum: </label> 
				<input name="priceMax" type="number" value="10" class="form-control"/>
			</div>
			<div class="col-md-8">
				<!-- where new column can start -->
				<p>Location</p>
				<div class="col-md-8">
					<label class="form-label">Street: </label> 
					<input name="address.street1" class="form-control"/>
				</div>
				<div class="col-md-8">
					<label class="form-label">Street 2: </label> 
					<input name="address.street2" class="form-control"/>
				</div>
				<div class="col-md-8">
					<label class="form-label">State: </label> 
					<input name="address.state" class="form-control"/>
				</div>
				<div class="col-md-8">
					<label class="form-label">City: </label> 
					<input name="address.city" class="form-control"/>
				</div>
				<div class="col-md-8">
					<label class="form-label">Zipcode: </label> 
					<input name="address.zipcode" class="form-control"/>
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
			<input type="submit" form="create" class="btn btn-success" />
		</div>
	</div>
	</div>
	</div>


</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>