<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Add assignment </title>
    </head>
    <body>
	<%
		String user_id=" ",tutorial_file=" ";
		int course_id=0,topic_id=0,lecture_id=0,tutorial_id=0;
		course_id=Integer.parseInt(request.getParameter("cid"));
		topic_id=Integer.parseInt(request.getParameter("tid"));
		lecture_id=Integer.parseInt(request.getParameter("lid"));
		user_id=(String)session.getAttribute("user_id");
		if(user_id==null)
		 {
			 response.sendRedirect("Error.jsp");
		 }
	%>
    	<!--  page-wrapper -->
          <div id="page-wrapper">
			<div class="row">
				<form>
					<div class="row">
						<div class="col-lg-6">
								 <!--Basic Tabs   -->
							<div class="panel panel-default">
								<div class="panel-heading">
										Edit details
								</div>
								<div class="panel-body">
									<ul class="nav nav-tabs">
										<li><a href='AdminTutorial.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'>Tutorial</a>
										</li>
										<li><a href='AdminQuiz.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'>Quiz</a>
										</li>
										<li class="active"><a href='AdminAssignment.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'>Assignment</a>
										</li>
										<li><a href='AdminExam.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'>Exam</a>
										</li>
									</ul>
								</div>
							</div>
								<!--End Basic Tabs   -->
						</div>
					</div>
				</form>
				<div class="clr"></div>
                <!--end page header -->
			</div>
            <div class="row">
                 <!-- page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Add Courses</h1>
                </div>
                <!--end page header -->
            </div>
        </div>
        <!-- end page-wrapper -->
	</body>
</html>
