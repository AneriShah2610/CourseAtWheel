<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Trainer Details </title>
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
                 <!--  page header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Trainer Details</h1>
                </div>
                 <!-- end  page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-body">
							<div class="col-sm-6">
								<div class="dataTables_length" id="dataTables-example_length">
									<label> 
										serach Trainer
										<select name="trainer" id="trainer" aria-controls="dataTables-example" class="form-control input-sm">
											<option value="10">All</option>
											<option value="10">By Name</option>
											<option value="25">By Join_date</option>
										</select> 
									</label>
								</div>
							</div>
						<%
							String tid=" ";
							try 
							 {
								 
							 }
							catch(Exception e)
							 {}
							String trainer_id=" ",fname=" ",lname=" ",fullname=" ",email=" ",contact=" ",join_date=" ",city_name=" ",status=" ",user_type=" ";
							int country_id=0;
							int state_id=0;
							Connection con;
							String sql;
							PreparedStatement pstmt;
							ResultSet rs;
						%>
                            <div class="table-responsive">
						<%	
							try 
							 {
								Class.forName("com.mysql.jdbc.Driver");
								con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
								sql="select *from courseatwheel.user where user_type='trainer'";
								pstmt=con.prepareStatement(sql);
								System.out.println(sql);
		                   		rs = pstmt.executeQuery();
						%>
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Trainer_id</th>
                                            <th>Name</th>
                                            <th>Email_id</th>
                                            <th>Contact no</th>
                                            <th>Join_date</th>
											<th>country</th>
											<th>State</th>
											<th>City</th>
											<th>Status</th>
                                        </tr>
                                    </thead>
									<%
	                                    while(rs.next())
	                                     {
	                                    	trainer_id=rs.getString(1);
											fname=rs.getString(2);
											lname=rs.getString(3);
											email=rs.getString(4);
											contact=rs.getString(5);
											join_date=rs.getString(8);
											country_id=rs.getInt(9);
											state_id=rs.getInt(10);
											city_name=rs.getString(11);
											status=rs.getString(12);
											fullname=fname+lname;
	                                 %>
	                                    	<tbody>
												<tr>
	    											<td> <%=trainer_id %> </td>
													<td> <%=fullname %> </td>
	    											<td> <%=email %> </td>
													<td> <%=contact %> </td>
													<td> <%=join_date %> </td>
													<td> <a href="#"> <%=country_id %> </a> </td> 
													<td> <a href="#"> <%=state_id %> </a> </td>
													<td> <%=city_name %> </td>
													<td> <%=status %> </td>
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
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
        </div>
        <!-- end page-wrapper -->
	</body>
</html>
