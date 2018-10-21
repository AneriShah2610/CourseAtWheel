<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>CourseAtWheel</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" type="text/css" href="css/boot.css">
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="css/style_common.css">
		<link rel="stylesheet" type="text/css" href="css/style1.css">
		<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700,300,300italic'>
		<script src="js/modernizr.custom.69142.js"></script>
		<script src="js/jquery-1.10.1.min.js"></script>
		<script src="js/bootstrap.min.js" ></script>
	</head>
	<body>
	<%
		String user_id=" ",user_type=" ",status=" ";
		user_id=(String)session.getAttribute("user_id");
		user_type=(String) session.getAttribute("user_type");
		status=(String) session.getAttribute("status");
		if(user_id==null)
		 {}
		else
		 {
			 out.println(user_id);
		 }
	%>
		<div id="page-top" class="index">
			<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand page-scroll" href="Index.jsp">CourseAtWheel</a>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
						  <li><a class="page-scroll" href="Index.jsp">Home</a></li>
						  <li><a class="page-scroll" href="#about">About</a></li>
						  <li><a class="page-scroll" href="#services">Services</a></li>
						  <li><a class="page-scroll" href="#port">Courses</a></li>
						  <li><a class="page-scroll" href="#team">Team</a></li>
						  <li><a class="page-scroll" href="#contact">Contact</a></li>
						  <%
								if(user_id!=null) 
								 { 
									if(user_type.equals("Admin"))
									 {
										 System.out.println("Admin");
						  %>
						  				<li><a href="AdminHome.jsp">AdminRoom</a></li>
										<li><a href='caw8'>LogOut</a></li>
						  <%
									 }
									else if(user_type.equals("novice") && status.equals("Accepted"))
									 {
										 System.out.println("Novice");
						  %>
										<li><a href="NoviceRoom.jsp">NoviceRoom</a></li>
										<li><a href='caw8'>LogOut</a></li>
						  <%
									 }
									else if(user_type.equals("trainer") && status.equals("Accepted"))
									 {
										 System.out.println("Trainer");
						  %>
										<li><a href="TrainerRoom.jsp">TrainerRoom</a></li>
										<li><a href='caw8'>LogOut</a></li>
						  <%
									 }
									else if(user_type.equals("trainer") && status.equals("Not Accepted"))
									 {
						  %>
										 <li><a href="LogIn.jsp">LogIn</a></li>
									    <li><a href="UserType.jsp">Registration</a></li>
						  <%
									 }
								  }
								else if(user_id==null)
								 {
						  %>
									    <li><a href="LogIn.jsp">LogIn</a></li>
									    <li><a href="UserType.jsp">Registration</a></li>
						  <%
								 }
						  %>
						</ul>
					</div>
				</div><!-- /.container-fluid -->
			</nav>
		</div>
	</body>
</html>
		 
 