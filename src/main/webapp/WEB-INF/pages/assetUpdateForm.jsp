<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title><c:out value="${page }"></c:out></title>
</head>
<body>

	<div>
		<h1>Edit page....</h1>
		<form:form action="${pageContext.request.contextPath }/saveAsset"
			method="post" modelAttribute="asset">
			<div class="form-group" Style="width: 500px; margin: 30px auto">
				<%-- 						<form:input path="id" cssClass="form-control" --%>
				<%-- 							placeholder="Enter id" /> --%>
				<!-- 						<br> -->
				<input type="hidden" value="${asset.id }" name="id">
				<form:input path="type" cssClass="form-control"
					placeholder="Enter Asset type..." />
				<br>
				<form:input path="quantity" cssClass="form-control"
					placeholder="Enter quantity..." />
				<br>
				<form:input path="avl" cssClass="form-control"
					placeholder="Enter avl quantity..." />
				<br>
				<div class="container text-center">
					<a href="${pageContext.request.contextPath }/assets">
						<button type="button" class="btn btn-outline-danger">Back</button>
					</a>
					<button class="btn btn-outline-success">Save</button>
				</div>
			</div>
		</form:form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>