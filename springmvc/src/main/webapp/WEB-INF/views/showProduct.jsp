<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${product.name}</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<img alt="" height="250px" width="80%"
					src="${pageContext.request.contextPath}/images/${product.id}.jpg"
					class="img-thumbnail">
			</div>
			<div class="col-md-5">

				<h2>${product.name}</h2>
				<br>
				<p>${product.description }</p>
				<br>
				<p>Rs. ${product.price}</p>
				<a 
					href="${pageContext.request.contextPath}/user/addToCart/${product.id}"
					class="btn btn-info">Add To Cart</a>
			</div>
		</div>
	</div>

</body>
</html>