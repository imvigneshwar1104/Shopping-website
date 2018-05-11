<%@page import="java.net.URI"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Product portal</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body background="images/hnbhl-wallpapers-263716078-1920x1080.jpg">
	<h2>Welcome to Product portal</h2>

	<%@include file="header.jsp"%>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">

		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active">

			</li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="images/10x.png" alt="Sony" width="1000" height="1200">
			</div>
			<div class="item">
				<img src="images/download3.png" alt="Samsung" width="1000"
					height="1200">
			</div>
			<div class="item">
				<img src="images/download1.jpg" alt="iphone" width="1000"
					height="1200">
			</div>
			<div class="item">
				<img src="images/s9.jpg" alt="iphone" width="1000" height="1200">
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">

			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>




</body>
</html>
