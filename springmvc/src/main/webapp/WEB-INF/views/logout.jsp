<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %>
    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                        <a class="navbar-brand" href=""><img src="images/android_oreo_stock_5k-5120x2880.jpg"alt="NIIT" height="30px"width="120px"></a>
                </div>
                <ul class ="nav navbar-nav">
                    <li><a href="index">Home</a></li>
                   </ul>
                   </nav>
                
                <form:form class= "form-inline" method="POST" action="${pageContext.request.contextPath}/login" >
                <div class="form-group">
                    <label>Email :</label>
                   
                    <input type="text" class="form-control"id="email"name="username">
                    </div>
                    <br>
                    <br>
                    
                    <div class="form-group">
                    <label>Password :</label>
                    
                    <input type="password" class="form-control" name="password" id="password">
                    </div>
                    <br>
                    <br>
                    
                    <div class="checkbox">
                    <label><input type="checkbox" name="remember">Remember me</label>
                    </div>
                    <br>
                    <br>
                    <button type="submit" class="btn btn-default" value="Login">Submit</button>
                    </form:form>
                    
                    
                
                  
                     </div>

</body>
</html>