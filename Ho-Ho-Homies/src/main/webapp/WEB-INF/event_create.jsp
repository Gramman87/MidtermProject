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
	<form id="create-form" method="POST">
		<div id="invites-form" style="display: none">
			<input type="hidden" name="invites[]" value="${owner_email}">
		</div>
	</form>
	<div class="container">
		<div class="row">
			<img class="w-auto h-100"
				src="https://i.ibb.co/P6y2hTr/hohohomies.png" alt="hohohomies" />
		</div>

		<div class="row">
			<div class="col-2">
				<a href="/dashboard"><button class="btn btn-success">Go
						Back</button></a>
			</div>
			<div class="col">
				<h3>Create Event</h3>
			</div>
			<div class="col-2">${user.firstName}, ${user.lastName}</div>
		</div>

		<div class="row">

			<div class="col-8">

				<div class="row mb-3">
					<div class="col-3">Title:</div>
					<div class="col">
						<input name="title" form="create-form"
							class="form-control form-control-sm" required />
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-3">Type of exchange:</div>
					<div class="col">
						<select name="type.name" form="create-form"
							class="form-control form-control-sm" required>
							<option>Secret Santa</option>
							<option>White Elephant</option>
							<option>Potluck</option>
							<option>Custom</option>
						</select>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-3">Custom Rules:</div>
					<div class="col">
						<textarea name="type.description" form="create-form"
							class="form-control form-control-sm" placeholder="Happy campers!"></textarea>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-3">Image URL:</div>
					<div class="col">
						<input name="imageURL" form="create-form"
							class="form-control form-control-sm"
							placeholder="http://something.com/myimage.png" />
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-3">Begins on:</div>
					<div class="col">
						<input name="beginsOn" type="datetime-local" form="create-form"
							class="form-control form-control-sm" required />
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-3">RSVP by:</div>
					<div class="col">
						<input name="rsvpBy" type="date" form="create-form"
							class="form-control form-control-sm" required />
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-3">Price Minimum:</div>
					<div class="col">
						<input name="priceMin" type="number" value="1" form="create-form"
							class="form-control form-control-sm" required />
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-3">Price Maximum:</div>
					<div class="col">
						<input name="priceMax" type="number" value="10" form="create-form"
							class="form-control form-control-sm" required />
					</div>
				</div>

				<div class="row mb-3">
					<div class="row mb-3">Address:</div>
					<div class="row mb-3">
						<!-- Left -->
						<div class="col">
							<div class="row mb-3">
								<div class="col-3">Street 1:</div>
								<div class="col">
									<input name="address.street1" form="create-form"
										class="form-control form-control-sm" />
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-3">Street 2:</div>
								<div class="col">
									<input name="address.street2" form="create-form"
										class="form-control form-control-sm" />
								</div>
							</div>
						</div>
						<!-- Right -->
						<div class="col">
							<div class="row mb-3">
								<div class="col-3">State:</div>
								<div class="col">
									<input name="address.state" form="create-form"
										class="form-control form-control-sm" />
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-3">City:</div>
								<div class="col">
									<input name="address.city" form="create-form"
										class="form-control form-control-sm" />
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-3">Zip Code:</div>
								<div class="col">
									<input name="address.zipcode" form="create-form"
										class="form-control form-control-sm" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-4">
				<div class="row mb-3">
					<h2>Invites</h2>
				</div>

				<div id="invites-preview" class="row mb-3"></div>

				<div class="row mb-3">
					<div class="col-8">
						<input id="invite-input" type="text" form="create-form"
							class="form-control form-control-sm"
							placeholder="someone@email.com" />
					</div>
					<div class="col">
						<button onclick="addInvitee()"
							class="btn btn-success btn-sm w-100">Add</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row justify-content-right">
			<input type="submit" form="create-form" class="btn btn-success"
				value="Create Event" />
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>