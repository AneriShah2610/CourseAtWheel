<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="TrainerMenu2.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title> Trainer Quiz </title>
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
                                    <a href='TrainerTutorial.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><button type="button" class="btn btn-primary btn-lg">Tutorial</button> </a>
                                    <a class="active" href='TrainerQuiz.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><button type="button" class="btn btn-danger btn-lg">Quiz</button></a>
                                    <a href='TrainerAssignment.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><button type="button" class="btn btn-success btn-lg">Assignment</button></a>
                                    <a href='TrainerExam.jsp?cid=<%=course_id%>&tid=<%=topic_id%>&lid=<%=lecture_id%>'><button type="button" class="btn btn-warning btn-lg">Exam</button></a>
                                </div>
                            </div><!-- /# card -->
                        </div>
                    </div> <!-- .buttons -->

                </div><!-- .row -->
            </div><!-- .animated -->
        </div><!-- .content -->
		</div>
	</body>
</html>