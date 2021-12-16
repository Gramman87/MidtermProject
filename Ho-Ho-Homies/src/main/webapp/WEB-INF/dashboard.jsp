<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<c:set var="title" value="Create Event" scope="application" />
<c:set var="style" value="stringLightBanner/stringLight.css"
	scope="application" />
<c:set var="script" value="event/create.js" scope="application" />
<c:import url="header.jsp" />
<body style="background-color: black;">
	<div class="container">
		<div class="row">
			<div class="col-3">
				<a href="https://ibb.co/hmNGWXg"><img
					src="https://i.ibb.co/P6y2hTr/hohohomies.png" alt="hohohomies"
					style="max-height: 100%; max-width: 100%;" /></a>
			</div>
			<div class="col">

				<!-- String Light Testing -->
				<section class="light-bulbs">
					<div class="light-bulb theme-color-one"></div>
					<div class="light-bulb theme-color-two"></div>
					<div class="light-bulb theme-color-three"></div>
					<div class="light-bulb theme-color-four"></div>
					<div class="light-bulb theme-color-one"></div>
					<div class="light-bulb theme-color-two"></div>
				</section>
				<!-- String Light Testing -->

			</div>
			<div class="col">
				<div class="selection-container">
					<div id="Welcome_User">
						<span>Welcome ${user.firstName}</span>
					</div>

					<div id="logout-edit" style="color: #45bf65; text-align: right;">
						<div id="Logout">
							<span><a href="logout" class="btn btn-success">Logout</a></span>
							<span><a href="/profile/edit?id=${user.id}"
								class="btn btn-success">Profile</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col">
				<div class="wishlist-header">
					<h2>Your Wishlist</h2>
				</div>
				<iframe src="/wishlist" title="Wishlist"
					style="width: 100%; height: 100%;"></iframe>
			</div>
			<div class="col">
				<div class="exchanges-header">
					<h2>Your Exchanges</h2>
				</div>
				<table id="exchange-table" class="table table-danger table-striped">
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>Members</th>
						<th>Date</th>
						<th>Actions</th>
					</tr>
					<c:forEach var="e" items="${user.exchanges}">
						<tr>
							<td>${e.event.title}</td>
							<td>${e.event.type.name}</td>
							<td># of members</td>
							<td>${e.event.beginsOn}</td>
							<td><a href="/event/view?id=${e.event.id}"
								class="btn btn-sm">View</a></td>
						</tr>
					</c:forEach>
				</table>
				<br> <a href="/event/create"
					class="btn btn-secondary btn-success btn-sm" id="create-exchange">Create
					Event</a>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>




