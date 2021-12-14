<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</body>
</html>