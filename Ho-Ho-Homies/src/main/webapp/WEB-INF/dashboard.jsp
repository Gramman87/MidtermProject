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
<div class="container" >
	<div id="Welcome_User">
		<span>Welcome ${user.firstName}</span>
	</div>

	<div id="logout-edit">
		<div id="Logout">
			<span><a href="logout">Logout</a></span> <span><a
				href="/profile/edit?id=${user.id}">Profile</a></span>
		</div>
	</div>


<div class="dashboard-tables">
	<div class="col-2">
		<h2>Your WishList</h2>

		<!-- https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe -->
		<iframe src="/wishlist" title="Wishlist" width="512" height="512"></iframe>

<div class="exchange-table-with-header">
		<h2>Your Exchanges</h2>

		<table id="exchange-table">
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
</div>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>




