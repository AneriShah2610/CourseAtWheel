<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="TrainerMenu2.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title> Course Add </title>
	</head>
	<body>
	<%
		int course_id=0;
		String user_id=" ",course_name=" ",course_category_name=" ",course_sub_category_name=" ",description=" ",course_type=" ",c_type=" ",course_image=" ";
		user_id=(String)session.getAttribute("user_id");
		ResultSet rs;
		Connection con;
		PreparedStatement pstmt;
		String sql=" ";
		if(user_id==null)
		 {
			 response.sendRedirect("Error.jsp");
		 }
	%>
		<div id="right-panel" class="right-panel">
			<div class="breadcrumbs">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>Course</h1>
						</div>
					</div>
				</div>
				<div class="content mt-3">
					<div class="animated fadeIn">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-body">
										<table id="bootstrap-data-table" class="table table-striped table-bordered" border="1">
											<thead class="thead-dark">
												<tr>
													<th> Course </th>
													<th> Course Category </th>
													<th> Course Sub Category </th>
													<th> Description </th>
													<th> Course Type </th>
													<th> Type </th>
													<th> Preview </th>
												</tr>
											</thead>
											<%
												try  
												 {
													Class.forName("com.mysql.jdbc.Driver");
													con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
													sql="SELECT * FROM courseatwheel.coursecategoryview where user_id='"+user_id+"'";
													pstmt=con.prepareStatement(sql);
													System.out.println(sql);
													rs=pstmt.executeQuery(sql);
													while(rs.next())
													 {
														course_id=rs.getInt(1);
														course_name=rs.getString(2);
														course_category_name=rs.getString(3);
														course_sub_category_name=rs.getString(4);
														description=rs.getString(5);
														course_type=rs.getString(6);
														c_type=rs.getString(7);
														course_image=rs.getString(9);
											%>
											
													<tbody>
														<tr>
															<td> <%= course_name%> </td>
															<td> <%= course_category_name%> </td>
															<td> <%= course_sub_category_name%> </td>
															<td> <%= description%> </td>
															<td> <%= course_type%> </td>
															<td> <%= c_type%> </td>
															<td> <img src='<%= course_image %>' height='100'  width='100' alt='course' /> </td>
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
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>