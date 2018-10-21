<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="AdminMenu.jsp" />
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Admin Home </title>
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
		<div id="page-wrapper">
            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Admin Home</h1>
                </div>
                <!--End Page Header -->
            </div>
			<div class="row">
                <!-- Welcome -->
                <div class="col-lg-12">
                    <div class="alert alert-info">
                        <i class="fa fa-folder-open"></i><b>&nbsp;Hello ! </b>Welcome Back <b>Aneri Shah </b>
                    </div>
                </div>
                <!--end  Welcome -->
            </div>
			<div class="row">
                <!--quick info section -->
                <div class="col-lg-3">
                    <div class="alert alert-danger text-center">
                        <i class="fa fa-calendar fa-3x"></i>&nbsp;<b>0</b>Meetings Sheduled This Month
                    </div>
                </div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="col-lg-3">
                    <div class="alert alert-info text-center">
                        <i class="fa fa-rss fa-3x"></i>&nbsp;<b>5</b> New Subscribers This Month
                    </div>
                </div>
            </div>
			<div class="row">
				<div class="col-lg-3">
					<div class="panel-body yellow">
							<i class="fa fa-bar-chart-o fa-3x"></i>
                            <h3> 5 </h3>
                    </div>
					<div class="panel-footer">
                            <span class="panel-eyecandy-title">Daily User Visits
                            </span>
                    </div>
                </div>
				<div class="col-lg-3">
					<div class="panel-body blue">
							<i class="fa fa-pencil-square-o fa-3x"></i>
                            <h3> 4 </h3>
                    </div>
					<div class="panel-footer">
                            <span class="panel-eyecandy-title">Current courses
                            </span>
                    </div>
                </div>
			</div>
		</div>
	</body>
</html>