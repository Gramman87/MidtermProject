<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<h1>Ho-Ho-Homies Gift Exchange</h1>
	<h2>Welcome to your best event organizer</h2>
	<form action="login.do" method="GET">
		User Name: <input type="text" name="email" size="20" /> <br>
		Password: <input type="password" name="password" size="20" /> <br>
		<input type="submit" value="Log In" />
	</form>
	<br>
	<br>
	<p>Need an account?
	<form action="register.do" method="GET">
		<input type="submit" value="Register" />
	</form>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>