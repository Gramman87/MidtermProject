<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>

	<table>
		<thead>
			<tr>
				<th>Hello, ${exchange.user.firstName}</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a href="/dashboard">Go Back</a></td>
			</tr>
		</tbody>
	</table>

	<table>
		<thead>
			<tr>
				<th>Event Details:</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Start Date: ${event.beginsOn }</td>
			</tr>
			<tr>
				<td>Location: ${event.address }</td>
			</tr>
			<tr>
				<td>Maximum Item Cost: ${event.priceMax }</td>
			</tr>
			<tr>
				<td>Minimum Item Cost: ${event.priceMin }</td>
			</tr>
			<tr>
				<td>Your Recipient: ${exchange.giftee.firstName}
					${exchange.giftee.lastName}</td>
			</tr>

		</tbody>

	</table>
	<br>
	<table>
		<thead>
			<tr>
				<th>Group Members</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="e" items="${event.exchanges}">
				<tr>
					<td><c:choose>

							<c:when test="${exchange.giftee == e.user }">
								<a data-bs-toggle="collapse" href="#collapseExample"
									aria-expanded="false" aria-controls="collapseExample">
									${e.user.firstName} ${e.user.lastName} (Recipient)</a>

								<div class="collapse" id="collapseExample">
									<div class="card card-body">
										<table>
											<thead>
												<tr>
													<th>Name</th>
													<th>Cost</th>
													<th>Description</th>
													<th>Link</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${e.user.wishlist}">
													<tr>
														<td>${item.name }</td>
														<td>${item.cost }</td>
														<td>${item.description }</td>
														<td><a href="${item.shoppingURL }" target="_blank">Look</a></td>
													</tr>
												</c:forEach>
											</tbody>


										</table>
									</div>
								</div>
							</c:when>

							<c:otherwise>
								${e.user.firstName} ${e.user.lastName}
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>

	<table>
		<thead>
			<tr>
				<th>Rules:</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${event.customRules }</td>
			</tr>
		</tbody>
	</table>
	
	<br>
	<div>
		<h1>Holliday Cheers</h1>

		<iframe src="/event/comments?id=${event.id}" title="comments" width="512" height="512"></iframe>
	</div>
	
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>