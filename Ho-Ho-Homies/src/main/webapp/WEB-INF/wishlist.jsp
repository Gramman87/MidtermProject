<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wishlist</title>
</head>
<body>
	<c:if action="wishlist.do" test="${not empty items}" />
	<table>
		<thead>
			<tr>
				<th>${user.firstName}'sWishlist</th>
			<tr>
				<th>Name</th>
				<th>Type</th>
				<th>Cost</th>
				<th>Link</th>
			<tr>
		</thead>
		<tbody>
			<c:forEach var="w" items="${items}">
				<tr>
					<td>${w.name}</td>
					<td>${w.type}</td>
					<td>${w.cost}</td>
					<td>${w.url}</td>
				<tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>