<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />  
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Course Category  </title>
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
                 <!-- Page header-->
                <div class="col-lg-12">
                    <h1 class="page-header">Course Category</h1>
                </div>
                 <!--End Page header-->
            </div>
            <div class="row">
                <div class="col-lg-6">
                     <!-- Default Buttons-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        </div>
                        <div class="panel-body">
							<form action="AddCourseCategory.jsp">
                                <input type="submit" name="submit" id="submit" value="Add" class="btn btn-default"></p>
							</form>
							<form action="ViewCourseCategory.jsp">
                                <input type="submit" name="submit" id="submit" value="View" class="btn btn-default">
							</form>
                        </div>
                    </div>
                     <!-- End Default Buttons-->
                </div>
            </div>
        </div>
        <!-- end page-wrapper -->
	</body>
</html>
