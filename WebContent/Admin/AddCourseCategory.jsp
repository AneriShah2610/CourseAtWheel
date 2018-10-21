<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />  
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Add Course Category  </title>
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
                    <h1 class="page-header">Add Course Category</h1>
                </div>
                <!--end page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-heading"> 
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" action="caw2" method="post">
                                        <div class="form-group">
                                            <label>Choose category</label>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="Technical" checked> Technical
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="Non-Technical">Non-Technical
                                                </label>
                                            </div>
											<div class="form-group">
												<label> Enter category</label>
												<input type="text" name="category_name" id="category_name" class="form-control" placeholder="Enter text">
											</div>
                                        </div>
                                        <input type="submit" class="btn btn-primary" name="submit" id="submit" value="submit"/>
                                        <button type="reset" class="btn btn-success">Reset Button</button>
                                    </form>
                                </div>    
                            </div>
                        </div>
                    </div>
                     <!-- End Form Elements -->
                </div>
            </div>
        </div>
        <!-- end page-wrapper -->
	</body>
</html>
