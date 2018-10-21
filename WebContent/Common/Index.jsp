<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="Menu.jsp" />
<html>
	<head>
		<title>CourseAtWheel</title>
	</head>
	<body>
		 <!-- Header Part -->
		<div id="page-top" class="index">
		  <header style="background-image:url(images/3218_Computer-power-abstract-binary-code.jpg)">
			<div class="container">
			  <div class="intro-text">
				<div class="intro-lead-in"></div>
				<div class="intro-heading">Welcome To CourseAtWheel</div>
				<a href="#services" class="page-scroll btn btn-primary">Know More</a></div>
			</div>
		  </header>
		</div>

		<!-- About Section -->
		<section id="about">
		  <div class="container">
			<div class="row">
			  <div class="col-lg-12 text-center">
				<h2 class="section-heading" style="color:#3680C1">About</h2>
			  </div>
			</div>
			<div class="row">
			  <div class="col-lg-12">
				<ul class="timeline">
				  <li>
					<div class="timeline-image"><img class="img-circle img-responsive" src="images/courseatwheel.png" alt=""></div>
					<div class="timeline-panel">
					  <div class="timeline-heading">
						<h4 style="color:#3680C1">2017-2018</h4>
						<h4 class="subheading" style="color:#3680F2">Our Humble Beginnings</h4>
					  </div>
					  <div class="timeline-body">
						<p class="text-muted">CourseAtWheel system is a powerful system to use as a replacement for traditional teaching sessions such as workshops and structured discussion.
							This system is an online classroom type system that allows novices (participants) to learn through online using videos or presentation, notes & tutorials.
							CourseAtWheel system allows both novices (learners/participants) and trainer (instructors) around the world to participate in live classes to collaborate and interact.
						</p>
					  </div>
					</div>
				  </li>
				</ul>
			  </div>
			</div>
		  </div>
		</section>
		
		<!-- ===== services provided by CourseAtWheel ===== -->
		<section id="services">
		  <div class="container">
			<div class="row">
			  <div class="col-lg-12 text-center">
				<h2 class="section-heading" style="color:#3680C1">Services</h2>
			  </div>
			</div>
			<div class="row text-center">
			  <div class="col-md-4"><span class="fa-stack fa-4x"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i></span>
				<h4 class="service-heading">Online Lecturing</h4>
				<p class="text-muted">Online virtual dynamic,interactive and effective training.</p>
			  </div>
			  <div class="col-md-4"><span class="fa-stack fa-4x"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-automobile fa-stack-1x fa-inverse"></i></span>
				<h4 class="service-heading">Expert Trainer</h4>
				<p class="text-muted">Only best,qualitative and knowledgable trainer.</p>
			  </div>
			  <div class="col-md-4"><span class="fa-stack fa-4x"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-windows fa-stack-1x fa-inverse"></i></span>
				<h4 class="service-heading">Flexible Schedule</h4>
				<p class="text-muted">No fix timing.</p>
			  </div>
			  <div class="col-md-4"><span class="fa-stack fa-4x"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-windows fa-stack-1x fa-inverse"></i></span>
				<h4 class="service-heading">24X7 support</h4>
				<p class="text-muted">Answered any time,no time to ask any query.</p>
			  </div>
			</div>
		  </div>
		</section>
		
		<!-- ===== Popular Courses ===== -->
		<section id="port" class="bg-danger">
		  <div class="container">
			<div class="row">
			  <div class="col-lg-12 text-center">
				<a href="CourseCatalog.jsp"> <h2 class="section-heading" style="color:#3680C1">Popular Courses</h2> </a>
			  </div>
			</div>
			<div id="grid" class="main">
			<%
				int course_id=0,count=0;
				String course_name=" ",course_image=" ";
				try
				 {
					 Class.forName("com.mysql.jdbc.Driver");
					 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
					 String sql="select *from courseatwheel.course order by course_id";
		             PreparedStatement pstmt=con.prepareStatement(sql);
		             System.out.println(sql);
		             ResultSet rs = pstmt.executeQuery();
					 while(rs.next())
					  {
						  course_id=rs.getInt(1);
						  course_name=rs.getString(2);
						  course_image=rs.getString(9);
				%>
						  <div class="view">
							<div class="view-back"><span> <%=course_name%> </span><a href="">&rarr;</a></div> 
							<img src='<%= course_image %>' height="400px"  width="400px" alt="course" />
						  </div>
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
		  </div>
		</section>
		<script>	
		Modernizr.load({
			test: Modernizr.csstransforms3d && Modernizr.csstransitions,
			yep: ['js/jquery-1.10.1.min.js', 'js/jquery.hoverfold.js'],
			nope: '',
			callback: function(url, result, key) {
				if (url === 'js/jquery.hoverfold.js') {
					$('#grid').hoverfold();
				}
			}
		});
		</script> 
		
		<!-- ===== Team Section ===== -->
		<section id="team" class="bg-success">
		  <div class="container">
			<div class="row">
			  <div class="col-lg-12 text-center">
				<h2 class="section-heading" style="color:#3680C1">Our Team</h2>
			  </div>
			</div>
			<div class="row">
			  <div class="col-sm-12 text-center">
				<div class="team-member"><img src="images/leader.jpg" class="img-responsive img-circle" alt="">
				  <h4 style="color:#3680C1">Aneri Shah</h4>
				  <p class="text-muted">Team Leader</p>
				  <p class="text-muted">Lead Developer</p>
				  <p class="text-muted">Designer</p>

				  <ul class="list-inline social-buttons">
					<li><a href="https://www.facebook.com/aneri.shah.52438"><i class="fa fa-facebook"></i></a></li>
					<li><a href="https://www.linkedin.com/in/aneri-shah-6819b3b3"><i class="fa fa-linkedin"></i></a></li>
				  </ul>
				</div>
			  </div>
			</div>
		  </div>
		</section>
		
		<!-- ===== Contact Us ===== -->
		<section id="contact">
		  <div class="container">
			<div class="row">
			  <div class="col-lg-12 text-center">
				<h2 class="section-heading" style="color:#3680C1">Contact Us</h2>
				<h3 class="section-subheading text-muted">Contact us for any query.</h3>
			  </div>
			</div>
			<div class="row">
			  <div class="col-lg-12">
				<form action="#" method="post" name="sentMessage" id="contactForm" novalidate>
				  <div class="row">
					<div class="col-lg-12 text-center">
						<div class="form-group">
							<h3 font-color="white"> Email :anerishah36@gmail.com  </h3>
							<h3 font-color="white"> Contact : (+91)7043091909  </h3>
						</div>
					<div class="clearfix"></div>
				  </div>
				</form>
			  </div>
			</div>
		  </div>
		</section>
		<footer>
		  <div class="container">
			<div class="row">
			  <div class="col-md-3"></div>
			  <div class="col-md-6">
				<a href="Privacy.jsp"> Privacy </a>
				&nbsp; &nbsp; &nbsp;
				<a href="Contact.jsp"> Contact us </a>
				&nbsp; &nbsp; &nbsp;
				<a href="Terms.jsp"> Terms </a>
				&nbsp; &nbsp; &nbsp;
				<a href="Help.jsp"> Help </a>
				&nbsp; &nbsp; &nbsp; 
				<a href="About.jsp"> About us </a>
			  </div>
			  <div class="col-md-3"></div>
			</div>
		  </div>
		</footer>
	</body>
</html>