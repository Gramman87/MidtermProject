<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wishlist</title>
<style>
table {
	font-family: arial, sans-serif;
	border: 1px solid black;
	width: 100%;
	height: 100%;
}

td, th {
	border: .5px solid black;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #eb726a;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${not empty items}">
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
						<td>${w.shoppingURL}</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>No items in wishlist!</c:otherwise>
	</c:choose>
</body>
</html>