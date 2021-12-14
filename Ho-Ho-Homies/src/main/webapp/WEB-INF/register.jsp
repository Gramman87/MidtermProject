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

	<form action="registerNew.do" method="POST">

		*First Name:<input type="text" name="firstName" size="20" /> 
		<br>
		*Last Name:<input type="text" name="lastName" size="20" /> 
		<br>
		*Password:<input type="password" name="password" size="20" /> 
		<br>
		*Confirm Password:<input type="password" name="confirmPassword" size="20" />
		<br> 
		*Email:<input type="text" name="email" size="20" /> 
		<br>
		*Confirm Email:<input type="text" name="confirmEmail" size="20" />
		<br>
		Street:<input type="text" name="street1" size="20" /> 
		<br>
		Street 2:<input type="text" name="street2" size="20" /> 
		<br>
		City:<input type="text" name="city" size="20" /> 
		<br>
		State:<input type="text" name="state" size="20" />
		<br> 
		Zip Code:<input type="text" name="zipcode" size="20" /> 
		<br>
		<input type="submit" name="registerAccount" value="Submit" />
		<br>
		*required
		

	</form>
	<br>
	<form action="home.do" method="GET">
	<input type="submit" name="home" value="Return Home"/>
	</form>


</body>
</html>