<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.sql.*,java.util.*" %>
<jsp:include page="AdminMenu.jsp" />
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> View Course Category </title>
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
                    <h1 class="page-header">Category</h1>
                </div>
                <!--end page header -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- Form Elements -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form">
										<!-- Category Selection -->
										<div class="form-group">
                                            <label>Select one </label>
											<br/>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="All" checked>All
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="Technical">Technical
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="Non-Technical">Non-Technical
                                            </label>
                                        </div>
										<!-- End Category Selection-->
										<!-- View Category Details-->
										<!--Display from  -->
										<%
											int cid = -1;
											try
											 {
												
											 }
											catch(Exception e)
											 { }
											int course_category_id;
											String course_category_name=" ",course_sub_category_name=" ",sql=" ";
											course_sub_category_name=request.getParameter("optionsRadiosInline");
											System.out.println(course_sub_category_name);
											try
											 {
												Class.forName("com.mysql.jdbc.Driver");
												Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
												if ( course_sub_category_name == null)
													sql="select *from courseatwheel.course_category";
												else if ( course_sub_category_name != null)
												 { 
													if(course_sub_category_name.equals("All"))
													 {
														sql="select *from courseatwheel.course_category order by course_category_id";
														System.out.println(sql);
													 }
													else if(course_sub_category_name.equals("Technical"))
													 {
														 sql="select *from courseatwheel.course_category where course_sub_category_name='Technical'";
														 System.out.println(sql);
													 }
													else if(course_sub_category_name.equals("Non-Technical"))
													 {
														 sql="select *from courseatwheel.course_category where course_sub_category_name='Non-Technical'";
														 System.out.println(sql);
													 }
												   }
												PreparedStatement pstmt=con.prepareStatement(sql);
												ResultSet rs = pstmt.executeQuery();
										%>
										<div class="panel-heading">
											View Category details
										</div>
										<div class="panel-body">
											<div class="table-responsive">
												<table class="table table-striped table-bordered table-hover" id="dataTables-example">
													<thead>
														<tr>
															<th width="100px">Id</th>
															<th>Category</th>
															<th>Type</th>
														</tr>
													</thead>
													<%
														
															while(rs.next())
															 {
																course_category_id=rs.getInt(1);
																course_category_name=rs.getString(2);
																course_sub_category_name=rs.getString(3);
																	
													%>
																<tbody>
																	<tr>
																		<td> <%=course_category_id %> </td>
																		<td> <%=course_category_name %> </td>
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
										<!-- End View Category Details-->
                                   </form>
                                </div>
                             </div>
                        </div>
                    </div>
                     <!-- End Form Elements -->
                </div>
			<!-- end page-wrapper -->
	</body>
</html>
