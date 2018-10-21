<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="AdminMenu.jsp" />
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> Course Sub Category  </title>
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
                    <h1 class="page-header">Course sub Category</h1>
                </div>
                <!--end page header -->
            </div>
			<div class="row">
				<%
                        	int csid = -1;
                            try
                             {
                            	
                             }
                            catch(Exception e)
                             { }
                            int course_sub_category_id;
                            String course_sub_category_name;
                 %>
						
						<div class="panel-body">
                            <div class="table-responsive">
                            <%
	                            try
	                            {
		                           	Class.forName("com.mysql.jdbc.Driver");
		                   			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
		                   			String sql="select *from courseatwheel.course_sub_category;";
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
	                                    		course_sub_category_id=rs.getInt(1);
	                                    		course_sub_category_name=rs.getString(2);
	                                    	
	                                    %>
	                                    		<tbody>
	    										<tr>
	    											<td> <%=course_sub_category_id %> </td>
	    											<td> <%=course_sub_category_name %> </td>
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
		  </div>
        <!-- end page-wrapper -->
	</body>
</html>
