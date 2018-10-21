<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Detailed course </title>
    </head>
	<body>
		<%
			String user_id=" ",course_name=" ",course_category=" ",category_type=" ",course_image=" ",description=" ",c_type=" ",course_type=" ";
			String topic_name=" ",lecture_name=" ",lecture_file=" ",topic_description=" ",quiz_name=" ";
			String tutorial_file=" ",exam_name=" ",exam_file=" ",quiz_file=" ",assignment_name=" ",assignment_file=" ";
			int course_id=0,topic_id=0,lecture_id=0,exam_id=0,tutorial_id=0,quiz_id=0,assignment_id=0;
			course_name=request.getParameter("cn");
			course_id=Integer.parseInt(request.getParameter("cid"));
			Connection connection;
			PreparedStatement pstmt;
			ResultSet rs;
			user_id=(String)session.getAttribute("user_id");
			if(user_id==null)
			 {
				 response.sendRedirect("Error.jsp");
			 }
		%>
		
		<div id="page-wrapper">
			<div class="row">
                 <!-- page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Courses</h1>
                </div>
				<a href="AdminCourseView.jsp">
                    <strong>&laquo; Course </strong> 
					<div class="clr"></div>
                </a>
                <!--end page header -->
            </div>
			<div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-body">
						<form method="post">
                            <div class="row">
							<%
								int cid = -1;
									try
									 {
										
									 }
									catch(Exception e)
									 { }
							%>
							</div>
							<div class="table-responsive">
                            <%
	                            try
	                            {
		                           	Class.forName("com.mysql.jdbc.Driver");
		                   			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
									String sql="SELECT * FROM courseatwheel.coursecategoryview where user_id='"+user_id+"' and course_id='"+course_id+"'";
		                   			pstmt=connection.prepareStatement(sql);
		                   			System.out.println(sql);
		                   			rs = pstmt.executeQuery();
                            %>		
								<form method="post">
									<div>
										<table class="table table-striped table-bordered table-hover" id="dataTables-example">
											<thead>
												<tr>
													<th>Course_Name</th>
													<th>Catrgory</th>
													<th>Category Type</th>
													<th>Image</th>
													<th>Description</th>
													<th>Recorded/Live</th>
													<th>Certified/Non-certified</th>
												</tr>
											</thead>
											<%
												while(rs.next())
												 {
													course_id=rs.getInt(1);
													course_name=rs.getString(2);
													course_category=rs.getString(3);
													category_type=rs.getString(4);
													course_image=rs.getString(9);
													description=rs.getString(5);
													course_type=rs.getString(6);
													c_type=rs.getString(7);
													
											%>
													<tbody>
														<tr>
															<td> <%=course_name %> </td>
															<td> <%=course_category%> </td>
															<td> <%=category_type%> </td>
															<td> <img src='<%= course_image %>' height='100'  width='100' alt='course' /> </td>
															<td> <%=description%> </td>
															<td> <%=course_type%> </td>
															<td> <%=c_type%> </td>
														</tr>
													</tbody>
											<%
												  }
											%>
										</table>
										<%
												connection.close();
											}
										   catch(Exception ex)
											{
											   ex.printStackTrace();
											   System.out.println(ex);
											}
										%>   
									</div>
									<%
										try
										{
											Class.forName("com.mysql.jdbc.Driver");
											connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
											String sql="SELECT * FROM courseatwheel.coursetopicview where user_id='"+user_id+"' and course_id='"+course_id+"'";
											pstmt=connection.prepareStatement(sql);
											System.out.println(sql);
											rs = pstmt.executeQuery();
									%>		
									<div>
										<details>
											<summary><a>Topic Details > </a></summary>
											<form>
												<table class="table table-striped table-bordered table-hover" id="dataTables-example">	
													<thead>
													<tr>
														<th>Topic</th>
														<th>Description</th>
													</tr>
												</thead>
												<%
													while(rs.next())
													 {
														topic_id=rs.getInt(3);
														topic_name=rs.getString(4);
														topic_description=rs.getString(5);
												%>
														<tbody>
															<tr>
																<td> <%=topic_name %> </td>
																<td> <%=topic_description%> </td>
															</tr>
														</tbody>
												<%
													  }
												%>
												</table>
												<%
												connection.close();
											}
										   catch(Exception ex)
											{
											   ex.printStackTrace();
											   System.out.println(ex);
											}
										%>   
										</form>
									</details>
								</div>
								<%
										try
										{
											Class.forName("com.mysql.jdbc.Driver");
											connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
											String sql="SELECT * FROM courseatwheel.courselecview where user_id='"+user_id+"' and course_id='"+course_id+"'";
											pstmt=connection.prepareStatement(sql);
											System.out.println(sql);
											rs = pstmt.executeQuery();
									%>		
									<div>
										<details>
											<summary><a>Lecture Details > </a></summary>
											<form>
												<table class="table table-striped table-bordered table-hover" id="dataTables-example">	
													<thead>
													<tr>
														<th>Lecture</th>
														<th>File</th>
														<th>Topic</th>
													</tr>
												</thead>
												<%
													while(rs.next())
													 {
														lecture_id=rs.getInt(5);
														lecture_name=rs.getString(6);
														lecture_file=rs.getString(7);
														topic_name=rs.getString(4);
												%>
														<tbody>
															<tr>
																<td> <%=lecture_name %> </td>
																<td> <video width="400" height="200" controls>
																		<source src='<%=lecture_file%>' type="video/mp4">
																	 </video> 
																</td>
																<td> <%=topic_name%> </td>
															</tr>
														</tbody>
												<%
													  }
												%>
												</table>
												<%
												connection.close();
											}
										   catch(Exception ex)
											{
											   ex.printStackTrace();
											   System.out.println(ex);
											}
										%>   
										</form>
									</details>
								</div>
								<%
										try
										{
											Class.forName("com.mysql.jdbc.Driver");
											connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
											String sql="SELECT * FROM courseatwheel.quizview order by quiz_id";
											pstmt=connection.prepareStatement(sql);
											System.out.println(sql);
											rs = pstmt.executeQuery();
									%>		
									<div>
										<details>
											<summary><a> Quiz Details > </a></summary>
											<form>
												<table class="table table-striped table-bordered table-hover" id="dataTables-example">	
													<thead>
													<tr>
														<th>Quiz name</th>
														<th>Lecture</th>
														<th>Topic</th>
														<th>Quiz Details</th>
													</tr>
												</thead>
												<%
													while(rs.next())
													 {
														quiz_name=rs.getString(2);
														lecture_name=rs.getString(14);
														topic_name=rs.getString(15);
												%>
														<tbody>
															<tr>
																<td> <%=quiz_name %> </td>
																<td> <%=lecture_name%></td>
																<td> <%=topic_name%> </td>
																<td> <a> Quiz Details </a> </td>
															</tr>
														</tbody>
												<%
													  }
												%>
												</table>
												<%
												connection.close();
											}
										   catch(Exception ex)
											{
											   ex.printStackTrace();
											   System.out.println(ex);
											}
										%>   
										</form>
									</details>
								</div>
								<div>
									<details>
										<summary> <a>Assignment Details > </a></summary>
												No Assignment.
									</details>
								</div>
								
								
								
								<div>
									<details>
										<summary> <a> Exam Details > </a></summary>
												No exam.
									</details>
								</div>
							</form>
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>