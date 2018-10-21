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
		<title> Trainer Topic </title>
	</head>
	<body>
	<%
		String user_id=" ",course_name=" ",course_category_name=" ",topic_name=" ",topic_description=" ";
		int course_id=0,topic_id=0;
		user_id=(String) session.getAttribute("user_id");
		course_id=Integer.parseInt(request.getParameter("cid"));
		System.out.println(course_id);
		session.setAttribute("course_id",course_id);
		course_name=request.getParameter("cn");
		session.setAttribute("course_name",course_name);
		course_category_name=request.getParameter("ct");
		if(user_id==null)
		 {
			 response.sendRedirect("Error.jsp");  return;
		 }
	%>
		<!-- Right Panel -->
		<div id="right-panel" class="right-panel">
			<div class="breadcrumbs">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>Topic Details</h1>
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
									<strong class="card-title">Course Details</strong>
								</div>
								<div class="card-body">
									<table id="bootstrap-data-table" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>Course id</th>
												<th>Course name</th>
												<th>Course category</th>
											</tr>
										</thead>
										<tbody>
										  <tr>
											<td><%=course_id%></td>
											<td><%=course_name%></td>
											<td><%=course_category_name%></td>
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
							<strong>Topic Entry Form</strong>
						  </div>
						  <div class="card-body card-block">
							<form action="caw9" method="post" class="form-horizontal">
							  <div class="row form-group">
								<div class="col col-md-3"><label for="text-input" class=" form-control-label">Enter Topic name</label></div>
								<div class="col-12 col-md-9"><input type="text" id="topic_name" name="topic_name" placeholder="Text" class="form-control"></div>
							  </div>
							  <div class="row form-group">
								<div class="col col-md-3"><label for="textarea-input" class=" form-control-label">Enter Topic Description</label></div>
								<div class="col-12 col-md-9"><textarea name="description" id="description" rows="9" placeholder="Description..." class="form-control"></textarea></div>
							  </div>
							  <div>
								<td><input type="hidden" name="course_id" id="course_id" value=<%=course_id%>></td>
								<td><input type="hidden" name="course_name" id="course_name" value=<%=course_name%>></td>
								<td><input type="hidden" name="course_category_name" id="course_category_name" value=<%=course_category_name%>></td>
							  </div> 
							  <div>
								<td><input type="submit" name="submit" id="submit" value="Topic Add"/></td>
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
									<strong class="card-title">View topic Details</strong>
								</div>
								<div class="card-body">
								<form role="form">
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
									<table id="bootstrap-data-table" class="table table-striped table-bordered">
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
														<td> <a href='caw9?tid=<%=topic_id%>&cid=<%=course_id%>&uid=<%=user_id%>&cn=<%=course_name%>' /> delete </a> </td>
														<td> <a href='TrainerLec.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&tn=<%=topic_name%>&td=<%=topic_description%>&cn=<%=course_name%>'> <button type="button" name="addlec" id="addlec"> Add Lec </button> </a></td>
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
