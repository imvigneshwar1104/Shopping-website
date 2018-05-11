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

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style>
  .help-block{
color:red;
}
  
  </style>
</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-inverse">
                
                        <div class="navbar-header">
                        <a class="navbar-brand" href=""><img src="images/android_oreo_stock_5k-5120x2880.jpg"alt="NIIT" height="30px"width="120px"></a>
                </div>
                <ul class ="nav navbar-nav">
                    <li><a href="index">Home</a></li>
                   </ul>
                   </nav>
<div class="container">
<form:form class="form-horizontal" method="POST" modelAttribute="address" action="address">
<h2>Address:</h2>
<div class="form-group">
<form:label class="control-label col-sm-2" path="doorno">DoorNo</form:label>
<div class="col-sm-5">
<form:input path="doorno" class="form-control"/>
<form:errors path="doorno" cssClass="help-block" element="em"/>
</div>
</div>
<div class="form-group">
<form:label class="control-label col-sm-2"  path="street">Street</form:label>
<div class="col-sm-5">
<form:input path="street" class="form-control"/>
<form:errors path="street" cssClass="help-block" element="em"/>
</div>
</div>
<div class="form-group">
<form:label class="control-label col-sm-2" path="place">Place</form:label>
<div class="col-sm-5">
<form:input path="place" class="form-control"/>
<form:errors path="place" cssClass="help-block" element="em"/>
</div>
</div>
<div class="form-group">
<form:label class="control-label col-sm-2" path="state">State</form:label>
<div class="col-sm-5">
<form:input path="state" class="form-control"/>
<form:errors path="state" cssClass="help-block" element="em"/>
</div>
</div>
<div class="form-group">
<form:label class="control-label col-sm-2" path="country">Country</form:label>
<div class="col-sm-5">
<form:input path="country" class="form-control"/>
<form:errors path="country" cssClass="help-block" element="em"/>
</div>
</div>
</div>
<input type="submit" value="Submit"/>
</form:form>
</body>
</html>