<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${title != null}">
		<title>Ho-Ho-Homies - ${title}</title>
	</c:when>
	<c:otherwise>
		<title>Ho-Ho-Homies</title>
	</c:otherwise>
</c:choose>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css">
<c:forTokens var="style" items="${style}" delims=",">
	<link rel="stylesheet" href="/css/${style}">
</c:forTokens>
</head>