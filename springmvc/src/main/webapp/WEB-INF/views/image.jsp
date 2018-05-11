<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			<li><a href="index">Home</a></li>
			<li class="active"><a href="productPage">Product</a></li>
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li><a href="registerPage"><span
					class="glyphicon glyphicon-user"></span>Register</a></li>
			<li><a href="loginPage"><span
					class="glyphicon glyphicon-log-in"></span>Login</a></li>
		</ul>
	</nav>

	<div class="container">
		<form:form class="form-horizontal" method="POST"
			modelAttribute="product"
			action="${pageContext.request.contextPath}/upload/${proId}"
			enctype="multipart/form-data">
			<div class="form-group">
				<form:label class="control-label col-sm-2" path="image">Select an image</form:label>
				<div class="col-sm-5">
					<form:input path="image" type="file" class="form-control" />
				</div>
				<input type="submit" value="Upload"/>
			</div>
		</form:form>
	</div>

</body>
</html>