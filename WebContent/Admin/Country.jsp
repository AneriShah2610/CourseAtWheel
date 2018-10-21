<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="AdminMenu.jsp" />
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Add and View Country page </title>
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
		<!--  wrapper -->
    	<div id="wrapper">
		 <!--  page-wrapper -->
          <div id="page-wrapper">
            <div class="row">
                 <!-- page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Country detail page</h1> 
					&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
					<a href="City.jsp"> Go to City Edition </a>
					&nbsp; &nbsp; &nbsp; &nbsp;
					<a href="State.jsp"> Go to State Edition </a>
                </div>
				
                <!--end page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                    
                    <!-- Entry from -->
						<div class="panel-heading">
                            Add country
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" action="caw1" method="post">
                                        <div class="form-group has-success">
                                            <label class="control-label" for="inputSuccess">Enter Country id </label>
                                            <input type="number" class="form-control" id="country_id" name="country_id" required />
                                        </div>
                                        <div class="form-group has-success">
                                            <label class="control-label" for="inputSuccess">Enter Country name </label>
                                            <input type="text" class="form-control" id="country_name" name="country_name" required />
                                        </div>
										<input type="submit" class="btn btn-primary" name="submit" id="submit" value="Add country">
                                        <input type="reset" class="btn btn-success" name="reset" value="Reset">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- End Entry From -->
                        
                        <!--Display from  -->
                        <%
                        	int cid = -1;
                            try
                             {
                            	
                             }
                            catch(Exception e)
                             { }
                            int country_id;
                            String country_name;
                        %>
						<details>
							<summary>
								<div class="panel-heading">
									View country details
								</div>
							</summary>
							<div class="panel-body">
								<div class="table-responsive">
								<%
									try
									{
										Class.forName("com.mysql.jdbc.Driver");
										Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
										String sql="select *from courseatwheel.country order by country_name";
										PreparedStatement pstmt=con.prepareStatement(sql);
										System.out.println(sql);
										ResultSet rs = pstmt.executeQuery();
								%>
										<table class="table table-striped table-bordered table-hover" id="dataTables-example">
											<thead>
												<tr>
													<th width="100px">Id</th>
													<th>Name</th>
												</tr>
											</thead>
											<%
												while(rs.next())
												 {
													country_id=rs.getInt(1);
													country_name=rs.getString(2);
												
											%>
													<tbody>
													<tr>
														<td> <%=country_id %> </td>
														<td> <%=country_name %> </td>
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
							</div>
						</details>
                    </div>
                     <!-- End Form Elements -->
                </div>
            </div>
        </div>
	</body>
</html>
