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
		<div class="row">
			<img class="w-auto h-100"
				src="https://i.ibb.co/P6y2hTr/hohohomies.png" alt="hohohomies" />
		</div>

		<c:if test="${not empty message}">
			<div class="alert alert-danger" role="alert">${message}</div>
		</c:if>

		<div class="row">
			<div class="col-2">
				<a href="/dashboard"><button class="btn btn-success">Go
						Back</button></a>
			</div>
			<div class="col">
				<h3>Edit Profile</h3>
			</div>
			<div class="col-2">${user.firstName},${user.lastName}</div>
		</div>
		<form id="edit-form" method="POST">
			<div class="container">
				<div class="col-8">
					<div class="row mb-3">
						<div class="row mb-3">User Info:</div>
						<div class="row mb-3">
							<!-- Left -->
							<div class="col">
								<div class="row mb-3">
									<div class="col-3">First Name:</div>
									<div class="col">
										<input name="firstName" form="edit-form"
											class="form-control form-control-sm"
											value="${user.firstName}" />
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-3">Current Password:</div>
									<div class="col">
										<input name="password" form="edit-form"
											class="form-control form-control-sm" required />
									</div>
								</div>
							</div>
							<!-- Right -->
							<div class="col">
								<div class="row mb-3">
									<div class="col-3">Last Name:</div>
									<div class="col">
										<input name="lastName" form="edit-form"
											class="form-control form-control-sm" value="${user.lastName}" />
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-3">New Password:</div>
									<div class="col">
										<input name="newPassword" form="edit-form"
											class="form-control form-control-sm" />
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-3">Confirm New Password:</div>
									<div class="col">
										<input name="confirmNewPassword" form="edit-form"
											class="form-control form-control-sm" />
									</div>
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
												<input name="address.street1" form="edit-form"
													class="form-control form-control-sm"
													value="${user.address.street1}" />
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-3">Street 2:</div>
											<div class="col">
												<input name="address.street2" form="edit-form"
													class="form-control form-control-sm"
													value="${user.address.street2}" />
											</div>
										</div>
									</div>
									<!-- Right -->
									<div class="col">
										<div class="row mb-3">
											<div class="col-3">State:</div>
											<div class="col">
												<input name="address.state" form="edit-form"
													class="form-control form-control-sm"
													value="${user.address.state}" />
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-3">City:</div>
											<div class="col">
												<input name="address.city" form="edit-form"
													class="form-control form-control-sm"
													value="${user.address.city}" />
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-3">Zip Code:</div>
											<div class="col">
												<input name="address.zipcode" form="edit-form"
													class="form-control form-control-sm"
													value="${user.address.zipcode}" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<div class="row justify-content-right">
			<input type="submit" form="edit-form" class="btn btn-success"
				value="Update Profile" />
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>