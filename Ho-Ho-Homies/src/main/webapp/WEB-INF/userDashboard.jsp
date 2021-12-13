<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
</head>
<body>

<h1>Welcome ${user.firstName}</h1>


<h2>Your WishList</h2>
<h2>Your Exchanges</h2>

<table>
	<tr>
		<th>Name</th>
		<th>Type</th>
		<th>Members</th>
		<th>Date</th>
		<th>Actions</th>
	</tr>
	<tr>
		<td>${event.title}</td>
		<td>${event.type}</td>	
		<td><!-- count of users --></td>
		<td>${event.beginsOn}</td>
		<td><!-- add link to event exchange page --><td>
	</tr>		
</table>

</body>
</html>