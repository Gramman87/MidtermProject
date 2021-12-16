<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-6">
				<h1>Ho-Ho-Homies Gift Exchange</h1>
				<h2>Welcome to your best event organizer</h2>

				<form action="/login" method="POST">
					<div class="mb-3">
						<label for="email" class="form-label">Email address</label> <input
							type="email" class="form-control" id="email" name="email">
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" id="password"
							name="password">
					</div>
					<button type="submit" class="btn btn-primary">Login</button>
					<a href="register" class="btn btn-secondary">Register</a>
				</form>

				<c:if test="${not empty message}">
					<div class="alert alert-danger" role="alert">${message}</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>