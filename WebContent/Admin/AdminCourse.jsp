<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Admin side Course </title>
    </head>
	<body> 
	<%
		String user_id=" ";
		user_id=(String)session.getAttribute("user_id");
		if(user_id==null)
		 {
			 response.sendRedirect("Error.jsp");
		 }
	%>
		<!--  page-wrapper -->
		<div id="page-wrapper">
            <div class="row">
                 <!-- Page header-->
                <div class="col-lg-12">
                    <h1 class="page-header">Courses</h1>
                </div>
                 <!--End Page header-->
            </div>
            <div class="row">
                <div class="col-lg-6">
                     <!-- Outline Buttons-->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <p>
                                <a href="AdminCourseAdd.jsp"> <button type="button" class="btn btn-outline btn-primary"> Add Course</button> </a>
                                <a href="AdminCourseView.jsp"><button type="button" class="btn btn-outline btn-success">View Courses</button> </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end page-wrapper -->
	</body>
</html>
