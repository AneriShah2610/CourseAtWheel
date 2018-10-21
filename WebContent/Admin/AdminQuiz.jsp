<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Add quiz </title>
    </head>
    <body>
	<%
		String user_id=" ",question=" ",course_name=" ",option1=" ",option2=" ",option3=" ",option4=" ",answer=" ",quiz_name=" ";
		int course_id=0,topic_id=0,lecture_id=0,quiz_id=0;
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
									<li><a href='AdminTutorial.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'>Tutorial</a>
									</li>
									<li class="active"><a href='AdminQuiz.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'>Quiz</a>
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
						<h1 class="page-header">Add Quiz</h1>
					</div>
					<div class="col-lg-6">
						<h1 class="page-header">View Quiz</h1>
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
									<div class="col-lg-12">
										<form role="form" action="caw13" method="post"> 
											<div class="form-group">
												<label> Name </label>
												<input type="text" name="quiz_name" id="quiz_name" placeholder="Enter quiz name"/>
												<input type="hidden" name="course_id" id="course_id" value=<%=course_id%> />
												<input type="hidden" name="topic_id" id="topic_id" value=<%=topic_id%> />
												<input type="hidden" name="lecture_id" id="lecture_id" value=<%=lecture_id%> />
												<input type="hidden" name="trainer_id" id="trainer_id" value=<%=user_id%> />
												</p>
												<input type="submit" name="submit" id="submit" value="Add" class="btn btn-default">
												<input type="reset" class="btn btn-primary">
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
											
											try
											 {
												Class.forName("com.mysql.jdbc.Driver");
												con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
												sql="SELECT * FROM courseatwheel.quiz where user_id='"+user_id+"' and topic_id="+topic_id+" and lecture_id="+lecture_id+"";
												pstmt=con.prepareStatement(sql);
												System.out.println(sql);
												rs = pstmt.executeQuery();
										%>
												<table class="table table-striped table-bordered table-hover" id="dataTables-example">
													<thead>
														<tr>
															<th> Quiz name </th>
														</tr>
													</thead>
													<%
														while(rs.next())
														 {
															quiz_id=rs.getInt(1);
															quiz_name=rs.getString(2);
													%>
															<tbody>
																<tr>
																	<td> <a href='AdminEditQuiz.jsp?qid=<%=quiz_id%>&cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><%=quiz_name %></a> </td>
																	<td> <a href='AdminQuiz_details.jsp?qid=<%=quiz_id%>&cid=<%=course_id%>'> Quiz details </a> </td>
																	<td> <a href='caw13?qid=<%=quiz_id%>&cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>&uid=<%=user_id%>'> delete </a> </td>
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
				</div>
			</div>
						<!-- End entry form Elements -->	
        <!-- end page-wrapper -->
	</body>
</html>
