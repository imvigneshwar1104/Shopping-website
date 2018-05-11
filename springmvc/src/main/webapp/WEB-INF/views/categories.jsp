<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
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

p.normal{
    font-size: 35px;
    background-color: tomato;
}

tr:nth-child(even) {background-color:pink;}
tr:nth-child(odd){background-color:pink;}

.help-block{
color:red;
}


</style>
</head>
<body>
<nav class="navbar navbar-inverse">
                <div class="container-fluid">
                        <div class="navbar-header">
                        <a class="navbar-brand" href=""><img src="images/android_oreo_stock_5k-5120x2880.jpg"alt="NIIT" height="30px"width="120px"></a>
                </div>
                <ul class ="nav navbar-nav">
                    <li><a href="index">Home</a></li>
                    <li class="active"><a href="productPage">Product</a></li>
                    </ul>
                    
                    
                        </nav>
<div class="container">
<form:form class="form-horizontal" method="POST" modelAttribute="category" action="${pageContext.request.contextPath}/category">
<form:hidden path="id"/>
<div class="form-group">
<form:label class="control-label col-sm-2" path="Name">Name</form:label>
</div>
<div class="col-sm-5">
<form:input path="Name" class="form-control"/>
<form:errors path="name" cssClass="help-block" element="em"/>
</div>
<input type="submit" value="Submit">

</form:form>

</div>
<div class="container"> 

<table class="table">
 <thead>
 <tr>
 <th>Name</th>
 <th>Action</th>
 </tr>
 </thead>
 <tbody>
 <c:forEach items="${categories }" var="c">
 <tr>
 <td>
 ${c.name }
 </td>
 
 <c:url var="url_delete" value="/trash">
<c:param name="id" value="${c.id }"/>
</c:url>
<c:url var="url_update" value="/edit">
<c:param name="id" value="${c.id }"/>
</c:url>
 <td>
 <a href="${url_delete }"><span class="glyphicon glyphicon-trash"></span></a>
 <a href="${url_update }"><span class="glyphicon glyphicon-pencil"></span></a>
 
 </td>
 </tr>
 
 </c:forEach>
 </tbody>
 </table>
 </div>

</body>
</html>