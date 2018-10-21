<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Add Course in CourseAtWheel </title>
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
                    <h1 class="page-header">Add Courses</h1>
					<a href="AdminCourse.jsp"> Back </a>
                </div>
                <!--end page header -->
            </div>
			<%
				int cid=-1;
				try
				 {
					 cid=Integer.parseInt(request.getParameter("course_id"));
				 }
				catch(Exception e)
				 {}
				Connection con;
				String sql=" ";
				PreparedStatement pstmt;
				ResultSet rs;
				int course_id=0;
				String course_name=" ",course_category_name=" ",course_sub_category_name=" ",description=" ",course_type=" ",c_type=" ",course_image=" ";
				int course_category_id=0;
			%>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
					<!-- Entry form Elements -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" action="caw4" method="post" enctype="multipart/form-data"> 
										<div class="form-group">
                                            <label>Select one</label>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="Technical" checked>Technical
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="Non-Technical">Non-Technical
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Select Category</label>
										<%
											try  
											 {
												 Class.forName("com.mysql.jdbc.Driver");
												 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
											 	
										%>
												<select name="category" id="category" class="form-control">
													 <%
														sql="select *from courseatwheel.course_category order by course_category_id";
														pstmt=con.prepareStatement(sql);
														System.out.println(sql);
														rs=pstmt.executeQuery(sql);
														while(rs.next())
														 {
															course_category_id=rs.getInt(1);
															course_category_name=rs.getString(2);
															course_sub_category_name=rs.getString(3);
													%>
															<option value='<%= course_category_id%>'> <%= course_category_name%> </option>
													<%					
														 }
													%>
												</select>
												</div>
												<div class="form-group">
													<label>Enter Course</label>
													<input class="form-control" placeholder="Enter course title" type="text" name="course" id="course" required/>
												</div>
												<div class="form-group">
													<label> Enter Description about Course </label>
													<textarea name="description" id="description" class="form-control" rows="5"></textarea>
												</div>
												<div class="form-group">
													<label> Upload Image </label>
													<input type="file" name="file" id="file" size="100" />
												</div>
												<div class="form-group">
													<label> Select type of course </label>
													<select name="course_type" id="course_type" class="">
														<option> Live </option>
														<option> Recorded </option>
													</select>
												</div>
												<div class="panel-body">
													<p>
														<input type="submit" name="submit" id="submit" value="Add" class="btn btn-default">
														<input type="reset" class="btn btn-primary">
													</p>
												</div>
											</form>
									<%
										 }
										catch(Exception e)
										 {
											 e.printStackTrace();
											 System.out.println(e);
										 }
									%>
                                </div>
                            </div>
                        </div>
						<!-- End entry form Elements -->
						<!-- Display form Elements -->
						<div class="panel-heading">
                            View course details
                        </div>
						<div class="panel-body">
						<form role="form" action="caw4" method="post">
                            <div class="table-responsive">
                            <%
	                            try
	                            {
		                           	Class.forName("com.mysql.jdbc.Driver");
		                   			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
		                   			sql="select *from courseatwheel.coursecategoryview where user_id='Admin' order by course_id";
		                   			pstmt=con.prepareStatement(sql);
		                   			System.out.println(sql);
		                   			rs = pstmt.executeQuery();
                            %>
	                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
	                                    <thead>
	                                        <tr>
	                                            
	                                            <th>Course name</th>
												<th>Course category</th>
												<th>Category type</th>
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
												course_category_name=rs.getString(3);
												course_sub_category_name=rs.getString(4);
												course_image=rs.getString(9);
												description=rs.getString(5);
												course_type=rs.getString(6);
												c_type=rs.getString(7);
												
	                                    %>
	                                    		<tbody>
	    										<tr>
	    											
	    											<td> <%=course_name %> </td>
													<td> <%=course_category_name%> </td>
													<td> <%=course_sub_category_name%> </td>
													<td> <img src='<%= course_image %>' height='100'  width='100' alt='course' /> </td>
													<td> <%=description%> </td>
													<td> <%=course_type%> </td>
													<td> <%=c_type%> </td>
													<td> <a href='caw4?cid=<%=course_id%>'> delete </a> </td>
													<td> <a href='AdminTopic.jsp?cid=<%=course_id%>&cn=<%= course_name%>&ct=<%=course_category_name%>' /> <button type="button" name="addtopic" id="addtopic"> Add Topic </button> </a> </td>
	    										</tr>
	    									</tbody>
	    								<%
	                                    	  }
	    								%>
	                                </table>
	                        <%
	                        		con.close();
	                            }
							   catch(Exception ex)
                            	 {
								   ex.printStackTrace();
								   System.out.println(ex);
                            	 }	
	                        %>  
                            </div>
						</form>
                        </div>
						<!-- End Display form Elements -->
                    </div>
                </div>
            </div>
        </div>
        <!-- end page-wrapper -->
	</body>
</html>
