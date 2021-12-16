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
			<div class="col-9">LOGO HERE fhdkfhsk</div>
			<div class="col">
				<div class="selection-container">
					<div id="Welcome_User">
						<span>Welcome ${user.firstName}</span>
					</div>

					<div id="logout-edit">
						<div id="Logout">
							<span><a href="logout">Logout</a></span> <span><a
								href="/profile/edit?id=${user.id}">Profile</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<iframe src="/wishlist" title="Wishlist"
					style="width: 100%; height: 100%;"></iframe>
			</div>
			<div class="col">
				<table id="exchange-table" class="table table-striped">
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
							<td><a href="/event/view?id=${e.event.id}">View</a></td>
						</tr>
					</c:forEach>
				</table>
				<br> <a href="/event/create" class="btn btn-secondary">Create
					Event</a>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>




