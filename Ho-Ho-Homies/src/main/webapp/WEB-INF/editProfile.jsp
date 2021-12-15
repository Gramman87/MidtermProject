<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>

<c:if test="${not empty message}">
<div class="alert alert-danger" role="alert">
  ${message}
</div>
</c:if>

	<h2>Register your new account</h2>
	<form action="editProfile.do" method="POST">

		First Name:<input type="text" name="firstName" size="20" value="${user.firstName}" /> 
		<br>
		Last Name:<input type="text" name="lastName" size="20" value="${user.lastName}" /> 
		<br>
		*Current Password:<input type="password" name="password" size="20" required/> 
		<br>
		<br>
		New Password:<input type="password" name="newPassword" size="20" /> 
		<br>
		Confirm New Password:<input type="password" name="confirmNewPassword" size="20" />
		<br> 
		Street:<input type="text" name="address.street1" size="20" value="${user.address.street1}" /> 
		<br>
		Street 2:<input type="text" name="address.street2" size="20" value="${user.address.street2}" /> 
		<br>
		City:<input type="text" name="address.city" size="20" value="${user.address.city}" /> 
		<br>
		State:<input type="text" name="address.state" size="20" value="${user.address.state}" />
		<br> 
		Zip Code:<input type="text" name="address.zipcode" size="20" value="${user.address.zipcode}" /> 
		<br>
		<input type="submit" value="Submit" />
		<br>

	</form>
	<br>
	<a href="dashboard.do"><button>Go Back</button></a>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>