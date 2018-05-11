<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>



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

.help-block {
	color: red;
}
</style>
</head>
<body background="images/hnbhl-wallpapers-263716078-1920x1080.jpg">
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="media">


			<div class="media-right">
				<img src="images/IMG_20180411_175302.jpg" class="media-object"
					style="width: 75px">
			</div>
		</div>
		<div class="navbar-header">
			<a class="navbar-brand" href=""><img
				src="images/android_oreo_stock_5k-5120x2880.jpg" alt="NIIT"
				height="30px" width="120px"></a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="index">Home</a></li>
			<li class="active"><a href="productPage">Product</a></li>
			<li><a href="categoryPage">Category</a></li>
		</ul>
		
		
		<ul class="nav navbar-nav navbar-right">
			<li><a href="logout"><span
					class="glyphicon glyphicon-log-out"></span>Logout</a></li>
		</ul>
	</nav>
	<div class="container">
		<form:form class="form-horizontal" method="POST" modelAttribute="product" action="${pageContext.request.contextPath}/admin/product"
			enctype="multipart/form-data">
			<form:hidden path="id" />
			<div class="form-group">
				<form:label class="control-label col-sm-2" path="Name">Name</form:label>
				<div class="col-sm-5">
					<form:input path="Name" class="form-control" />
					<form:errors path="name" cssClass="help-block" element="em" />
				</div>
			</div>
			<div class="form-group">
				<form:label class="control-label col-sm-2" path="description">description</form:label>
				<div class="col-sm-5">
					<form:input path="description" class="form-control" />
					<form:errors path="description" cssClass="help-block" element="em" />
				</div>
			</div>
			<div class="form-group">
				<form:label class="control-label col-sm-2" path="Price">Price</form:label>
				<div class="col-sm-5">
					<form:input path="Price" class="form-control" />
					<form:errors path="price" cssClass="help-block" element="em" />
				</div>
			</div>
			<div class="form-group">
				<form:label class="control-label col-sm-2" path="Quantity">quantity</form:label>
				<div class="col-sm-5">
					<form:input path="Quantity" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<form:label path="category">Select category</form:label>
				<form:select path="category.id" id="category">
					<form:options items="${categories}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>

			<input type="submit" value="Submit">
	</div>



	</form:form>



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

						<c:url var="url_delete"
							value="/admin/delete">
							<c:param name="id" value="${p.id }" />
						</c:url>
						<c:url var="url_update"
							value="/admin/update">
							<c:param name="id" value="${p.id }" />
						</c:url>
						<c:url var="url_id" value="/get">
							<c:param name="id" value="${p.id }" />
						</c:url>

						<td><a href="${url_delete }"> <span
								class="glyphicon glyphicon-trash"></span>
						</a> <a href="${url_update }"><span
								class="glyphicon glyphicon-pencil"></span></a> 
								<a href="${url_id }"><span
								class="glyphicon glyphicon-camera"></span></a></td>



					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>

	</div>



</body>
</html>