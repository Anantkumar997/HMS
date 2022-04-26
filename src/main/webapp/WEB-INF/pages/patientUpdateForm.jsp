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
		<h1>Patient Edit page....</h1>
		<form:form action="${pageContext.request.contextPath }/savePatient"
			method="post" modelAttribute="patient">
			<div class="form-group" Style="width: 500px; margin: 30px auto">
				<input type="hidden" value="${patient.pId }" name="pId"> <br>
				<form:input path="pName" cssClass="form-control"
					placeholder="Enter patient Name" />
				<br>
				<form:input path="disease" cssClass="form-control"
					placeholder="Enter disease" />
				<br>
				<form:input path="bedNo" cssClass="form-control"
					placeholder="Enter bedNo" />
				<br>
				<form:input path="bedType" cssClass="form-control"
					placeholder="Enter bedType" />
				<br>
				<form:input path="email" cssClass="form-control"
					placeholder="Enter email" />
				<br>
				<form:input path="city" cssClass="form-control"
					placeholder="Enter city" />
				<br>
				<form:input path="country" cssClass="form-control"
					placeholder="Enter country" />

				<br>
				<div class="container text-center">
					<a href="${pageContext.request.contextPath }/patients">
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