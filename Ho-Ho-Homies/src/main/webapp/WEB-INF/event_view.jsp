<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<!-- Group Members -->
				<table class="table table-striped">
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
			</div>
			<div class="col">
				<div class="row">
					<!-- Event Image -->
					<img src="https://image.shutterstock.com/image-photo/decorated-christmas-tree-on-blurred-260nw-1201088539.jpg" width=100% height=100% />
				</div>
				<div class="row">
					<!-- Event Details -->
					<table class="table table-striped">
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
				</div>
				<div class="row">
					<!-- Event Rules -->
					<p>${event.customRules }</p>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<!-- User Links -->
					<p>Hello, ${exchange.user.firstName}</p>
					<a href="/dashboard">Go Back</a>
				</div>
				<div class="row">
					<!-- Event Comments -->
					<h1>Holliday Cheers</h1>

					<iframe src="/event/comments?id=${event.id}" title="comments"
						style=""></iframe>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>