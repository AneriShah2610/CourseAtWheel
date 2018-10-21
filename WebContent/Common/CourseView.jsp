<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="CourseCatalogMenu.jsp" />
<!DOCTYPE html>
<html>
	<head>
		<title>Courses</title>
	</head>
	<body>
	<%
		int course_id=0;
		String course_category_name=" ",user_id=" ",course_name=" ",course_image=" ",trainer_id=" ",description=" ";
		System.out.println(course_category_name);
		user_id=(String) session.getAttribute("user_id");
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql=" ";
	%>
		<section id="container">
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="form-w3layouts">
					<div  class="row">
						<a href="NoviceRoom.jsp">
								<i class="fa fa-mail-reply"></i>
						</a>
					</div>
					<div class="row">
						<div class="col-sm-12">
						<%
						try
						 {
							 Class.forName("com.mysql.jdbc.Driver");
							 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
							 sql="SELECT * FROM courseatwheel.coursecategoryview";
							 pstmt=con.prepareStatement(sql);
							 System.out.println(sql);
							 rs=pstmt.executeQuery(sql);
							 while(rs.next())
							  {
								  course_id=rs.getInt(1);
								  course_name=rs.getString(2);
								  course_image=rs.getString(9);
								  trainer_id=rs.getString(8);
								  description=rs.getString(5);
						%>
								<section class="panel">
									<div class="table-responsive">
										<form action="caw11" method="post" role="form" class="form-horizontal" name="courseForm">
											<table class="table table-striped b-t b-light">
												<header class="panel-heading">
													<%=course_name%>
												</header>
												<div>
													<tr>
														<td> <img src='<%= course_image %>' height='150'  width='150' alt='course' /> </td>
														<td>
															<td><strong>Trainer: </strong><%=trainer_id%> </td>
															<td><strong>Description: </strong><%=description%> </td>
															<td> <input type="hidden" name="course_id" id="course_id" value=<%=course_id%> /></td>
															<td> <input type="hidden" name="course_name" id="course_name" value=<%=course_name%> /></td>
															<td> <input type="hidden" name="trainer" id="trainer" value=<%=trainer_id%> /> </td>
															<td> <input type="hidden" name="course_image" id="course_image" value=<%=course_image%> /> </td>
															<td> <input type="hidden" name="user_id" id="user_id" value=<%=user_id%>> </td>
															<td> <input type="hidden" name="description" id="description" value=<%=description%>> </td>
														</td>
													</tr>
													<tr>
														<td align="center">&nbsp; &nbsp; &nbsp;  <input type="submit" name="submit" id="submit" value="Enroll"></td>
													</tr>
												</div>
											</table>
										</form>
									</div>
								</section>
						<%
							  }
							 con.close();
						  }
						 catch(Exception e)
						  {
							  e.printStackTrace();
						  }
						%> 
						</div>
					</div>
				</div>
			</section>
		</section>

		<!--main content end-->
		</section>
		<script src="js/bootstrap.js"></script>
		<script src="js/jquery.dcjqaccordion.2.7.js"></script>
		<script src="js/scripts.js"></script>
		<script src="js/jquery.slimscroll.js"></script>
		<script src="js/jquery.nicescroll.js"></script>
		<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
		<script src="js/jquery.fileupload.js"></script>
		<script src="js/script.js"></script>
		<script src="js/jquery.scrollTo.js"></script>
	</body>
</html>
