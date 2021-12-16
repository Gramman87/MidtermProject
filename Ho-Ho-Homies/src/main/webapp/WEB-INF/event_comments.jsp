<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<!-- https://getbootstrap.com/docs/5.1/content/tables/ -->
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Posted By</th>
				<th>Comment</th>
				<th>Posted On</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty comments}">
					<c:forEach var="ec" items="${comments}">
						<tr>
							<td>${ec.exchange.user.firstName}</td>
							<td>${ec.content}</td>
							<td>${ec.postedOn}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">Be the first to comment on your upcoming
							event!</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>