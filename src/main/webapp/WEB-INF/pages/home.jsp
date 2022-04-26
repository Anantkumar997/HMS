<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%-- <c:url value="/"/> --%>

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
	<nav>
		<div style="display: flex;">
			<div style="width: 50vw">
				<ul class="nav justify-content-left">
					<li class="nav-item"><a class="nav-link active"
						aria-curren="page" href='<c:url value='/home'></c:url>'>Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value='/assets'></c:url>'>Assets</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value='/doctors'></c:url>'>Doctors</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<c:url value='/patients'></c:url>'>Patients</a></li>
				</ul>
			</div>
			<div style="width: 50vw">
				<ul class="nav justify-content-end">
					<li class="nav-item"><a class="nav-link"
						href='<c:url value='/users'></c:url>'>Users</a></li>
					<li class="nav-item"><a class="nav-link disabled"
						href='<c:url value='/login'></c:url>'>Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 	<div class="container"> -->
	<!-- 		<h1 class="text-center" style="margin: 80px auto;">Welcome to -->
	<!-- 			Hospital Management System</h1> -->
	<!-- 	</div> -->

	<c:if test="${page=='home' }">
		<div class="container">
			<h1 class="text-center" style="margin: 80px auto;">Welcome to
				Hospital Management System</h1>
		</div>
	</c:if>
	<div class="col-md-10 text-center " style="margin: 120px auto;">


		<c:if test="${page=='assets' }">
			<h1>This is Assets page</h1>
			<c:if test="${not empty msg }">
				<div class="alert alert-success">
					<b><c:out value="${msg }"></c:out></b>
				</div>
			</c:if>
			<c:forEach items="${assets }" var="as">

				<div class="card" style="width: 500px; margin: 15px auto;">
					<div class="card-body"
						style="display: flex; flex-wrap: wrap; justify-content: space-evenly;">
						<h4>
							<c:out value="${as.id }"></c:out>
						</h4>
						<h4>
							<c:out value="${as.type }"></c:out>
						</h4>
						<h4>
							<c:out value="${as.quantity }"></c:out>
						</h4>
						<h4>
							<c:out value="${as.avl }"></c:out>
						</h4>
						<a href="assets/update/${as.id }"><button
								class="btn btn-outline-success">Edit</button></a> <a
							href="assets/show/${as.id }"><button type="button"
								class="btn btn-outline-info">Show</button></a> <a
							href="HMS/assets/delete/${as.id }"><button
								class="btn btn-outline-danger">Delete</button></a>
					</div>
				</div>
			</c:forEach>
			<a href="${pageContext.request.contextPath }/">
				<button type="button" class="btn btn-outline-danger">Back</button>
			</a>
			<a href='<c:url value='/addAsset'></c:url>'>
				<button type="button" class="btn btn-outline-secondary">addAsset</button>
			</a>
		</c:if>

		<c:if test="${page=='addAsset' }">
			<div>
				<h1>addAsset...</h1>
				<form:form action="saveAsset" method="post" modelAttribute="asset">
					<div class="form-group" Style="width: 500px; margin: 30px auto">
						<%-- 						<form:input path="id" cssClass="form-control" --%>
						<%-- 							placeholder="Enter id" /> --%>
						<!-- 						<br> -->
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

		</c:if>


		<c:if test="${page=='assets/update/id' }">
			<div>
				<h3>this is Edit page...</h3>
			</div>
		</c:if>

		<c:if test="${page=='doctors' }">
			<h1>Doctors detail page...</h1>
			<c:if test="${not empty msg }">
				<div class="alert alert-success">
					<b><c:out value="${msg }"></c:out></b>
				</div>
			</c:if>
			<c:forEach items="${doctors }" var="dr">

				<div class="card" style="width: 500px; margin: 15px auto;">
					<div class="card-body"
						style="display: flex; flex-wrap: wrap; justify-content: space-evenly;">
						<h4>
							<c:out value="${dr.dName}"></c:out>
						</h4>
						<h4>
							<c:out value="${dr.dspecilization }"></c:out>
						</h4>
						<h4>
							<c:out value="${dr.city }"></c:out>
						</h4>
						<!-- 						<h4> -->
						<%-- 							<c:out value="${ dr.joinDate }"></c:out> --%>
						<!-- 						</h4> -->
						<a href="doctors/update/${dr.dId }"><button
								class="btn btn-outline-success">Edit</button></a>
						<button type="button" class="btn btn-outline-info">Show</button>
						<a href="doctors/delete/${dr.dId }"><button
								class="btn btn-outline-danger">Delete</button></a>
					</div>
				</div>
			</c:forEach>
			<a href="${pageContext.request.contextPath }/">
				<button type="button" class="btn btn-outline-danger">Back</button>
			</a>
			<a href='<c:url value='/addDoctor'></c:url>'><button
					type="button" class="btn btn-outline-secondary">addDoctor</button></a>
		</c:if>
		-
		<c:if test="${page=='addDoctor' }">
			<div>
				<h1>addDoctor's details...</h1>
				<form:form action="saveDoctor" method="post" modelAttribute="doctor">
					<div class="form-group" Style="width: 500px; margin: 30px auto">
						<form:input path="dName" cssClass="form-control"
							placeholder="Enter doctor Name" />
						<br>
						<form:input path="dspecilization" cssClass="form-control"
							placeholder="Enter specilization" />
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
							<a href="${pageContext.request.contextPath }/doctors">
								<button type="button" class="btn btn-outline-danger">Back</button>
							</a>
							<button class="btn btn-outline-success">Save</button>
						</div>

					</div>
				</form:form>
			</div>

		</c:if>
		<c:if test="${page=='patients' }">
			<h1>Patients detail page...</h1>
			<c:forEach items="${patients }" var="ps">

				<div class="card" style="width: 500px; margin: 15px auto;">
					<div class="card-body"
						style="display: flex; flex-wrap: wrap; justify-content: space-evenly;">
						<h4>
							<c:out value="${ps.pName }"></c:out>
						</h4>
						<h4>
							<c:out value="${ps.disease }"></c:out>
						</h4>
						<h4>
							<c:out value="${ps.city }"></c:out>
						</h4>
						<!-- 						<h4> -->
						<%-- 							<c:out value="${as.avl }"></c:out> --%>
						<!-- 						</h4> -->
						<a href="patients/update/${ps.pId }"><button
								class="btn btn-outline-success">Edit</button></a>
						<button type="button" class="btn btn-outline-info">Show</button>
						<a href="patients/delete/${ps.pId }"><button
								class="btn btn-outline-danger">Delete</button></a>
					</div>
				</div>
			</c:forEach>
			<a href="${pageContext.request.contextPath }/">
				<button type="button" class="btn btn-outline-danger">Back</button>
			</a>
			<a href='<c:url value='/addPatient'></c:url>'><button
					type="button" class="btn btn-outline-secondary">addPatient</button></a>
		</c:if>

		<c:if test="${page=='addPatient' }">
			<div>
				<h1>addPatient's details...</h1>
				<form:form action="savePatient" method="post"
					modelAttribute="patient">
					<div class="form-group" Style="width: 500px; margin: 30px auto">
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

		</c:if>
		<c:if test="${page=='users' }">
			<h1>Users detail page...</h1>
			<c:forEach items="${users }" var="user">

				<div class="card" style="width: 500px; margin: 15px auto;">
					<div class="card-body"
						style="display: flex; flex-wrap: wrap; justify-content: space-evenly;">
						<h4>
							<c:out value="${user.userName }"></c:out>
						</h4>
						<h4>
							<c:out value="${user.password }"></c:out>
						</h4>
						<a href="users/update/${user.userId }"><button
								class="btn btn-outline-success">Edit</button></a>
						<button type="button" class="btn btn-outline-info">Show</button>
						<a href="users/delete/${user.userId }"><button
								class="btn btn-outline-danger">Delete</button></a>
					</div>
				</div>
			</c:forEach>
			<a href="${pageContext.request.contextPath }/">
				<button type="button" class="btn btn-outline-danger">Back</button>
			</a>

			<a href='<c:url value='/addUser'></c:url>'><button type="button"
					class="btn btn-outline-secondary">addUser</button></a>
		</c:if>

		<c:if test="${page=='addUser' }">
			<div>
				<h1>addUser detail...</h1>
				<form:form action="saveUser" method="post" modelAttribute="user">
					<div class="form-group" Style="width: 500px; margin: 30px auto">
						<form:input path="userName" cssClass="form-control"
							placeholder="Enter userName..." />
						<br>
						<form:input path="userType" cssClass="form-control"
							placeholder="Enter userType..." />
						<br>
						<form:input path="password" cssClass="form-control"
							placeholder="Enter password..." />
						<br>
						<div class="container text-center">
							<a href="${pageContext.request.contextPath }/users">
								<button type="button" class="btn btn-outline-danger">Back</button>
							</a>
							<button class="btn btn-outline-success">Save</button>
						</div>
					</div>
				</form:form>
			</div>

		</c:if>

		<c:if test="${page=='ligin' }">
			<h1>Login page...</h1>
		</c:if>
	</div>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</body>
</html>