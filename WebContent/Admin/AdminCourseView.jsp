<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Courses in CourseAtWheel </title>
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
		<!--  page-wrapper -->
          <div id="page-wrapper">
            <div class="row">
                 <!-- page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Courses</h1>
					<a href="AdminCourse.jsp"> Back </a>
                </div>
                <!--end page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
								<%
									int cid = -1;
									try
									 {
										
									 }
									catch(Exception e)
									 { }
									int course_id=0;
									String course_name=" ",course_category=" ",category_type=" ",description=" ",course_type=" ",c_type=" ",course_image=" ";
									Connection connection;
									PreparedStatement pstmt;
									ResultSet rs;
								%>
                             </div>
							 <div class="table-responsive">
                            <%
	                            try
	                            {
		                           	Class.forName("com.mysql.jdbc.Driver");
		                   			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
									String sql="SELECT * FROM courseatwheel.coursecategoryview where user_id='Admin' ";
		                   			pstmt=connection.prepareStatement(sql);
		                   			System.out.println(sql);
		                   			rs = pstmt.executeQuery();
                            %>		
								<form method="post">
	                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
	                                    <thead>
	                                        <tr>
	                                            <th>Course_Name</th>
												<th>Image</th>
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
														<td> <img src='<%= course_image %>' height='100'  width='100' alt='course' /> </td>
														<td> <a href='ViewDetailedCourse.jsp?cid=<%=course_id%>'> <button type="button"  name="submit" id="submit"> View Detailed Course </button> </a> </td> 
														<td> <a href='UpdateCourse.jsp?cid=<%=course_id%>'> <button type="button"  name="submit" id="submit"> Update Course </button> </a> </td>
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
                            </div>
                        </div>
                    </div>
                     <!-- End Form Elements -->
                </div>
            </div>
        </div>
        <!-- end page-wrapper -->
	</body>
</html>
