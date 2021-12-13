<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register New Account</title>
</head>
<body>

	<h2>Register your new account</h2>

	<form action="register.do" method="GET">

		First Name:<input type="text" name="firstName" size="20" /> 
		<br>
		Last Name:<input type="text" name="lastName" size="20" /> 
		<br>
		Password:<input type="text" name="password" size="20" /> 
		<br>
		Confirm Password:<input type="text" name="confirmPassword" size="20" />
		<br> 
		Email:<input type="text" name="email" size="20" /> 
		<br>
		Confirm Email:<input type="text" name="confirmEmail" size="20" />
		<br>
		<input type="submit" name="registerAccount" value="Submit" />

	</form>
	<br>
	<form action="home.do" method="GET">
	<input type="submit" name="home" value="Return Home"/>
	</form>


</body>
</html>