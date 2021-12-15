<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-6">
				<h1>Ho-Ho-Homies Gift Exchange</h1>
				<h2>Welcome to your best event organizer</h2>

				<form action="login.do" method="GET">
					<div class="mb-3">
						<label for="email" class="form-label">Email address</label> <input
							type="email" class="form-control" id="email" name="email">
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" id="password" name="password">
					</div>
					<button type="submit" class="btn btn-primary">Login</button>
					<a href="register.do" class="btn btn-secondary">Register</a>
				</form>

				<br> <br>
				<p>Need an account?
				<form action="register.do" method="GET">
					<input type="submit" value="Register" />
				</form>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>