<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
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


	<h2>Your WishList</h2>

	<!-- https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe -->
	<iframe src="wishlist.do" title="Wishlist" width="300" height="512"></iframe>

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
				<td><a href="getEventData.do?eId=${e.event.id}">View</a></td>
			</tr>
		</c:forEach>
	</table>


</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>




