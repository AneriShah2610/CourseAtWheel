<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:include page="AdminMenu.jsp" />
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Admin Home menu page </title>
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
                    <h1 class="page-header">Trainer Request</h1>
                </div>
                <!--end page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-body">
						<%
							String t_id=" ";
							try
							 {
								 
							 }
							catch(Exception e)
							 {}
							String trainer_id=" ",fname=" ",lname=" ",fullname=" ",email=" ",country_name=" ",state_name=" ",city_name=" ",join_date=" ";
							int country_id=0,state_id=0;
							Connection connection;
							PreparedStatement pstmt;
							ResultSet rs;
							String sql=" ";
						%>
                            <div class="row">
							<form action="caw6" method="post">
								<div class="table-responsive">
								<%	
									try 
									 {
										Class.forName("com.mysql.jdbc.Driver");
										connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
										sql="select *from courseatwheel.user where user_type='trainer' and status='Not Accepted'";
										pstmt=connection.prepareStatement(sql);
										System.out.println(sql);
										rs = pstmt.executeQuery();
								%>
										<table class="table table-striped table-bordered table-hover" id="dataTables-example">
											<thead>
												<tr> 
													<th>Trainer_id </th>
													<th>Trainer_name</th>
													<th>Email</th>
													<th>Country</th>
													<th>State/Provience</th>
													<th>Register Date</th>
												</tr>
											</thead>
											<%
												while(rs.next())
												 {
													trainer_id=rs.getString(1);
													fname=rs.getString(2);
													lname=rs.getString(3);
													email=rs.getString(4);
													join_date=rs.getString(8);
													country_id=rs.getInt(9);
													state_id=rs.getInt(10);
													city_name=rs.getString(11);
													fullname=fname+lname;
													session.setAttribute("trainer_id",trainer_id);
											 %>
											<tbody>
												<tr>
													<td> <%= trainer_id%> </td> 
													<td> <%= fullname%> </td>
													<td> <a> <%= email%> </a> </td>
													<td> <a> <%= country_id%> </a> </td>
													<td> <a> <%= state_id%> </a> </td>
													<td> <%= join_date%> </td>
													<td> <input type="submit" name="submit" id="submit" value="Accept" /> </td> 
													<td> <input type="submit" name="submit" id="submit" value="Deny" /> </td>
												</tr>
											</tbody>
										<%
	                                    	  }
	    							 %>
								</table>
						<%
								connection.close();
	                        }
						   catch(Exception ex)
                            {
								ex.printStackTrace();
								System.out.println(ex);
                            }
	                     %>   
								  </div>
                               </form>
                              </div>
                            </div>
                        </div>
                    </div>
                     <!-- End Form Elements -->
                </div>
            </div>
        <!-- end page-wrapper -->
	</body>
</html>
