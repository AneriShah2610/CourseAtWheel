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
		<title> Trainer Lecture </title>
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
		<!-- Right Panel -->
		<div id="right-panel" class="right-panel">
			<div class="breadcrumbs">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>Lecture </h1>
						</div>
					</div>
				</div>
			</div>
			<div class="content mt-3">
				<div class="animated fadeIn">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<strong class="card-title">Topic Details</strong>
								</div>
								<div class="card-body">
									<table id="bootstrap-data-table" class="table table-striped table-bordered">
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
						</div>
					</div>
				</div><!-- .animated -->
			</div><!-- .content -->
			<div class="content mt-3">
				<div class="animated fadeIn">
					<div class="row">
					  <div class="col-lg-6">
						  <div class="card-header">
							<strong>Lecture Entry Form</strong>
						  </div>
						  <div class="card-body card-block">
							<form action="caw10" method="post" class="form-horizontal" enctype="multipart/form-data">
							  <div class="row form-group">
								<div class="col col-md-3"><label for="text-input" class=" form-control-label">Lecture Name</label></div>
								<div class="col-12 col-md-9"><input type="text" id="lecture_name" name="lecture_name" placeholder="Text" class="form-control"></div>
							  </div>
							  <div class="row form-group">
								<div class="col col-md-3"><label for="file-input" class=" form-control-label">Upload File</label></div>
								<div class="col-12 col-md-9"><input type="file" id="file" name="file" class="form-control-file" size="100"/></div>
							  </div>
							  <div>
								<td><input type="hidden" name="course_id" id="course_id" value=<%=course_id%>></td>
								<td><input type="hidden" name="topic_id" id="topic_id" value=<%=topic_id%>></td>
							  </div>  
							  <div>
								<td><input type="submit" name="submit" id="submit" value="Lecture Add"/></td>
								<td><input type="reset" name="reset" value="Cancle"></td>
							  </div>
							</form>
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
									<strong class="card-title">View Lecture Details</strong>
								</div>
								<div class="card-body">
								<form role="form" method="post">
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
									<table id="bootstrap-data-table" class="table table-striped table-bordered">
										<thead>
	                                        <tr>
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
														<td> <%=lecture_name%> </td>
														<td> <video width="400" height="200" controls>
																<source src='<%=lecture_file%>' type="video/mp4">
															 </video> 
														</td>
														<td> <%=topic_name%> </td>
														<td> <%=course_name%> </td>
														<td> <a href='TrainerAddMoreDetails.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'> Add More Details </a> </td>
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
