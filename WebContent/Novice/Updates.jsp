<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="NoviceMenu.jsp" />
<!DOCTYPE html>
<html>
	<head>
		<title>Updates</title>
	</head>
	<body>
	<%
		int course_category_id=0,course_id=0,novice_id=0,course_novice_id=0;
		String course_category_name=" ",user_id=" ",course_name=" ",course_image=" ",trainer_id=" ",description=" ",status=" ";
		user_id=(String) session.getAttribute("user_id");
		if(user_id==null)
		 {
			 response.sendRedirect("Error.jsp");
		 }
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql=" ";
	%>
		<section id="container">
			<section id="main-content">
				<section class="wrapper">
					<div class="w3layouts-glyphicon">		
					<div class="grid_3 grid_4">
							<h2 class="w3ls_head">Updates</h2>
							<h3 class="page-header icon-subheading" class="center">Currently You don't have any updates.</h3>
						<div class="clearfix"></div>
						</div>
					</div>
				</section>
			</section>
		</section>
	</body>
</html>