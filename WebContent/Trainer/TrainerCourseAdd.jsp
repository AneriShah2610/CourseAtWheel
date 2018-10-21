<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="TrainerMenu2.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
	<head>
		<title> Course Add </title>
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
		<!-- Right Panel -->
		<div id="right-panel" class="right-panel">
			<div class="breadcrumbs">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>Course</h1>
						</div>
					</div>
				</div>
			</div>
			<div class="content mt-3">
				<div class="animated fadeIn">
					<div class="row">
					  <div class="col-lg-6">
						  <div class="card-header">
							<strong>Add Course</strong>
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
						  <div class="card-body card-block">
							<form action="caw4" method="post" enctype="multipart/form-data" class="form-horizontal">
							  <div class="row form-group">
								<div class="col col-md-3"><label class=" form-control-label">Select:</label></div>
								<div class="col col-md-9">
								  <div class="form-check">
									<div class="radio">
									  <label for="radio1" class="form-check-label ">
										<input type="radio" id="optionsRadios" name="optionsRadios" value="Technical" class="form-check-input">Technical
									  </label>
									</div>
									<div class="radio">
									  <label for="radio2" class="form-check-label ">
										<input type="radio" id="optionsRadios" name="optionsRadios" value="Non-Technical" class="form-check-input">Non-Technical
									  </label>
									</div>
								  </div>
								</div>
							  </div>
							  <div class="row form-group">
								<div class="col col-md-3"><label for="select" class=" form-control-label">Select Category</label></div>
							<%
								try  
								 {
									Class.forName("com.mysql.jdbc.Driver");
									con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
							%>
								<div class="col-12 col-md-9">
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
							  </div>
							  <div class="row form-group">
								<div class="col col-md-3"><label for="text-input" class=" form-control-label">Enter Course</label>
								</div>
								<div class="col-12 col-md-9"><input type="text" id="course" name="course" class="form-control">
								</div>
							  </div>
							  <div class="row form-group">
								<div class="col col-md-3"><label for="textarea-input" class=" form-control-label">Enter Course description</label></div>
								<div class="col-12 col-md-9"><textarea name="description" id="description" rows="9" placeholder="Course Content..." class="form-control"></textarea></div>
							  </div>
							  <div class="row form-group">
								<div class="col col-md-3"><label for="file-input" class=" form-control-label">Upload image</label></div>
								<div class="col-12 col-md-9"><input type="file" id="file" name="file" class="form-control-file" size="100"/></div>
							  </div>
							  <div class="row form-group">
								<div class="col col-md-3"><label for="select" class=" form-control-label">Select type of course</label></div>
								<div class="col-12 col-md-9">
								  <select name="course_type" id="course_type" class="form-control">
									<option> Live </option>
									<option> Recorded </option>
								  </select>
								</div>
							  </div>
							  <div class="row form-group">
								<p>
									<input type="submit" name="submit" id="submit" value="Add" class="btn btn-default">
									<input type="reset" class="btn btn-primary" value="Reset">
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
					</div><!-- .animated -->
				</div><!-- .content -->
			</div>
			<div class="content mt-3">
				<div class="animated fadeIn">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<strong class="card-title">View Course Details</strong>
								</div>
								<div class="card-body">
								<form role="form" action="caw4" method="post">
								<%
									try
									{
										Class.forName("com.mysql.jdbc.Driver");
										con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
										sql="select *from courseatwheel.coursecategoryview  where user_id='"+user_id+"' order by course_id";
										pstmt=con.prepareStatement(sql);
										System.out.println(sql);
										rs = pstmt.executeQuery();
								%>
									<table id="bootstrap-data-table" class="table table-striped table-bordered">
										<thead>
	                                        <tr>
	                                            <th width="100px">Course id</th>
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
	    											<td> <%=course_id %> </td>
	    											<td> <%=course_name %> </td>
													<td> <%=course_category_name%> </td>
													<td> <%=course_sub_category_name%> </td>
													<td> <img src='<%= course_image %>' height='100'  width='100' alt='course' /> </td>
													<td> <%=description%> </td>
													<td> <%=course_type%> </td>
													<td> <%=c_type%> </td>
													<td> <a href='TrainerTopic.jsp?cid=<%=course_id%>&cn=<%= course_name%>&ct=<%=course_category_name%>'> <button type="button" name="addtopic" id="addtopic"> Add Topic </button> </a> </td>
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
								</form>
								</div>
							</div>
						</div>
					</div>
				</div><!-- .animated -->
			</div><!-- .content -->
		</div>
		<!-- Right Panel -->
	</body>
</html>
