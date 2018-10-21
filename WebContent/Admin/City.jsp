<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Add and View City page </title>
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
                 <!-- page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">City detail page</h1> 
					&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
					<a href="Country.jsp"> Go to Country Edition </a>
					&nbsp; &nbsp; &nbsp; &nbsp;
					<a href="State.jsp"> Go to State Edition </a>
                </div>
				
                <!--end page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Add city
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form">
                                        <div class="form-group">
                                            <label>Select Country</label>
                                            <select class="form-control">
                                                <option>india</option>
                                                <option>afghanistan</option>
                                            </select>
                                        </div>
										<div class="form-group">
                                            <label>Select State</label>
                                            <select class="form-control">
                                                <option>Gujarat</option>
                                                <option>Bengluru</option>
                                            </select>
                                        </div>
										<div class="form-group has-success">Enter city id</label>
                                            <input type="number" class="form-control" id="inputSuccess">
                                        </div>
										<div class="form-group has-success">Enter city name</label>
                                            <input type="text" class="form-control" id="inputSuccess">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit Button</button>
                                        <button type="reset" class="btn btn-success">Reset Button</button>
                                    </form>
                                </div>
                            </div>
                        </div>
						<div class="panel-heading">
                            City details
                        </div>
						<div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>State</th>
											<th>Country</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                     <!-- End Form Elements -->
                </div>
            </div>
        <!-- end page-wrapper -->
	</body>
</html>
