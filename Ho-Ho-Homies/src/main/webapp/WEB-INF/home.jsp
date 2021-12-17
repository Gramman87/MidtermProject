<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<c:set var="title" value="Create Event" scope="application" />
<c:set var="style" value="stringLightBanner/stringLight.css" scope="application" />
<c:set var="script" value="event/create.js" scope="application" />
<c:import url="header.jsp" />
<body>
<!-- String Light Testing -->
	  <section class="light-bulbs">
      	<div class="light-bulb theme-color-one"></div>
	      <div class="light-bulb theme-color-two"></div>
	      <div class="light-bulb theme-color-three"></div>
	      <div class="light-bulb theme-color-four"></div>
	      <div class="light-bulb theme-color-one"></div>
	      <div class="light-bulb theme-color-two"></div>
	      
   	 </section>
	<!-- String Light Testing -->
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-8">
				<a href="/"><img
					src="/img/logo.png" style="max-height:100%; max-width:100%;"/></a>
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
					<button type="submit" class="btn btn-primary btn-success">Login</button>
					<a href="register" class="btn btn-secondary btn-danger">Register</a>
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