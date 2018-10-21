<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>  Add and View State page  </title>
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
                    <h1 class="page-header">State detail page</h1> 
					&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
					<a href="Country.jsp"> Go to Country Edition </a>
					&nbsp; &nbsp; &nbsp; &nbsp;
					<a href="City.jsp"> Go to City Edition </a>
                </div>
				
                <!--end page header -->
            </div>
			<%
				String cname=" ";
				try
				 {
					 cname=request.getParameter("country_name");
				 }
				catch(Exception e)
				 {}
				Connection con;
				String sql=" ";
				PreparedStatement pstmt;
				ResultSet rs;
				int country_id=0;
				String country_name=" ";
				String state_name=" ";
				int state_id=0;
			%>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
					<%
						try 
				         {
							 Class.forName("com.mysql.jdbc.Driver");
							 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
					%>
							<div class="panel-heading">
								Add state
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6">
										<form role="form" action="caw3" method="post">
											<div class="form-group">
												<label>Select Country</label>
												<select name="country" id="country" class="form-control">
												<%
													sql="select *from courseatwheel.country order by country_name";
													pstmt=con.prepareStatement(sql);
													System.out.println(sql);
													rs=pstmt.executeQuery(sql);
													while(rs.next())
													 {
														country_id=rs.getInt(1);
														country_name=rs.getString(2);
												%>
														<option value='<%= country_id%>'> <%= country_name%> </option>
												<%					
													 }
												%>
												</select>
											</div>
											<div class="form-group has-success">Enter state name</label>
												<input type="text" name="state_name" id="state_name" class="form-control" id="inputSuccess">
											</div>
											<input name="submit" type="submit" class="btn btn-primary" value="Submit">
											<input name="reset" type="reset" class="btn btn-success" value="Reset">
										</form>
									</div>
								</div>
							</div>
					<%
						 }
						catch(Exception e)
						 {
							 e.printStackTrace();
							 System.out.println(e);
						 }
					%>	
						<details>
							<summary>
								<div class="panel-heading">
									State details
								</div>
							</summary>
						<%
							int sid=-1;
							try 
							 {
								 
							 }
							catch(Exception e)
							 {}
						%>
						<div class="panel-body">
                            <div class="table-responsive">
						<%
							try 
							 {
								Class.forName("com.mysql.jdbc.Driver");
								con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
								sql="select *from courseatwheel.state";
								pstmt=con.prepareStatement(sql);
								System.out.println(sql);
		                   		rs = pstmt.executeQuery();
						%>
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Country</th>
                                        </tr>
                                    </thead>
									<%
	                                    while(rs.next())
	                                     {
	                                    	state_id=rs.getInt(1);
	                                    	state_name=rs.getString(3);
											country_id=rs.getInt(2);
	                                    	
	                                 %>
	                                    	<tbody>
												<tr>
	    											<td> <%=state_id %> </td>
													<td> <%=state_name %> </td>
	    											<td> <%=country_id %> </td>
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
        <!-- end page-wrapper -->
    </body>
</html>
