<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Course Catalog Menu</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!-- bootstrap-css -->
		<link rel="stylesheet" href="novice/css/bootstrap.min.css" >
		<!-- //bootstrap-css -->
		<!-- Custom CSS -->
		<link href="novice/css/style.css" rel='stylesheet' type='text/css' />
		<link href="novice/css/style-responsive.css" rel="stylesheet"/>
		<!-- font CSS -->
		<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
		<!-- font-awesome icons -->
		<link rel="stylesheet" href="novice/css/font.css" type="text/css"/>
		<link href="novice/css/font-awesome.css" rel="stylesheet"> 
		<!-- //font-awesome icons -->
		<script src="novice/js/jquery2.0.3.min.js"></script>
	</head>
	<body>
	<%
		int course_category_id=0;
		String course_category_name=" ",course_sub_category_name=" ",user_id=" ";
		user_id=(String) session.getAttribute("user_id");
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql=" ";
	%>
		<section id="container">
		<!--header start-->
		<header class="header fixed-top clearfix">
		<!--logo start-->
		<div class="brand">
			<a href="Index.jsp" class="logo" style="font-size:20px">
				CourseAtwheel
			</a>
			<div class="sidebar-toggle-box">
				<div class="fa fa-bars"></div>
			</div>
		</div>
		<!--logo end-->

		<div class="nav notify-row" id="top_menu">
			<li>
				<input type="text" class="form-control search" placeholder=" Search Courses">
			</li>
		</div>
		<div class="top-nav clearfix">
			<!--search & user info start-->
			<ul class="nav pull-right top-menu">
				<!-- user login dropdown start-->
				<li class="dropdown">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<span class="username"><%=user_id%></span>
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu extended logout">
						<li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
						<li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
						<li><a href='caw8'><i class="fa fa-key"></i> Log Out</a></li>
					</ul>
				</li>
				<!-- user login dropdown end -->
			</ul>
			<!--search & user info end-->
		</div>
		</header>
		<!--header end-->
		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse">
				<!-- sidebar menu start-->
				<div class="leftside-navigation">
					<ul class="sidebar-menu" id="nav-accordion">
						<li>
							<a href="CourseCatalog.jsp">
								<i class="fa fa-dashboard"></i>
								<span>Catalog</span>
							</a>
						</li>
						<li class="sub-menu">
							<a href="javascript:;">
								<i class="fa fa-book"></i>
								<span>Category</span>
							</a>
							<ul class="sub">
								<li><a href="CourseView.jsp">All</a></li>
								<%
									try
									 {
										 Class.forName("com.mysql.jdbc.Driver");
										 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
								%>
								<li><a href="javascript:;">Technical</a>
									<ul class="sub">
										<li>
										<%
											sql="select *from courseatwheel.course_category where course_sub_category_name='Technical' order by course_category_id";
											pstmt=con.prepareStatement(sql);
											System.out.println(sql);
											rs=pstmt.executeQuery(sql);
											while(rs.next())
											 {
												course_category_id=rs.getInt(1);
												course_category_name=rs.getString(2);
												course_sub_category_name=rs.getString(3);
										%>
												<a href="CourseView.jsp">
													<%= course_category_name%> 	
												</a>
										<%
											 }
											con.close();
									  }
									 catch(Exception e)
									  {
										  e.printStackTrace();
										  System.out.println(e);
									  }
										%>
										</li>
									</ul>
								</li>
								<%
									try
									 {
										 Class.forName("com.mysql.jdbc.Driver");
										 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
								%>
								<li><a href="javascript:;">Non-Technical</a>
									<ul class="sub">
										<li>
										<%
											sql="select *from courseatwheel.course_category where course_sub_category_name='Non-Technical' order by course_category_id";
											pstmt=con.prepareStatement(sql);
											System.out.println(sql);
											rs=pstmt.executeQuery(sql);
											while(rs.next())
											 {
												course_category_id=rs.getInt(1);
												course_category_name=rs.getString(2);
												course_sub_category_name=rs.getString(3);
										%>
												<a href="CourseView.jsp">
													<%= course_category_name%>
												</a>
										<%
											 }
											con.close();
									  }
									 catch(Exception e)
									  {
										  e.printStackTrace();
										  System.out.println(e);
									  }
										%>
										</li>
									</ul>
								</li>
							</ul>
						</li>
					</ul>            
				</div>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->
		</section>
		<script src="novice/js/bootstrap.js"></script>
		<script src="novice/js/jquery.dcjqaccordion.2.7.js"></script>
		<script src="novice/js/scripts.js"></script>
		<script src="novice/js/jquery.slimscroll.js"></script>
		<script src="novice/js/jquery.nicescroll.js"></script>
		<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
		<script src="novice/js/jquery.scrollTo.js"></script>
	</body>
</html>
