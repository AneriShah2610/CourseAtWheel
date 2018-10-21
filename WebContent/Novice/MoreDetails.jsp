<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title> Course More Details</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
		Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
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
		<link rel="stylesheet" href="novice/css/morris.css" type="text/css"/>
		<!-- calendar -->
		<link rel="stylesheet" href="novice/css/monthly.css">
		<!-- //calendar -->
		<!-- //font-awesome icons -->
		<script src="novice/js/jquery2.0.3.min.js"></script>
		<script src="novice/js/raphael-min.js"></script>
		<script src="novice/js/morris.js"></script>
	</head>
	<body>
		<%
			int course_id=0,course_novice_id=0,topic_id=0,lecture_id=0,tutorial_id=0,quiz_id=0,assignment_id=0,exam_id=0;
			String user_id=" ",trainer_id=" ",novice_id=" ";
			String course_name=" ",course_image=" ",course_type=" ",c_type=" ";
			String topic_name=" ",topic_description=" ";
			String lecture_name=" ",lecture_file=" ";
			String tutorial_file=" ";
			topic_id=Integer.parseInt(request.getParameter("tid"));
			user_id=(String) session.getAttribute("user_id");
			course_id=Integer.parseInt(request.getParameter("cid"));
			course_novice_id=Integer.parseInt(request.getParameter("course_novice_id"));
			course_name=request.getParameter("cn");
			if(user_id==null)
			 {
				 response.sendRedirect("Error.jsp");
			 }
			PreparedStatement pstmt;
			Connection con;
			ResultSet rs;
			String sql=" ";
		%>
		<section id="container">
			<header class="header fixed-top clearfix">
			<!--logo start-->
			<div class="brand">
				<a href="Index.jsp" class="logo" style="font-size:20px">
					CourseAtWheel
				</a>
				<div class="sidebar-toggle-box">
					<div class="fa fa-bars"></div>
				</div>
			</div>
			<!--logo end-->
			<div class="nav notify-row" id="top_menu">
				<!--  notification start -->
				<ul class="nav top-menu">
					<!-- settings start -->
					<!-- inbox dropdown start-->
					<li id="header_inbox_bar" class="dropdown">
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<i class="fa fa-envelope-o"></i>
							<span class="badge bg-important"></span>
						</a>
						<ul class="dropdown-menu extended inbox">
							<li>
								<p class="red">Messages</p>
							</li>
								<a href="#">See all messages</a>
							</li>
						</ul>
					</li>
					<!-- inbox dropdown end -->
					<!-- notification dropdown start-->
					<li id="header_notification_bar" class="dropdown">
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">

							<i class="fa fa-bell-o"></i>
							<span class="badge bg-warning"></span>
						</a>
						<ul class="dropdown-menu extended notification">
							<li>
								<p>Notifications</p>
							</li>
						</ul>
					</li>
					<!-- notification dropdown end -->
				</ul>
				<!--  notification end -->
			</div>
			<div class="top-nav clearfix">
				<!--search & user info start-->
				<ul class="nav pull-right top-menu">
					<li>
						<input type="text" class="form-control search" placeholder=" Search course">
					</li>
					<!-- user login dropdown start-->
					<li class="dropdown">
						<a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<span class="username"><%=user_id%></span>
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu extended logout">
							<li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
							<li><a href='caw8'><i class="fa fa-key"></i> LogOut</a></li>
						</ul>
					</li>
					<!-- user login dropdown end -->
				   
				</ul>
				<!--search & user info end-->
			</div>
			</header>
			<!--sidebar start-->
			<aside>
				<div id="sidebar" class="nav-collapse">
					<div class="leftside-navigation">
						<ul class="sidebar-menu" id="nav-accordion">
							<li>
								<a href="ActivatedCourse.jsp">
									<i class="fa fa-dashboard"></i>
									<span>MyCourses</span>
								</a>
							</li>
							<li class="sub-menu">
								<a href="javascript:;">
									<i class="fa fa-book"></i>
									<span><%=course_name%></span>
								</a>
								<%
									try
									 {
										Class.forName("com.mysql.jdbc.Driver");
										con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
										sql="SELECT * FROM courseatwheel.coursetopicview where course_id="+course_id+"";
										pstmt=con.prepareStatement(sql);
										System.out.println(sql);
										rs=pstmt.executeQuery(sql);
										while(rs.next())
										 {
											  topic_name=rs.getString(4);
								%>
											  <ul class="sub">
												<li>
													<a href="javascript:;"><%=topic_name%></a> 
												</li>
											  </ul>
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
					</div>
				</div>
			</aside>
			<!--sidebar end-->
			<!--main content start-->
			<section id="main-content">
				<section class="wrapper">
					<div class="form-w3layouts">
						<a href="Course.jsp?course_novice_id=<%=course_novice_id%>&cid=<%=course_id%>&cn=<%=course_name%>">
							<i class="fa fa-mail-reply"></i>
						</a>
					<!-- page start-->
						<div class="row">
							<div>
								Topic detail
							</div>
							<br>
							<div class="col-lg-12">
								<section class="panel">
								<%
									try
									 {
										Class.forName("com.mysql.jdbc.Driver");
										con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
										sql="SELECT * FROM courseatwheel.coursetopicview where topic_id="+topic_id+"";
										pstmt=con.prepareStatement(sql);
										System.out.println(sql);
										rs=pstmt.executeQuery(sql);
										while(rs.next())
										 {
											 topic_name=rs.getString(4);
											 topic_description=rs.getString(5);
								%>
											Topic: <%=topic_name%>
											<p/>
											<p/>
											<br>
											Topic description: <%=topic_description%>
								<%
										 }
										 con.close();
									 }
									 catch(Exception ex)
									  {
										  ex.printStackTrace();
										  System.out.println(ex);
									  }
											  
								%>			
								</section>
							</div>
							<div>
								Lecture detail
							</div>
							<br>
							<div class="col-lg-12">
								<section class="panel">
								<%
									try
									 {
										Class.forName("com.mysql.jdbc.Driver");
										con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
										sql="SELECT * FROM courseatwheel.courselecview where topic_id="+topic_id+"";
										pstmt=con.prepareStatement(sql);
										System.out.println(sql);
										rs=pstmt.executeQuery(sql);
										while(rs.next())
										 {
											 lecture_name=rs.getString(6);
											 lecture_file=rs.getString(7);
								%>
											Lecture: <%=lecture_name%>
											<p/>
											<p/>
											<br>
											<video width="400" height="200" controls>
																	<source src='<%=lecture_file%>' type="video/mp4">
														  </video> 
								<%
										 }
										 con.close();
									 }
									 catch(Exception ex)
									  {
										  ex.printStackTrace();
										  System.out.println(ex);
									  }
											  
								%>			
								</section>
							</div>
							<div>
								Tutorial detail
							</div>
							<br>
							<div class="col-lg-12">
								<section class="panel">
								<%
								int count=1;
									try
									 {
										Class.forName("com.mysql.jdbc.Driver");
										con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
										sql="SELECT * FROM courseatwheel.coursetutorialview where topic_id="+topic_id+"";
										pstmt=con.prepareStatement(sql);
										System.out.println(sql);
										rs=pstmt.executeQuery(sql);
										while(rs.next())
										 {
											 
											 tutorial_file=rs.getString(2);
											 
								%>
											<%=count%>
											<embed src="<%=tutorial_file%>" width="700px" height="300px" type="application/pdf"
																	scrolling="yes"/>
											<br>
											<br>
													
								<%
									count++;
										 }
										 con.close();
									 }
									 catch(Exception ex)
									  {
										  ex.printStackTrace();
										  System.out.println(ex);
									  }
											  
								%>			
								</section>
							</div>
						</div>
						<!-- page end-->
					</div>
				</section>
			</section>
		</section>
		<script src="novice/js/bootstrap.js"></script>
		<script src="novice/js/jquery.dcjqaccordion.2.7.js"></script>
		<script src="novice/js/scripts.js"></script>
		<script src="novice/js/jquery.slimscroll.js"></script>
		<script src="novice/js/jquery.nicescroll.js"></script>
		<script src="novice/js/jquery.scrollTo.js"></script>
		<script>
			$(document).ready(function() {
				//BOX BUTTON SHOW AND CLOSE
			   jQuery('.small-graph-box').hover(function() {
				  jQuery(this).find('.box-button').fadeIn('fast');
			   }, function() {
				  jQuery(this).find('.box-button').fadeOut('fast');
			   });
			   jQuery('.small-graph-box .box-close').click(function() {
				  jQuery(this).closest('.small-graph-box').fadeOut(200);
				  return false;
			   });
			   
				//CHARTS
				function gd(year, day, month) {
					return new Date(year, month - 1, day).getTime();
				}
				
				graphArea2 = Morris.Area({
					element: 'hero-area',
					padding: 10,
				behaveLikeLine: true,
				gridEnabled: false,
				gridLineColor: '#dddddd',
				axes: true,
				resize: true,
				smooth:true,
				pointSize: 0,
				lineWidth: 0,
				fillOpacity:0.85,
					data: [
						{period: '2015 Q1', iphone: 2668, ipad: null, itouch: 2649},
						{period: '2015 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
						{period: '2015 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
						{period: '2015 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
						{period: '2016 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
						{period: '2016 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
						{period: '2016 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
						{period: '2016 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
						{period: '2017 Q1', iphone: 10697, ipad: 4470, itouch: 2038},
					
					],
					lineColors:['#eb6f6f','#926383','#eb6f6f'],
					xkey: 'period',
					redraw: true,
					ykeys: ['iphone', 'ipad', 'itouch'],
					labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
					pointSize: 2,
					hideHover: 'auto',
					resize: true
				});
			});
		</script>
		<script type="text/javascript" src="novice/js/monthly.js"></script>
		<script type="text/javascript">
			$(window).load( function() 
			 {
				$('#mycalendar').monthly({
					mode: 'event',
				});
				$('#mycalendar2').monthly({
					mode: 'picker',
					target: '#mytarget',
					setWidth: '250px',
					startHidden: true,
					showTrigger: '#mytarget',
					stylePast: true,
					disablePast: true
				});
			switch(window.location.protocol) {
			case 'http:':
			case 'https:':
			break;
			case 'file:':
			alert('Just a heads-up, events will not work when run locally.');
			}
			});
		</script>
	</body>
</html>