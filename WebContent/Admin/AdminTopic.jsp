<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="AdminMenu.jsp" />
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Topic Edition </title>
    </head>
	<body>	
	<%
		String user_id=" ",course_name=" ",course_category_name=" ",topic_name=" ",topic_description=" ";
		int course_id=0,topic_id=0;
		user_id=(String) session.getAttribute("user_id");
		course_id=Integer.parseInt(request.getParameter("cid"));
		session.setAttribute("course_id",course_id);
		course_name=request.getParameter("cn");
		session.setAttribute("course_name",course_name);
		course_category_name=request.getParameter("ct");
		if(user_id==null)
		 {
			 response.sendRedirect("Error.jsp");  return;
		 }
	%>
		<!--  wrapper -->
    	<div id="wrapper">
		 <!--  page-wrapper -->
          <div id="page-wrapper">
            <div class="row">
                 <!-- page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Topic Edit </h1>
                </div>
				<a href="AdminCourseAdd.jsp">
					<strong>&laquo; Back to Course </strong> 
				</a>
				<div class="clr"></div>
                <!--end page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <!--Display course from  -->
                        <%
                        	int cid = -1;
                            try
                             {
                            	
                             }
                            catch(Exception e)
                             { }
                        %>
							<div class="panel-heading">
								 Course details
							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover" id="dataTables-example">
										<thead>
											<tr>
												<th width="100px">Course id</th>
												<th>Course name</th>
												<th>Course category</th>
											</tr>
										 </thead>
										 <tbody>
											<tr>
												<td> <%=course_id %> </td>
												<td> <%=course_name %> </td>
												<td> <%=course_category_name%> </td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- End display course form-->
							<!-- Topic entry form-->
							<div class="panel-heading">
								Topic details entry
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<form role="form" action="caw9" method="post">
											<div class="form-group has-success">
												<label class="control-label" for="inputSuccess">Enter Topic Name </label>
												<input type="text" class="form-control" id="topic_name" name="topic_name" required />
											</div>
											<div class="form-group has-success">
												<label class="control-label" for="inputSuccess">Enter Topic Description </label>
												<textarea name="description" id="description" class="form-control" rows="5" required></textarea>
											</div>
											<div>
												<td><input type="hidden" name="course_id" id="course_id" value=<%=course_id%>></td>
												<td><input type="hidden" name="course_name" id="course_name" value=<%=course_name%>></td>
												<td><input type="hidden" name="course_category_name" id="course_category_name" value=<%=course_category_name%>></td>
											</div> 
											<input type="submit" class="btn btn-primary" name="submit" id="submit" value="Topic Add">
											<input type="reset" class="btn btn-success" name="reset" value="Cancel">
										</form>
									</div>
								</div>
							</div>
							<!-- End topic entry from-->
							<form>
							<details>
							<summary>
							<div class="panel-heading">
									View topic details
							</div>
							</summary>
							<div class="panel-body">
								<div class="table-responsive">
								<%
									try
									{	
										Class.forName("com.mysql.jdbc.Driver");
										Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
										String sql="select *from courseatwheel.coursetopicview where course_id="+course_id+" and user_id='"+user_id+"' order by topic_id ";
										PreparedStatement pstmt=con.prepareStatement(sql);
										System.out.println(sql);
										ResultSet rs = pstmt.executeQuery();
								%>
										<table class="table table-striped table-bordered table-hover" id="dataTables-example">
											<thead>
												<tr>
													<th width="100px">Topic id</th>
													<th> Topic name</th>
													<th> Description </th>
													<th> Course </th>
												</tr>
											</thead>
											<%
												while(rs.next())
												 {
													topic_id=rs.getInt(3);
													topic_name=rs.getString(4);
													topic_description=rs.getString(5);
													course_name=rs.getString(2);
											%>
													<tbody>
														<tr>
															<td> <%=topic_id %> </td>
															<td> <%=topic_name %> </td>
															<td> <%=topic_description%> </td>
															<td> <%=course_name%> </td>
															<td><input type="hidden" name="course_category_name" id="course_category_name" value=<%=course_category_name%>></td>
															<td> <a href='caw9?tid=<%=topic_id%>&cid=<%=course_id%>&uid=<%=user_id%>&cn=<%=course_name%>' /> delete </a> </td>
															<td> <a href='AdminLec.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&tn=<%=topic_name%>&td=<%=topic_description%>&cn=<%=course_name%>'> <button type="button" name="addlec" id="addlec"> Add Lec </button> </a></td>
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
						</details>
						</form>
						<!-- End Form Elements -->
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
