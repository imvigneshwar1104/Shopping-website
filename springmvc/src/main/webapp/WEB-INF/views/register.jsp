<%@page import="javax.servlet.descriptor.TaglibDescriptor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring form</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.help-block {
	color: red;
}
</style>
</head>
<body background="images/hnbhl-wallpapers-263716078-1920x1080.jpg">
	<div class="container-fluid">

	<%@include file="header.jsp" %>
		<div class="container">
			<form:form class="form-horizontal" method="POST"
				modelAttribute="user" action="user">
				<div class="form-group">
					<form:label class="control-label col-sm-2" path="username">Username</form:label>
					<div class="col-sm-5">
						<form:input path="username" class="form-control" />
						<form:errors path="username" cssClass="help-block" element="em" />
					</div>
				</div>
				<div class="form-group">
					<form:label class="control-label col-sm-2" path="password">Password</form:label>
					<div class="col-sm-5">
						<form:input path="password" type="password" class="form-control" />
						<form:errors path="password" cssClass="help-block" element="em" />
					</div>
				</div>
				<div class="form-group">
					<form:label class="control-label col-sm-2" path="email">Email</form:label>
					<div class="col-sm-5">
						<form:input path="email" class="form-control" />
						<form:errors path="email" cssClass="help-block" element="em" />
					</div>
				</div>
				<input type="submit" value="Submit" action="/address" />
			</form:form>
		</div>
</body>
</html>
