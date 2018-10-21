<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="NoviceMenu.jsp" />
<!DOCTYPE HTML>
<html>
	<head>
		<title> Saved Courses </title>
	</head>
	<body>
	<%
			String user_id=(String) session.getAttribute("user_id");
			if(user_id==null)
			 {
				 response.sendRedirect("Error.jsp");
			 }
			Connection con;
			PreparedStatement pstmt;
			ResultSet rs;
			String sql=" ";
	 %>
		<section id="main-content">
			<section class="wrapper">
				<div class="table-agile-info">
					<div class="panel panel-default">
						<div class="panel-heading">
							Saved Courses
						</div>
						<br/>
						<br/>
						<br/>
						<div class="table-responsive">
							<table class="table table-striped b-t b-light">
								<p align="center"> <%= user_id%> don't have any saved courses right now! </p>
								<br>
									<div class="center">
										&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 
										
										<img align="center" src="images\save_course.jpg" alt="image" height="300px" width="300px" \> 
										<br>
										<br>
										&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; 
										<a href="CourseView.jsp"><button type="button" name="catalog" id="catalog"> Explored catalog </button> </a>
									</div>
							</table>
						</div>
					</div>
				</div>
			</section>
		</section>
	</body>
</html>