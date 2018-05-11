<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %>
    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    

<style type="text/css">
.container{

margin-top:10px;
}

.hero-unit{
padding:50px 50px 50px 50px;

}

.form-inline .control-label{
width:61px;
}

.form-inline .controls{

margin-left:80px;

}

@media(max-width:767px){

}

@media(max-width:480px){
.hero-unit{
margin-left: -20px;
margin-right: -20px;
}

.form-inline .controls{
margin-left:0;
}

}


</style>

</head>
<body background="images/hnbhl-wallpapers-263716078-1920x1080.jpg">
        <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                        <div class="navbar-header">
                        <a class="navbar-brand" href=""><img src="images/android_oreo_stock_5k-5120x2880.jpg"alt="NIIT" height="30px"width="120px"></a>
                </div>
                <ul class ="nav navbar-nav">
                    <li><a href="index">Home</a></li>
                   </ul>
                   </nav>
                
                <div class="container">
                <div class="hero-unit">
                <div class="row-fluid">
                <div class="offset4 span4">
                <legend>Login to Product portal</legend>
                <form:form class= "form-inline" method="POST" action="${pageContext.request.contextPath}/login" >
                <div class="form-group">
                    <label class="control-label" for="email">Email</label>
                    <div class="controls">
                   
                    <input type="text" id="email" class="form-control"name="username" placeholder="Enter email">
                    </div>
                    </div>
                    <br>
                    <br>
                    
                    <div class="form-group">
                    <label class="control-label" for="password">Password</label>
                    <div class="controls">
                    
                    <input type="password"  name="password" class="form-control" id="password" placeholder="Enter password">
                    </div>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                    <div class="controls">
                    
                    <label class="checkbox"><input type="checkbox"  class="form-control"name="remember">Remember me</label>
                    
                    <br>
                    <br>
                    <button type="submit" class="btn btn-default" value="Login">Submit</button>
                    </div>
                    </div>
                    
                    
                    
                    </form:form>
                    </div>
                    </div>
                    </div>
                    
                    
                    
                
                  
                     </div>
            </body>
            </html>

