<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>TainerMenu2</title>
		<link rel="stylesheet" href="trainer/assets/css/normalize.css">
		<link rel="stylesheet" href="trainer/assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="trainer/assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="trainer/assets/css/themify-icons.css">
		<link rel="stylesheet" href="trainer/assets/css/flag-icon.min.css">
		<link rel="stylesheet" href="trainer/assets/css/cs-skin-elastic.css">
		<!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
		<link rel="stylesheet" href="trainer/assets/scss/style.css">
		<link href="trainer/assets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">
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
		<aside id="left-panel" class="left-panel">
			<nav class="navbar navbar-expand-sm navbar-default">
			<div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="./Index.jsp">CourseAtWheel</a>
                <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
            </div>
				<div id="main-menu" class="main-menu collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li class="active">
							<a href="TrainerRoom.jsp"> <i class="menu-icon fa fa-dashboard"></i>Home </a>
						</li>
						<li class="menu-item-has-children dropdown">
							<a href="MyCourse.jsp" class="dropdown-toggle" > <i class="menu-icon fa fa-laptop"></i>My Courses</a>
						</li>
						<li class="menu-item-has-children dropdown">
							<a href="TrainerCourseAdd.jsp" class="dropdown-toggle" <i class="menu-icon fa fa-table"></i>Add Courses</a>
						</li>
						<li class="menu-item-has-children dropdown">
							<a href="TrainerCourseNovice.jsp" class="dropdown-toggle"> <i class="menu-icon fa fa-th"></i>Course-Novice</a>
						</li><li class="menu-item-has-children dropdown">
							<a href="CourseView.jsp" class="dropdown-toggle"> <i class="menu-icon fa fa-tasks"></i>Learn Course</a>
						</li>
						<li>
							<a href="CourseView.jsp"> <i class="menu-icon ti-email"></i>Courses </a>
						</li>
						<li class="menu-item-has-children dropdown">
							<a href="MyEvents.jsp" class="dropdown-toggle"> <i class="menu-icon fa fa-bar-chart"></i>MyEvents</a>
						</li>
						<li class="menu-item-has-children dropdown">
							<a href="TrainerClassroon.jsp" class="dropdown-toggle"> <i class="menu-icon fa fa-area-chart"></i>MyClassroom</a>
						</li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</nav>
		</aside>
		<script src="trainer/assets/js/vendor/jquery-2.1.4.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
		<script src="trainer/assets/js/plugins.js"></script>
		<script src="trainer/assets/js/main.js"></script>
		<script src="trainer/assets/js/lib/chart-js/Chart.bundle.js"></script>
		<script src="trainer/assets/js/dashboard.js"></script>
		<script src="trainer/assets/js/widgets.js"></script>
		<script src="trainer/assets/js/lib/vector-map/jquery.vmap.js"></script>
		<script src="trainer/assets/js/lib/vector-map/jquery.vmap.min.js"></script>
		<script src="trainer/assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
		<script src="trainer/assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>
		<script>
			( function ( $ ) {
				"use strict";

				jQuery( '#vmap' ).vectorMap( {
					map: 'world_en',
					backgroundColor: null,
					color: '#ffffff',
					hoverOpacity: 0.7,
					selectedColor: '#1de9b6',
					enableZoom: true,
					showTooltip: true,
					values: sample_data,
					scaleColors: [ '#1de9b6', '#03a9f5' ],
					normalizeFunction: 'polynomial'
				} );
			} )( jQuery );
		</script>
	</body>
</html>