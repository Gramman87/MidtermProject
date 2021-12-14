<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<style>
table {
  font-family: arial, sans-serif;
  border: 1px solid black;
  width: 30px;
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
		<td># of members</td>
		<td>${event.beginsOn}</td>
		<td>View<td>
	</tr>		
</table>

</body>
</html>