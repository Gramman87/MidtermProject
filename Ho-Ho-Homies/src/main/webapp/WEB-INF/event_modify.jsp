<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<c:choose>
	<c:when test="${event != null}">
		<c:set var="title" value="Modify Event" scope="application" />
	</c:when>
	<c:otherwise>
		<c:set var="title" value="Create Event" scope="application" />
	</c:otherwise>
</c:choose>
<c:set var="style" value="event/create.css" scope="application" />
<c:set var="script" value="event/create.js" scope="application" />
<c:import url="header.jsp" />
<body>
	<form id="create-form" method="POST">
		<div id="invites-form" style="display: none">
			<c:if test="${event==null }"></c:if>
			<input type="hidden" name="invites[]" value="${owner_email}">
		</div>
	</form>
	<div class="container">
		<div class="row">
			<a href="/"><img class="w-auto h-90" src="/img/logo.png" /></a>
		</div>

		<div class="row">
			<div class="col-2">
				<c:choose>
					<c:when test="${event != null}">
						<a href="/event/view?id=${event.id }"><button class="btn btn-success">Go Back</button></a>
					</c:when>
					<c:otherwise>
						<a href="/dashboard"><button class="btn btn-success">Go Back</button></a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col">
				<c:choose>
					<c:when test="${event != null}">
						<h3>Modify Event</h3>
					</c:when>
					<c:otherwise>
						<h3>Create Event</h3>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-2">${user.firstName},${user.lastName}</div>
		</div>

		<div class="row">
			<div class="col-8">
				<div class="row mb-3">
					<div class="col-3">Title:</div>
					<div class="col">
						<c:choose>
							<c:when test="${event != null}">
								<input name="title" form="create-form" class="form-control form-control-sm" value="${event.title}" required />
							</c:when>
							<c:otherwise>
								<input name="title" form="create-form" class="form-control form-control-sm" required />
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-3">Type of exchange:</div>
					<div class="col">
						<select name="type.name" form="create-form" class="form-control form-control-sm" required>
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
						<c:choose>
							<c:when test="${event != null}">
								<textarea name="customRules" form="create-form" class="form-control form-control-sm"
									placeholder="Happy campers!">${event.customRules}</textarea>
							</c:when>
							<c:otherwise>
								<textarea name="customRules" form="create-form" class="form-control form-control-sm"
									placeholder="Happy campers!"></textarea>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<!-- 	<div class="row mb-3">

					<div class="col-3">Image URL:</div>
					<div class="col">
						<input name="imageURL" form="create-form"
							class="form-control form-control-sm"
							placeholder="http://something.com/myimage.png" />
					</div>
				</div> -->

				<div class="row mb-3">
					<div class="col-3">Begins on:</div>
					<div class="col">
						<input name="beginsOn" type="datetime-local" form="create-form" class="form-control form-control-sm" required />
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-3">RSVP by:</div>
					<div class="col">
						<input name="rsvpBy" type="date" form="create-form" class="form-control form-control-sm" required />
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-3">Price Minimum:</div>
					<div class="col">
						<c:choose>
							<c:when test="${event != null}">
								<input name="priceMin" type="number" form="create-form" class="form-control form-control-sm"
									value="${event.priceMin}" required />
							</c:when>
							<c:otherwise>
								<input name="priceMin" type="number" form="create-form" class="form-control form-control-sm" required />
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-3">Price Maximum:</div>
					<div class="col">
						<c:choose>
							<c:when test="${event != null}">
								<input name="priceMax" type="number" value="10" form="create-form" class="form-control form-control-sm"
									value="${event.priceMax}" required />
							</c:when>
							<c:otherwise>
								<input name="priceMax" type="number" value="10" form="create-form" class="form-control form-control-sm" required />
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="row mb-3">
					<div class="row mb-3" style="font-weight: bold">Address:</div>
					<div class="row mb-3">
						<!-- Left -->
						<div class="col">
							<div class="row mb-3">
								<div class="col-3">Street 1:</div>
								<div class="col">
									<c:choose>
										<c:when test="${event != null}">
											<input name="address.street1" form="create-form" class="form-control form-control-sm"
												value="${event.address.street1}" />
										</c:when>
										<c:otherwise>
											<input name="address.street1" form="create-form" class="form-control form-control-sm" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-3">Street 2:</div>
								<div class="col">
									<c:choose>
										<c:when test="${event != null}">
											<input name="address.street2" form="create-form" class="form-control form-control-sm"
												value="${event.address.street2}" />
										</c:when>
										<c:otherwise>
											<input name="address.street2" form="create-form" class="form-control form-control-sm" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<!-- Right -->
						<div class="col">
							<div class="row mb-3">
								<div class="col-3">State:</div>
								<div class="col">
									<c:choose>
										<c:when test="${event != null}">
											<input name="address.state" form="create-form" class="form-control form-control-sm"
												value="${event.address.state }" />
										</c:when>
										<c:otherwise>
											<input name="address.state" form="create-form" class="form-control form-control-sm" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-3">City:</div>
								<div class="col">
									<c:choose>
										<c:when test="${event != null}">
											<input name="address.city" form="create-form" class="form-control form-control-sm"
												value="${event.address.city }" />
										</c:when>
										<c:otherwise>
											<input name="address.city" form="create-form" class="form-control form-control-sm" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-3">Zip Code:</div>
								<div class="col">
									<c:choose>
										<c:when test="${event != null}">
											<input name="address.zipcode" form="create-form" class="form-control form-control-sm" maxlength="5"
												value="${event.address.zipcode }" />
										</c:when>
										<c:otherwise>
											<input name="address.zipcode" form="create-form" class="form-control form-control-sm" maxlength="5" />
										</c:otherwise>
									</c:choose>
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
						<input id="invite-input" type="text" form="create-form" class="form-control form-control-sm"
							placeholder="someone@email.com" />
					</div>
					<div class="col">
						<button onclick="addInvitee()" class="btn btn-success btn-sm w-100">Add</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row justify-content-right">
			<c:choose>
				<c:when test="${event!=null}">
					<input type="submit" form="create-form" class="btn btn-success" value="Update Event" />
				</c:when>
				<c:otherwise>
					<input type="submit" form="create-form" class="btn btn-success" value="Create Event" />
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
<c:if test="${event != null}">
	<script>
		beginsOn = '${beginsOnIso}'
		rsvpBy = '${rsvpByIso}'
	</script>
</c:if>
<jsp:include page="footer.jsp"></jsp:include>
</html>
