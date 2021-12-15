<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wishlist</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- https://getbootstrap.com/docs/5.1/content/tables/ -->
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Name</th>
				<th>Description</th>
				<th>Cost</th>
				<th>Link</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty items}">
					<c:forEach var="w" items="${items}">
						<tr>
							<td>${w.name}</td>
							<td>${w.description}</td>
							<td>${w.cost}</td>
							<td><a href="${w.shoppingURL}">Shop now</a></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">No items in wishlist!</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

	<!-- https://getbootstrap.com/docs/5.1/components/collapse/ -->
	<p>
		<button class="btn btn-secondary btn-sm" type="button"
			data-bs-toggle="collapse" data-bs-target="#wishlistAdd"
			aria-expanded="false" aria-controls="wishlistAdd">Add</button>
	</p>
	<div class="collapse" id="wishlistAdd">
		<div class="card card-body">
			<form method="POST">
				<div>
					<label>Name:</label><input name="name"
						class="form-control form-control-sm" maxlength="80" />
				</div>
				<div>
					<label>Description:</label><input name="description"
						class="form-control form-control-sm" maxlength="80" />
				</div>
				<div>
					<label>Cost:</label><input name="cost"
						class="form-control form-control-sm" type="number" min="0" />
				</div>
				<div>
					<label>Shopping URL:</label><input name="shoppingURL"
						class="form-control form-control-sm" maxlength="200" />
				</div>
				<input class="btn btn-primary btn-sm" type="submit" value="Submit">
			</form>
		</div>
	</div>
</body>
</html>