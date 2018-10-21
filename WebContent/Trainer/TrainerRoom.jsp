<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="TrainerMenu.jsp" />
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Trainer Room</title>
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
		<!-- Header -->
		<header class="text-center" name="home">
		  <div class="intro-text">
		    <div class="clearfix"></div>
		    <a href="#works-section" class="btn btn-default btn-lg page-scroll">Learn More</a> </div>
		</header>
	
		<!-- Trainer Section -->
		<div id="works-section">
		  <div class="container"> <!-- Container -->
		    <div class="section-title">
		      <h2>Trainer Section</h2>
		      <hr>
		      <div class="clearfix"></div>
		    </div>
		    <div class="row">
		      <div class="portfolio-items">
		      
		       <!-- MyCourse -->
		        <div class="col-sm-6 col-md-3 col-lg-3 web">
          			<div class="portfolio-item">
            			<div class="hover-bg"> <a href="MyCourse.jsp">
             			 	<div class="hover-text">
               				 	<h4>My Courses</h4>
                				<div class="clearfix"></div>
              				</div>
             			<img src="trainer/img/portfolio/1.png" class="img-responsive" alt="Project Title"> </a> </div>
          			</div>
       			</div>
		        <!-- End MyCourse -->
		        
		        <!-- AddCourse -->
		        <div class="col-sm-6 col-md-3 col-lg-3 app">
          			<div class="portfolio-item">
            			<div class="hover-bg"> <a href="TrainerCourseAdd.jsp">
             				 <div class="hover-text">
                				<h4>Add Course</h4>
               				 	<div class="clearfix"></div>
              				</div>
              			<img src="trainer/img/portfolio/2.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          		   </div>
        		</div>
		        <!-- End AddCourse -->
		        
		        <!-- CourseNovice -->
		        <div class="col-sm-6 col-md-3 col-lg-3 web">
          			<div class="portfolio-item">
            			<div class="hover-bg"> <a href="TrainerCourseNovice.jsp">
             				<div class="hover-text">
                				<h4>Course-Novice</h4>
                				<div class="clearfix"></div>
              				</div>
              			<img src="trainer/img/portfolio/3.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          			</div>
        		</div>
		        <!-- End CourseNovice -->
		        
		        <!-- LearnCourse -->
		        <div class="col-sm-6 col-md-3 col-lg-3 web">
          			<div class="portfolio-item">
            			<div class="hover-bg"> <a href="CourseView.jsp" rel="prettyPhoto">
              				<div class="hover-text">
                				<h4>Learn Course</h4>
                				<div class="clearfix"></div>
              				</div>
              			<img src="trainer/img/portfolio/4.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          			</div>
       			</div>
		        <!--  End LearnCourse -->
		        
		        <!-- Courses -->
		        <div class="col-sm-6 col-md-3 col-lg-3 app">
          			<div class="portfolio-item">
            			<div class="hover-bg"> <a href="CourseView.jsp">
              				<div class="hover-text">
                				<h4>Courses</h4>
                				<div class="clearfix"></div>
              				</div>
              			<img src="trainer/img/portfolio/05.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          			</div>
        		</div>		        
        		<!-- End courses -->
		        
		        <!-- QuerySection -->
		        <div class="col-sm-6 col-md-3 col-lg-3 branding">
          			<div class="portfolio-item">
            			<div class="hover-bg"> <a href="">
              				<div class="hover-text">
                				<h4>Query Section</h4>
               					<div class="clearfix"></div>
              				</div>
              			<img src="trainer/img/portfolio/6.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          			</div>
        		</div>		       
        	    <!-- End QuerySection -->
        	    
		        <!-- MyEvents -->
		        <div class="col-sm-6 col-md-3 col-lg-3 branding">
          			<div class="portfolio-item">
            			<div class="hover-bg"> <a href="MyEvents.jsp">
              				<div class="hover-text">
                			<h4>My Events</h4>
                		<div class="clearfix"></div>
              		</div>
              		<img src="trainer/img/portfolio/7.png" class="img-responsive" alt="Project Title"> </a> </div>
          		</div>
          	</div>
		    <!-- End MyEvent -->
		    
		    <!-- My Classroom -->
		    <div class="col-sm-6 col-md-3 col-lg-3 branding">
          		<div class="portfolio-item">
            		<div class="hover-bg"> <a href="TrainerClassroon.jsp">
              			<div class="hover-text">
                			<h4>My Classroom</h4>
                			<div class="clearfix"></div>
              			</div>
              		<img src="trainer/img/portfolio/8.jpg" class="img-responsive" alt="Project Title"> </a> </div>
          		</div>
          	</div>
		    <!-- End My Classroom -->     
		    </div>
		    <!-- Portfolio items end -->
		    </div>
		    <!-- end row -->
		  </div>
		  <!-- End container class -->
		</div>
		<!-- End work section -->
		</div>
		
		<div id="footer">
		  <div class="container">
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
		</div>
	</body>
</html>