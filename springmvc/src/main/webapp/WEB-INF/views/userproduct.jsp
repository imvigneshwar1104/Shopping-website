<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
p.normal {
	font-size: 35px;
	background-color: tomato;
}

tr:nth-child(even) {
	background-color: pink;
}

tr:nth-child(odd) {
	background-color: pink;
}
</style>
</head>
<body background="images/501776098.jpg">

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href=""><img
				src="images/android_oreo_stock_5k-5120x2880.jpg" alt="NIIT"
				height="30px" width="120px"></a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="index">Home</a></li>
			<li class="active"><a href="userproductPage">Product</a></li>
			<li><a href="usercategoryPage">Category</a>
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li><a href="logout"><span
					class="glyphicon glyphicon-log-out"></span>Logout</a></li>
		</ul>
	</nav>

	<div class="container">

		<table class="table">
			<thead>
				<tr>
					<th>Image</th>
					<th>Name</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${products}" var="p">
					<tr>
						<td><img alt="" height="100" width="100"
							src="${pageContext.request.contextPath}/images/${p.id}.jpg">
						</td>
						<td>${p.name }</td>
						<td>${p.price }</td>
						<td><a
							href="${pageContext.request.contextPath}/showProduct/${p.id}"
							class="btn btn-primary">View</a><span> </span> <a
							href="${pageContext.request.contextPath}/user/addToCart/${p.id}"
							class="btn btn-info"><span
								class="glyphicon glyphicon-shopping-cart"></span>Add To Cart</a></td>


					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>


</body>
</html>