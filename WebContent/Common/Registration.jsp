<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en-US">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html">
	<title>Registration Form</title>
		<meta name="author" content="Jake Rocheleau">
		<link rel="shortcut icon" href="http://static.tmimgcdn.com/img/favicon.ico">
		<link rel="icon" href="http://static.tmimgcdn.com/img/favicon.ico">
		<link rel="stylesheet" type="text/css" media="all" href="css/Registration.css">
		<script type="text/javascript" src="js/Registration.js"></script>
	</head>

	<body>
		<div class="codrops-top">
                <a href="Index.jsp">
                    <strong>&laquo; CourseAtWheel </strong> 
                </a>
            <div class="clr"></div>
        </div><!--/ Codrops top bar -->
		<div id="wrapper">
		<h1>Register to CourseAtWheel</h1>
		<%
			try
			 {
			 	Class.forName("com.mysql.jdbc.Driver");
				Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
				Statement stmt=connection.createStatement();
				String sql=" ";
				ResultSet rs;
				String submit=request.getParameter("submit");
				int country_id = 0,state_id = 0,city_id = 0;
				String country_name=" ",state_name=" ",city_name=" ";
				String User_Type=request.getParameter("submit");
				out.println(User_Type);
				session.setAttribute("User_Type",User_Type);
		 %>
				<form action="caw5" method="post" enctype="multipart/from-data">
					<div class="col-1">
						<label>
							<strong>User Name</strong>
							<input type="text" placeholder="Enter UserName" id="username" name="username" tabindex="1" required />
						</label>
					</div>
					<p>
					<div class="col-2">
						<label>
							<strong>First Name</strong>
							<input type="text" id="fname" name="fname" tabindex="2" required />
						</label>
					</div>
					<div class="col-2">
						<label>
							<strong>Last Name</strong>
							<input type="text" id="lname" name="lname" tabindex="3" required />
						</label>
					</div>
					<div class="col-3">
						<label>
							<strong>Contact No.</strong>
							<input type="text"  id="phone" name="phone" tabindex="4" required />
						</label>
					</div>
					<div class="col-3">
						<label>
							<strong>Email</strong>
							<input type="email" id="email" name="email" tabindex="5" required />
						</label>
					</div>
					<div class="col-3">
						<label>
							<strong>Password</strong>
							<input type="password" name="password" id="password" tabindex="6" required />
						</label>
					</div>
				<%
					if(submit.equals("Register as Trainer"))
					 {
				%>						
						<div class="col-3">
							<label>
								<strong>Country</strong>
								<select name="country" id="country">
									<%
										stmt=connection.createStatement();
										sql="select *from courseatwheel.country order by country_name";
										rs=stmt.executeQuery(sql);
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
							</label>
						</div>
						<div class="col-3">
							<label>
								<strong>State</strong>
								<select name="state" id="state">
									<%
										stmt=connection.createStatement();
										sql="select *from courseatwheel.state order by state_name";
										rs=stmt.executeQuery(sql);
										while(rs.next())
										 {
											state_id=rs.getInt(1);
											state_name=rs.getString(3);
									%>
											<option value='<%= state_id%>'> <%= state_name%> </option>
			                        <%	 
			                        	 }
									%>
								</select>
							</label>
						</div>
						<div class="col-3">
							<label>
								<strong>City</strong>
								<input type="text" name="city" id="city" required />
							</label>
						</div>
			<%				 
					 }
					else
					{
						
					}
			%>
					
					<div class="col-submit">
						<input type="submit" name="submit" value="Register" /> 
						<input type="reset" name="reset" value="reset" />
					</div>
					
				</form>
			</div>
			<%
			 	}
			   catch(Exception e)
		        {
				   e.printStackTrace();
				   System.out.println(e);
		        }
			%>
			<script type="text/javascript">
				var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
				elems.forEach(function(html) {
				var switchery = new Switchery(html);
				});
			</script>
	</body>
</html>