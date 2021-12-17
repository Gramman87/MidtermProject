<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<!-- https://getbootstrap.com/docs/5.1/content/tables/ -->
	<table class="table table-striped table-danger table-hover">
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
							<td>
								<div class="dropdown">
									<button
										class="btn btn-secondary btn-sm dropdown-toggle btn-success"
										type="button" id="dropdownMenuButton1"
										data-bs-toggle="dropdown" aria-expanded="false">Action</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
										<li><a class="dropdown-item" href="${w.shoppingURL}"
											target="_blank">Open</a></li>
										<li><a class="dropdown-item"
											href="/wishlist/remove?id=${w.id}">Remove</a></li>
									</ul>
								</div>
							</td>
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
		<button class="btn btn-secondary btn-sm btn-success" type="button"
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
<jsp:include page="footer.jsp"></jsp:include>
</html>