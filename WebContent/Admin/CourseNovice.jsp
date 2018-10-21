<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> CourseNovice </title>
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
		<!--  page-wrapper -->
          <div id="page-wrapper">
            <div class="row">
                 <!-- page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">CourseNovice</h1>
                </div>
                <!--end page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
								<%		
									try
									 {
										Class.forName("com.mysql.jdbc.Driver");
										con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
										sql="SELECT * FROM courseatwheel.course_novice where status='Activated' order by course_novice_id";
										pstmt=con.prepareStatement(sql);
										System.out.println(sql);
										rs = pstmt.executeQuery();
								%>
                                    <form role="form" method="post">
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover" id="dataTables-example">
												<thead>
													<tr> 
														<th>Novice</th>
														<th>Trainer</th>
														<th>Course</th>
														<th>Join_date</th>
														<th>Completion date</th>
													</tr>
												</thead>
												<%
														while(rs.next())
														 {
															novice_id=rs.getString(4);
															trainer_id=rs.getString(5);
															course_name=rs.getString(3);
															join_date=rs.getString(6);
															completion_date=rs.getString(7);
													%>
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
                                    </form>
                                </div>
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
