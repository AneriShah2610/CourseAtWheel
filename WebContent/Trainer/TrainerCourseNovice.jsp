<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="TrainerMenu2.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Trainer Room</title>
	</head>
	<body>
		<%
			String user_id=" ",novice_id=" ",course_name=" ",trainer_id=" ",completion_date=" ",status=" ",join_date=" ";
			int course_novice_id=0,course_id=0;
			user_id=(String)session.getAttribute("user_id");
			Connection con;
			String sql=" ";
			PreparedStatement pstmt;
			ResultSet rs;
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
							<h1>My course's novice details</h1>
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
													<th>Novice</th>
													<th>Trainer</th>
													<th>Course</th>
													<th>Join_date</th>
													<th>Completion date</th>
												</tr>
											</thead>
											<%
												try  
												 {
													Class.forName("com.mysql.jdbc.Driver");
													con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
													sql="SELECT * FROM courseatwheel.course_novice where status='Activated' and trainer_id='"+user_id+"'order by course_novice_id";
													pstmt=con.prepareStatement(sql);
													System.out.println(sql);
													rs=pstmt.executeQuery(sql);
													while(rs.next())
													 {
														novice_id=rs.getString(4);
														trainer_id=rs.getString(5);
														course_name=rs.getString(3);
														join_date=rs.getString(6);
														completion_date=rs.getString(7);
											%>=
													<tbody>
														<tr>
															<td> <%= novice_id%> </td>
															<td> <%= trainer_id%> </td>
															<td> <%= course_name%> </td>
															<td> <%= join_date%> </td>
															<td> <%= completion_date%> </td>
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