<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Details</title>
</head>
<body>

<table>
	<thead>
		<tr>
			<th>Hello, ${user.firstName}</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><a href="logout.do">Logout</a></td>
		</tr>
	</tbody>
</table>

<table>
	<thead>
		<tr>
			<th>Event Details:</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Start Date: ${event.beginsOn } </td>
		</tr>
		<tr>
			<td>Location: ${event.address } </td>
		</tr>
		<tr>
			<td>Maximum Item Cost: ${event.priceMax }</td>
		</tr>
		<tr>
			<td>Minimum Item Cost: ${event.priceMin }</td>
		</tr>
		<tr>
			<td>Your Recipient: </td>
		</tr>
		
	</tbody>

</table>
<br>
<table>
	<thead>
		<tr>
			<th>Group Members: </th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="e" items="${event.exchanges}">
			<tr>
				<td>${e.user.firstName}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<br>
<table>
	<thead>
		<tr>
			<th>Rules: </th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${event.customRules }</td>
		</tr>
	</tbody>
</table>
</body>
</html>