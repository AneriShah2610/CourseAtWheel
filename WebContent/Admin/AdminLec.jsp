<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="AdminMenu.jsp" />
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Lecture Edition </title>
    </head>
	<body>
			
	<%
		String user_id=" ",course_name=" ",topic_name=" ",topic_description=" ",lecture_file=" ",lecture_name=" ";
		int course_id=0,topic_id=0,lecture_id=0;
		user_id=(String) session.getAttribute("user_id");
		course_id=Integer.parseInt(request.getParameter("cid"));
		course_name=request.getParameter("cn");
		topic_id=Integer.parseInt(request.getParameter("tid"));
		System.out.println(topic_id);
		topic_name=request.getParameter("tn");
		System.out.println(topic_name);
		topic_description=request.getParameter("td");
		if(user_id==null)
		 {
			 response.sendRedirect("Error.jsp");
		 }
	%>
		<!--  wrapper -->
    	<div id="wrapper">
		 <!--  page-wrapper -->
          <div id="page-wrapper">
            <div class="row">
                 <!-- page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Lecture Edit </h1>
                </div>
				<a href="AdminTopic.jsp">
					<strong>&laquo; Back To Topic </strong> 
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
                        	int lid = -1;
                            try
                             {
                            	
                             }
                            catch(Exception e)
                             { }
                        %>
							<div class="panel-heading">
								 Topic details
							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover" id="dataTables-example">
										<thead>
											<tr>
												<th width="100px">Topic id </th>
												<th>Topic name </th>
												<th>Topic description</th>
												<th>Course</th>
											</tr>
										 </thead>
										 <tbody>
											<tr>
												<td> <%=topic_id %> </td>
												<td> <%=topic_name %> </td>
												<td> <%=topic_description%> </td>
												<td> <%=course_name%> </td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- End display course form-->
							<!-- Topic entry form-->
							<div class="panel-heading">
								Lecture details entry
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<form role="form" action="caw10" method="post" enctype="multipart/form-data">
											<div class="form-group has-success">
												<label class="control-label" for="inputSuccess">Lecture Name </label>
												<input type="text" class="form-control" id="lecture_name" name="lecture_name" required />
											</div>
											<div class="row form-group">
												<div class="col col-md-3"><label for="file-input" class=" form-control-label">Upload File</label></div>
												<div class="col-12 col-md-9"><input type="file" id="file" name="file" class="form-control-file" size="100"/></div>
											</div>
											<div>
												<td><input type="hidden" name="course_id" id="course_id" value=<%=course_id%>></td>
												<td><input type="hidden" name="topic_id" id="topic_id" value=<%=topic_id%>></td>
											</div> 
											<input type="submit" class="btn btn-primary" name="submit" id="submit" value="Lecture Add">
											<input type="reset" class="btn btn-success" name="reset" value="Cancel">
										</form>
									</div>
								</div>
							</div>
							<!-- End topic entry from-->
							<form role="form" action="caw10" method="post">
							<details>
							<summary>
							<div class="panel-heading">
									View Lecture details
							</div>
							</summary>
							<div class="panel-body">
								<div class="table-responsive">
								<%
									try
									{
										System.out.println("admin lecture view ");
										Class.forName("com.mysql.jdbc.Driver");
										Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
										String sql="select *from courseatwheel.courselecview where user_id='"+user_id+"' and topic_id="+topic_id+" order by lecture_id";
										PreparedStatement pstmt=con.prepareStatement(sql);
										System.out.println(sql);
										ResultSet rs = pstmt.executeQuery();
								%>
										<table class="table table-striped table-bordered table-hover" id="dataTables-example">
											<thead>
												<tr>
													<th width="100px">Lecture id</th>
													<th> Name</th>
													<th> File </th>
													<th> Topic </th>
													<th> Course </th>
												</tr>
											</thead>
											<%
												while(rs.next())
												 {
													lecture_id=rs.getInt(5);
													lecture_name=rs.getString(6);
													lecture_file=rs.getString(7);
													topic_name=rs.getString(4);
													course_name=rs.getString(2);
											%>
													<tbody>
														<tr>
															<td> <%=lecture_id %> </td>
															<td> <%=lecture_name%> </td>
															<td> <video width="400" height="200" controls>
																	<source src='<%=lecture_file%>' type="video/mp4">
																 </video> 
															</td>
															<td> <%=topic_name%> </td>
															<td> <%=course_name%> </td>
															<td> <a href='AdminAddMoreDetails.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'> Add More Details</a> </td>
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
		</div>
	</body>
</html>
