<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="TrainerMenu2.jsp" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Trainer tutorial </title>
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
			 }
			catch(Exception exx)
			 {}
		%>
		<div id="right-panel" class="right-panel">
			<div class="breadcrumbs">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>Edit Details</h1>
						</div>
					</div>
				</div>
			</div>
			<div class="content mt-6">
				<div class="animated fadeIn">
					<div class="row">
						<div class="buttons">
                        <!-- Left Block -->
							<div class="col-md-12">
								<div class="card">
									<div class="card-body">
										<a class="active" href='TrainerTutorial.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><button type="button" class="btn btn-danger btn-lg">Tutorial</button> </a>
										<a href='TrainerQuiz.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><button type="button" class="btn btn-secondary btn-lg">Quiz</button></a>
										<a href='TrainerAssignment.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><button type="button" class="btn btn-success btn-lg">Assignment</button></a>
										<a href='TrainerExam.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><button type="button" class="btn btn-warning btn-lg">Exam</button></a>
									</div>
								</div><!-- /# card -->
							</div>
						</div> <!-- .buttons -->
					</div>
					<div class="row">
						<!-- page header -->
						<div class="col-md-6">
							<h4 class="page-header">Add tutorial</h4>
						</div>
						<div class="col-md-6">
							<h4 class="page-header">View tutorial</h4>
						</div>
					<!--end page header -->
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<div class="card-body card-block">
										<form role="form" action="caw12" method="post" enctype="multipart/form-data" class="form-horizontal">
											<div class="row form-group">
												<div class="col col-md-3"><label for="file-input" class=" form-control-label">Upload File</label></div>
												<div class="col-12 col-md-9">
													<input type="file" id="file" name="file" class="form-control-file" size="100"/>
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
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-body">
									<form role="form" method="post">
										<%
											int tuid=0;
											try
											 {
												Class.forName("com.mysql.jdbc.Driver");
												con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
												sql="SELECT * FROM courseatwheel.coursetutorialview where trainer_id='"+user_id+"' and topic_id="+topic_id+"";
												pstmt=con.prepareStatement(sql);
												System.out.println(sql);
												rs = pstmt.executeQuery();
										%>
												<table id="bootstrap-data-table" class="table table-striped table-bordered">
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
																	<td> <a href='TrainerTutorial.jsp?tuid=<%=tutorial_id%>&cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><%=tutorial_file %></a> </td>
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
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
							<div class="card">
								<div class="card-body">
									<div id="bootstrap-data-table" class="table table-striped table-bordered">
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
																		width="500px"
																		height="250px"
																		marginwidth="200px"
																		style="left: 3.25in; width: 500px; position: absolute; top: 17px" frameborder="1" />
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
			</div><!-- .animated -->
		</div><!-- .content -->
	</body>
</html>