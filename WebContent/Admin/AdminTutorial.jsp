<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Add tutorial </title>
    </head>
    <body>
	<script type="text/javascript">
      function showPDF(pdf) {
        document.getElementById('iFrame1').src = pdf;
      }
    </script>
	<%
		String user_id=" ",tutorial_file=" ",course_name=" ",topic_name=" ",lecture_name=" ";
		int course_id=0,topic_id=0,lecture_id=0,tutorial_id=0;
		course_id=Integer.parseInt(request.getParameter("cid"));
		topic_id=Integer.parseInt(request.getParameter("tid"));
		lecture_id=Integer.parseInt(request.getParameter("lid"));
		user_id=(String)session.getAttribute("user_id");
		Connection con;
		String sql=" ",sql1=" ";
		PreparedStatement pstmt,pstmt1;
		ResultSet rs,rs1;
		if(user_id==null)
		 {
			 response.sendRedirect("Error.jsp");
		 }
		 int t_id=-1;
									try 
									 {
										t_id=Integer.parseInt(request.getParameter("tuid"));
										System.out.println(t_id);
										out.println(t_id);
									 }
									catch(Exception exx)
									 {}
	%>
    	<!--  page-wrapper -->
		<div id="wrapper">
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Edit details</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<!--Basic Tabs   -->
						<div class="panel panel-default">
							<div class="panel-body">
								<ul class="nav nav-tabs">
									<li class="active"><a href='AdminTutorial.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'>Tutorial</a>
									</li>
									<li><a href='AdminQuiz.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'>Quiz</a>
									</li>
									<li><a href='AdminAssignment.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'>Assignment</a>
									</li>
									<li><a href='AdminExam.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'>Exam</a>
									</li>
								</ul>
							</div>
						</div>
						<!--End Basic Tabs   -->
					</div>
				</div>
				<div class="row">
                 <!-- page header -->
					<div class="col-lg-6">
						<h1 class="page-header">Add tutorial</h1>
					</div>
					<div class="col-lg-6">
						<h1 class="page-header">View tutorial</h1>
					</div>
                <!--end page header -->
				</div>
				<div class="row">
					<div class="col-lg-6">
						<!-- Form Elements -->
						<div class="panel panel-default">
						<!-- Entry form Elements -->
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<form role="form" action="caw12" method="post" enctype="multipart/form-data"> 
											<div class="form-group">
												<label> File </label>
												<input type="file" name="file" id="file" size="100" />
												<input type="hidden" name="course_id" id="course_id" value=<%=course_id%> />
												<input type="hidden" name="topic_id" id="topic_id" value=<%=topic_id%> />
												<input type="hidden" name="lecture_id" id="lecture_id" value=<%=lecture_id%> />
												<input type="hidden" name="trainer_id" id="trainer_id" value=<%=user_id%> />
											</div>
											<div class="panel-body">
												<p>
													<input type="submit" name="submit" id="submit" value="Add" class="btn btn-default">
													<input type="reset" class="btn btn-primary">
												</p>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="panel panel-default">
							<div class="panel-body">
								<form role="form" method="post">
									<div class="table-responsive">
										<%
											int tuid=0;
											try
											 {
												Class.forName("com.mysql.jdbc.Driver");
												con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
												sql="SELECT * FROM courseatwheel.coursetutorialview where trainer_id='"+user_id+"' and topic_id="+topic_id+" and lecture_id="+lecture_id+"";
												pstmt=con.prepareStatement(sql);
												System.out.println(sql);
												rs = pstmt.executeQuery();
										%>
												<table class="table table-striped table-bordered table-hover" id="dataTables-example">
													<thead>
														<tr>
															<th>Tutorial</th>
															<th>Course</th>
															<th>Topic</th>
															<th>Lecture</th>
														</tr>
													</thead>
													<%
														while(rs.next())
														 {
															tutorial_id=rs.getInt(1);
															tutorial_file=rs.getString(2);
															course_name=rs.getString(4);
															topic_name=rs.getString(6);
															lecture_name=rs.getString(8);
													%>
															<tbody>
																<tr>
																	<td> <a href='AdminTutorial.jsp?tuid=<%=tutorial_id%>&cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><%=tutorial_file %></a> </td>
																	<td> <%=course_name %> </td>
																	<td> <%=topic_name %> </td>
																	<td> <%=lecture_name %> </td>
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
					<div class="row">
						<div class="col-lg-12">
							<div class="panel-body">
								<div class="table-responsive">
									<%
										
										try 
										 {
											 Class.forName("com.mysql.jdbc.Driver");
											 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
											 sql1="SELECT * FROM courseatwheel.tutorial where trainer_id='"+user_id+"' and tutorial_id="+t_id+" and lecture_id="+lecture_id+"";
											 pstmt1=con.prepareStatement(sql1);
											 System.out.println(sql1);
											 rs1 = pstmt1.executeQuery();
											 while(rs1.next())
											  {
												  tutorial_file=rs1.getString(2);
									%>
												  <form id="form1" runat="server">
													<div>
														<asp:Literal ID="Links" runat="server" />
															<iframe id="iFrame1" 
																	type="application/pdf"
																	scrolling="yes"
																	src=<%=tutorial_file%>
																	width="700px"
																	height="300px"
																	marginwidth="500px"
																	style="left: 3.25in; width: 700px; position: absolute; top: 17px" frameborder="1" />
													</div>
												  </form>
									<%
											  }
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
						<!-- End entry form Elements -->	
		</div>
					
        <!-- end page-wrapper -->
	</body>
</html>
