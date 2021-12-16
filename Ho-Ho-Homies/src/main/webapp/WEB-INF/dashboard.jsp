<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
<<<<<<< HEAD:Ho-Ho-Homies/src/main/webapp/WEB-INF/userDashboard.jsp
=======
	<div id="Repeat_Grid_1">
		<div id="Group" class="">
			<div id="Welcome_User">
				<span>Welcome ${user.firstName}</span>
			</div>
		</div>
		<div id="Group_p" class="">
			<div id="Logout">
				<span><a href="logout">Logout</a></span> <span><a
					href="/profile/edit?id=${user.id}">Profile</a></span>
			</div>
		</div>
	</div>
>>>>>>> 570a2d17ba9e12dc40e862a7f808217c24f9efa4:Ho-Ho-Homies/src/main/webapp/WEB-INF/dashboard.jsp

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-6">

				<div id="justify-content-right">
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

<<<<<<< HEAD:Ho-Ho-Homies/src/main/webapp/WEB-INF/userDashboard.jsp
=======

	<!-- https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe -->
	<iframe src="/wishlist" title="Wishlist" width="512" height="512"></iframe>
>>>>>>> 570a2d17ba9e12dc40e862a7f808217c24f9efa4:Ho-Ho-Homies/src/main/webapp/WEB-INF/dashboard.jsp

				<h2>Your WishList</h2>

				<!-- https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe -->
				<iframe src="wishlist.do" title="Wishlist" width="512" height="512"></iframe>

<<<<<<< HEAD:Ho-Ho-Homies/src/main/webapp/WEB-INF/userDashboard.jsp
				<h2>Your Exchanges</h2>
=======
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
>>>>>>> 570a2d17ba9e12dc40e862a7f808217c24f9efa4:Ho-Ho-Homies/src/main/webapp/WEB-INF/dashboard.jsp


				<table id="exchange-table" class="table table-success table-striped">
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

			</div>
		</div>
	</div>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>




