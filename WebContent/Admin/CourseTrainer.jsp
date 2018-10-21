<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>CourseTrainer </title>
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
                    <h1 class="page-header">CourseTrainer</h1>
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
				String course_name=" ",course_category_name=" ",course_sub_category_name=" ",description=" ",course_type=" ",c_type=" ";
			%>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form role="form">
										<div class="table-responsive">
										<%
											try
											 {
												Class.forName("com.mysql.jdbc.Driver");
												con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
												sql="select *from courseatwheel.coursecategoryview order by course_id";
												pstmt=con.prepareStatement(sql);
												System.out.println(sql);
												rs = pstmt.executeQuery();
										%>
											<table class="table table-striped table-bordered table-hover" id="dataTables-example">
												<thead>
													<tr> 
														<th>Trainer</th>
														<th>Course</th>
														<th>Category</th>
														<th>Category Type</th>
														<th width="200px">Description</th>
														<th>Recorded/Live</th>
														<th>Certified/Non-certified</th>
													</tr>
												</thead>
												 <%
													while(rs.next())
													 {
														user_id=rs.getString(8);
														course_name=rs.getString(2);
														course_category_name=rs.getString(3);
														course_sub_category_name=rs.getString(4);
														description=rs.getString(5);
														course_type=rs.getString(6);
														c_type=rs.getString(7);
														
												%>
													<tbody>
														<tr>
															<td> <%=user_id%> </td> 
															<td> <%=course_name%> </td>
															<td> <%=course_category_name%> </td>
															<td> <%=course_sub_category_name%> </td>
															<td width="200px"> <%=description%> </td>
															<td> <%=course_type%> </td>
															<td> <%=c_type%> </td>
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
