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
			int course_id=0,topic_id=0,lecture_id=0,quiz_id=0,question_id=0;
			course_id=Integer.parseInt(request.getParameter("cid"));
			topic_id=Integer.parseInt(request.getParameter("tid"));
			lecture_id=Integer.parseInt(request.getParameter("lid"));
			String user_id=" ",question=" ",course_name=" ",option1=" ",option2=" ",option3=" ",option4=" ",answer=" ",quiz_name=" ";
			user_id=(String)session.getAttribute("user_id");
			quiz_id=Integer.parseInt(request.getParameter("qid"));
			quiz_name=request.getParameter("qn");
			if(user_id==null)
			 {
				response.sendRedirect("Error.jsp");
			 }
			Connection con;
			PreparedStatement pstmt;
			ResultSet rs;
			String sql=" ";
		%>
		<div id="wrapper">
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Edit details</h1>
						<a href='AdminQuiz.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'>Back to quiz </a>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<!-- Form Elements -->
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-11">
										<form role="form" method="post" action="caw16">
											<div class="form-group">
												<input type="hidden" name="quiz_id" id="quiz_id" value=<%=quiz_id%>>
												<input type="hidden" name="course_id" id="course_id" value=<%=course_id%>>
												<input type="hidden" name="topic_id" id="topic_id" value=<%=topic_id%>>
												<input type="hidden" name="user_id" id="user_id" value=<%=user_id%>>
												<input type="hidden" name="lecture_id" id="lecture_id" value=<%=lecture_id%>>
												<label>Question:</label>
												<textarea class="form-control" rows="3" col="40" placeholder="eg. what is java?" name="question" id="question" required></textarea>
												<label>Option1:</label>
												<input class="form-control" type="text" name="option1" id="option1" placeholder="option1" required/>
												<label>Option2:</label>
												<input class="form-control" type="text" name="option2" id="option2" placeholder="option2" required/>
												<label>Option3:</label>
												<input class="form-control" type="text" name="option3" id="option3" placeholder="option3" required/>
												<label>Option4:</label>
												<input class="form-control" type="text" name="option4" id="option4" placeholder="option4" required/>
												<label>Answer:</label>
												<input class="form-control" type="text" name="answer" id="answer" placeholder="Write correct option" required/>
											</div>
											<button type="submit" name="submit" id="submit" class="btn btn-primary" value="submit">Submit</button>
											<button type="reset" class="btn btn-success">Reset Button</button>
										</form>
									</div>
								</div>
							</div>
						</div>
							 <!-- End Form Elements -->
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<div class="panel panel-default">
							<details>
								<summary>
									<div class="panel-heading">
										<strong> <a> View quiz details </a> </strong>
									</div>
								</summary>
								<div class="panel-body">
									<div class="table-responsive">
										<form role="form" method="post">
											<table>
												<%
												try
												 {
													Class.forName("com.mysql.jdbc.Driver");
													con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
													sql="SELECT * FROM courseatwheel.quiz_details where quiz_id="+quiz_id+" order by question_id";
													pstmt=con.prepareStatement(sql);
													System.out.println(sql);
													rs = pstmt.executeQuery();
											%>
											<%
													while(rs.next())
													 {
														question_id=rs.getInt(1);
														question=rs.getString(2);
														option1=rs.getString(3);
														option2=rs.getString(4);
														option3=rs.getString(5);
														option4=rs.getString(6);
														answer=rs.getString(7);
														quiz_id=rs.getInt(8);
											%>
														<tbody>
															<tr>
																<td> <strong> Q. <%=question%> </strong> </td>
																	<tr>
																		<td> A. <%=answer%> </td>
																	</tr>
																</td>
																<p/>
															</tr>
														</tbody>
											<%
													 }
											%>
											<%
													con.close();
												 }
												catch(Exception ex)
												 {
													ex.printStackTrace();
													System.out.println(ex);
												 }	
											%> 
											</table>
										</form>
									</div>
								</div>
						</details>
                    </div>
                    <!--  End  Striped Rows Table  -->
                </div>
				</div>
			</div>
		</div>
	</body>
</html>