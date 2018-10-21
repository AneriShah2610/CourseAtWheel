<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="NoviceMenu.jsp" />
<!DOCTYPE html>
<html>
	<head>
		<title>ActivatedCourse</title>
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
			<!--main content start-->
			<section id="main-content">
				<section class="wrapper">
					<div class="form-w3layouts">
						<div class="row">
							<div class="col-sm-12">
							<%
							try
							 {
								 Class.forName("com.mysql.jdbc.Driver");
								 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
								 sql="SELECT * FROM courseatwheel.course_novice where novice_id='"+user_id+"' and status='Activated' order by course_novice_id";
								 pstmt=con.prepareStatement(sql);
								 System.out.println(sql);
								 rs=pstmt.executeQuery(sql);
								 while(rs.next())
								  {	
									  course_novice_id=rs.getInt(1);
									  course_id=rs.getInt(2);
									  course_name=rs.getString(3);
									  course_image=rs.getString(9);
									  trainer_id=rs.getString(5);
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
																<td> <input type="hidden" name="course_id" id="course_id" value=<%=course_id%> /></td>
																<td> <input type="hidden" name="user_id" id="user_id" value=<%=user_id%>> </td>
																<td> <input type="hidden" name="course_novice_id" id="course_novice_id" value=<%=course_novice_id%>> </td>
																<td> <input type="hidden" name="course_name" id="course_name" value=<%=course_name%>> </td>
															</td>
														</tr>
														<tr>
															<td align="center"> <input type="submit" name="submit" id="submit" value="DeActivate Course">
														</tr>
													</div>
												</table>
											</form>
											<form>
												<td> <a href='Course.jsp?course_novice_id=<%=course_novice_id%>&cid=<%=course_id%>&cn=<%=course_name%>'><button type="button" name="submit" id="submit">Start</button> </a> </td>
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