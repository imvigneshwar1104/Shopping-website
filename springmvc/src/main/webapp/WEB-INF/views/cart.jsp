<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
</head>
<body>

	<%@include file="header.jsp"%>

	<div class="container">
		<div class="img-thumbnail"style="width:100%">

			<table class="table table-hower" width="100%">
			
				<thead>
					<tr>
						<th style="width: 25%">Name</th>
						<th style="width: 25%">Quantity</th>
						<th style="width: 25%">Cost</th>
						<th style="width: 25%">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cart.cartItems}" var="ci">
						<tr>
							<td>${ci.product.name}</td>
							<td>${ci.qty}</td>
							<td>${ci.subTotal}</td>
							<td><a
								href="${pageContext.request.contextPath}/user/addToCart/${ci.product.id}"
								class="btn btn-success">+</a> <a
								href="${pageContext.request.contextPath}/user/delete/${ci.id}"
								class="btn btn-danger">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><b>Rs. ${cart.grandTotal}</b></td>
					</tr>
				</tfoot>
			</table>
			<a href="${pageContext.request.contextPath }/showmsg" class="btn btn-success">Place the order</a>
		</div>
	</div>

</body>
</html>