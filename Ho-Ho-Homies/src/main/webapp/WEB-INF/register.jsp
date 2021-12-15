<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>

<c:if test="${message != null}">
<div class="alert alert-danger" role="alert">
  ${message}
</div>
</c:if>

	<h2>Register your new account</h2>
	<form action="register.do" method="POST">

		*First Name:<input type="text" name="firstName" size="20" required/> 
		<br>
		*Last Name:<input type="text" name="lastName" size="20" required/> 
		<br>
		*Password:<input type="password" name="password" size="20" required/> 
		<br>
		*Confirm Password:<input type="password" name="confirmPassword" size="20" />
		<br> 
		*Email:<input type="text" name="email" size="20" /> 
		<br>
		*Confirm Email:<input type="text" name="confirmEmail" size="20" />
		<br>
		Street:<input type="text" name="address.street1" size="20" /> 
		<br>
		Street 2:<input type="text" name="address.street2" size="20" /> 
		<br>
		City:<input type="text" name="address.city" size="20" /> 
		<br>
		State:<input type="text" name="address.state" size="20" />
		<br> 
		Zip Code:<input type="text" name="address.zipcode" size="20" /> 
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
<jsp:include page="footer.jsp"></jsp:include>
</html>