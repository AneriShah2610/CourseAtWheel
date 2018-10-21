<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Trainer Room</title>
			<!-- Favicons
					================================================== -->
			<link rel="shortcut icon" href="trainer/img/favicon.ico" type="image/x-icon">
			<link rel="apple-touch-icon" href="trainer/img/apple-touch-icon.png">
			<link rel="apple-touch-icon" sizes="72x72" href="trainer/img/apple-touch-icon-72x72.png">
			<link rel="apple-touch-icon" sizes="114x114" href="trainer/img/apple-touch-icon-114x114.png">

			<!-- Bootstrap -->
			<link rel="stylesheet" type="text/css"  href="trainer/css/bootstrap.css">
			<link rel="stylesheet" type="text/css" href="trainer/fonts/font-awesome/css/font-awesome.css">
	
			<!-- Stylesheet
				================================================== -->
			<link rel="stylesheet" type="text/css"  href="trainer/css/style.css">
			<link rel="stylesheet" type="text/css" href="trainer/css/prettyPhoto.css">
			<script type="text/javascript" src="trainer/js/modernizr.custom.js"></script>
	</head>
	<body>
	<%
		String user_id=" ";
		user_id=(String)session.getAttribute("user_id");
		if(user_id==null)
		 {
			response.sendRedirect("Error.jsp");
		 }
	%>
		<!-- Navigation
			==========================================-->
		<nav id="menu" class="navbar navbar-default navbar-fixed-top">
		  <div class="container"> 
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
			  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
			  <a class="navbar-brand" href="./Index.jsp">CourseAtWheel</a> </div>
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			  <ul class="nav navbar-nav navbar-right">
				<li><a href="TrainerRoom.jsp" class="page-scroll">Home</a></li>
				<li><a href="#works-section" class="page-scroll">Trainer Section</a></li>
				<li><a href="./courses.jsp">Courses</a></li>
				<li><a href="TrainerAccount.jsp">My Account</a></li>
				<li><a href="#footer" class="page-scroll">More</a></li>
				<li><a href='caw8'>LogOut</a></li>

			  </ul>
			</div>
			<!-- /.navbar-collapse --> 
		  </div>
		  <!-- /.container-fluid --> 
		</nav>
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
		<script type="text/javascript" src="trainer/js/jquery.1.11.1.js"></script> 
		<!-- Include all compiled plugins (below), or include individual files as needed --> 
		<script type="text/javascript" src="trainer/js/bootstrap.js"></script> 
		<script type="text/javascript" src="trainer/js/SmoothScroll.js"></script> 
		<script type="text/javascript" src="trainer/js/jquery.prettyPhoto.js"></script> 
		<script type="text/javascript" src="../js/jquery.isotope.js"></script> 
		<script type="text/javascript" src="../js/jqBootstrapValidation.js"></script> 
		<script type="text/javascript" src="../js/contact_me.js"></script> 

		<!-- Javascripts
			================================================== --> 
		<script type="text/javascript" src="trainer/js/main.js"></script>
	</body>
</html>