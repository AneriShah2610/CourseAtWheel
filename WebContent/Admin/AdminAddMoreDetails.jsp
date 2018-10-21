<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="AdminMenu.jsp" />
<!DOCTYPE html>
<html>
	<head>
		<title> Add More Details</title>
	</head>
	<body>
	<%
		String user_id=" ";
		int course_id=0,topic_id=0,lecture_id=0;
		user_id=(String) session.getAttribute("user_id");
		course_id=Integer.parseInt(request.getParameter("cid"));
		topic_id=Integer.parseInt(request.getParameter("tid"));
		lecture_id=Integer.parseInt(request.getParameter("lid"));
		if(user_id==null)
		 {
			 response.sendRedirect("Error.jsp");
		 }
	 %>
		<div id="wrapper">
		 <!--  page-wrapper -->
			<div id="page-wrapper">
				<div class="row">
					<form>
						<td><a href='AdminTutorial.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><h4 class="page-header">Edit Tutorial </h4> </a></td>
						<td><a href='AdminQuiz.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><h4 class="page-header">Edit Quiz </h4> </a></td>
						<td><a href='AdminAssignment.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><h4 class="page-header">Edit Assignment </h4> </a></td>
						<td><a href='AdminExam.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><h4 class="page-header">Edit Exam </h4> </a> </td>
					</form>
					<div class="clr"></div>
                <!--end page header -->
				</div>
			</div>
		</div>
	</body>
</html>