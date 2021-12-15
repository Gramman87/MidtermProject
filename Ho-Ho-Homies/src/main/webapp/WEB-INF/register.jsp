<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12">

				<c:if test="${not empty message}">
					<div class="alert alert-danger" role="alert">${message}</div>
				</c:if>

				<h2>Register your new account</h2>
				<form action="register.do" method="POST">


					<div class="col-md-6">
						<label for="inputFirstName" class="form-label">*First Name</label>
						<input type="text" class="form-control" name="firstName" required>
					</div>
					
					<div class="col-md-6">
						<label for="inputLastName" class="form-label">*Last Name</label> 
						<input type="text" class="form-control" name="lastName" required>
					</div>
					
					<div class="col-md-6">
						<label for="inputPassword" class="form-label">*Password</label> 
						<input type="password" class="form-control" name="password" required>
					</div>
					
					<div class="col-md-6">
						<label for="inputPassword2" class="form-label">*Confirm	Password</label> 
						<input type="password" class="form-control" name="confirmPassword" required>
					</div>
					
					<div class="col-md-6">
						<label for="inputEmail" class="form-label">*Email</label> 
						<input type="email" class="form-control" name="email" required>
					</div>
					
					<div class="col-md-6">
						<label for="inputEmail2" class="form-label">*Confirm Email</label> 
						<input type="email" class="form-control" name="confirmEmail">
					</div>
					
					<div class="col-12">
						<label for="inputAddress" class="form-label">Address</label> 
						<input type="text" class="form-control" name="address.street1">
					</div>
					
					<div class="col-12">
						<label for="inputAddress2" class="form-label">Address 2</label> 
						<input type="text" class="form-control" name="address.street2">
					</div>
					
					<div class="col-md-6">
						<label for="inputCity" class="form-label">City</label> 
						<input type="text" class="form-control" name="address.city">
					</div>
					
					<div class="col-md-4">
						<label for="inputState" class="form-label">State</label> 
						<select	id="inputState" class="form-select" name="address.state">
							<option selected>Choose...</option>
							<option value="AL">Alabama</option>
							<option value="AK">Alaska</option>
							<option value="AZ">Arizona</option>
							<option value="AR">Arkansas</option>
							<option value="CA">California</option>
							<option value="CO">Colorado</option>
							<option value="CT">Connecticut</option>
							<option value="DE">Delaware</option>
							<option value="DC">District Of Columbia</option>
							<option value="FL">Florida</option>
							<option value="GA">Georgia</option>
							<option value="HI">Hawaii</option>
							<option value="ID">Idaho</option>
							<option value="IL">Illinois</option>
							<option value="IN">Indiana</option>
							<option value="IA">Iowa</option>
							<option value="KS">Kansas</option>
							<option value="KY">Kentucky</option>
							<option value="LA">Louisiana</option>
							<option value="ME">Maine</option>
							<option value="MD">Maryland</option>
							<option value="MA">Massachusetts</option>
							<option value="MI">Michigan</option>
							<option value="MN">Minnesota</option>
							<option value="MS">Mississippi</option>
							<option value="MO">Missouri</option>
							<option value="MT">Montana</option>
							<option value="NE">Nebraska</option>
							<option value="NV">Nevada</option>
							<option value="NH">New Hampshire</option>
							<option value="NJ">New Jersey</option>
							<option value="NM">New Mexico</option>
							<option value="NY">New York</option>
							<option value="NC">North Carolina</option>
							<option value="ND">North Dakota</option>
							<option value="OH">Ohio</option>
							<option value="OK">Oklahoma</option>
							<option value="OR">Oregon</option>
							<option value="PA">Pennsylvania</option>
							<option value="RI">Rhode Island</option>
							<option value="SC">South Carolina</option>
							<option value="SD">South Dakota</option>
							<option value="TN">Tennessee</option>
							<option value="TX">Texas</option>
							<option value="UT">Utah</option>
							<option value="VT">Vermont</option>
							<option value="VA">Virginia</option>
							<option value="WA">Washington</option>
							<option value="WV">West Virginia</option>
							<option value="WI">Wisconsin</option>
							<option value="WY">Wyoming</option>
						</select>
					</div>
					
					<div class="col-md-2">
						<label for="inputZip" class="form-label">Zip</label> <input
							type="text" class="form-control" name="address.zipcode">
					</div>
					<br>
					<input type="submit" name="registerAccount" value="Submit"/> 
					<br>
					*required

				</form>
				<br>
				<form action="home.do" method="GET">
					<input type="submit" name="home" value="Return Home" />
				</form>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>