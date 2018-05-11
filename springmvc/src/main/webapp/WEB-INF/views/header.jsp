<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href=""><img
				src="images/android_oreo_stock_5k-5120x2880.jpg" alt="NIIT"
				height="30px" width="120px"></a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>

		</ul>
		<ul class="nav navbar-nav navbar-right">
        <security:authorize access="isAnonymous()">
		
			<li><a href="${pageContext.request.contextPath }/registerPage"><span
					class="glyphicon glyphicon-user"></span>Register</a></li>
		</security:authorize>

			<security:authorize access="isAnonymous()">
				<li><a href="${pageContext.request.contextPath}/loginPage"><span
						class="glyphicon glyphicon-log-in"></span>Login</a></li>
			</security:authorize>

			<security:authorize access="isAuthenticated()">

				<li><a href="${pageContext.request.contextPath}/user/cart"><span
						class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
				<li><a href="${pageContext.request.contextPath}/logout"><span
						class="glyphicon glyphicon-log-out"></span>Logout</a></li>
			</security:authorize>

			<security:authorize access="hasRole('ROLE_ADMIN')">


				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/productPage">Admin</a></li>
			</security:authorize>
			<security:authorize access="hasRole('ROLE_USER')">


				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/userproductPage">User</a></li>
			</security:authorize>
		</ul>
	</div>
	</nav>


</body>
</html>