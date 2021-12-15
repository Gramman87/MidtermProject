<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<style>
table {
	font-family: arial, sans-serif;
	border: 1px solid black;
	width: 80px;
}

td, th {
	border: .5px solid black;
	border-collapse: collapse;
	text-align: left;
	padding: 5px;
}

tr:nth-child(even) {
	background-color: #eb726a;
}
</style>
</head>
<body>
	<div id="Repeat_Grid_1">
		<div id="Group" class="">
			<div id="Welcome_User">
				<span>Welcome ${user.firstName}</span>
			</div>
		</div>
		<div id="Group_p" class="">
			<div id="Logout">
				<span><a href="logout.do">Logout</a></span>
			</div>
		</div>
	</div>

	<h1>Welcome ${user.firstName}</h1>
	<h2>
		<a href="logout.do">Logout</a>
	</h2>


	<h2>Your WishList</h2>

	<c:choose>
		<c:when test="${not empty user.wishlist}">
			<table>
				<tr>
					<th>Name</th>
					<th>Description</th>
					<th>Cost</th>
					<th>Link</th>
				</tr>
				<c:forEach var="w" items="${user.wishlist}">
					<tr>
						<td>${w.name}</td>
						<td>${w.description}</td>
						<td>${w.cost}</td>
						<td><a href="${w.shoppingURL}">Shop now</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>No items in wishlist!</c:otherwise>
	</c:choose>

	<h2>Your Exchanges</h2>

	<table>
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
				<td><a href="getEventData.do?eId=${e.event.id}">View</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>




