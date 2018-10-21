<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Login </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/LogIn_Registration.css" />
    </head>
    <body>
	
        <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top">W
                <a href="Index.jsp">
                    <strong>&laquo; CourseAtWheel </strong> 
                </a>
                
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            <header>
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="caw7" method="post" autocomplete="on"> 
                                <h1>Log in</h1> 
								<%	
									String user_id=" ",user_type=" ",status=" ";
									user_id=(String)session.getAttribute("user_id");
									user_type=(String) session.getAttribute("user_type");
									status=(String) session.getAttribute("status");
									if(request.getParameter("e")!=null)
									 {
								%>
										 <tr>
											<td> Invalid Password </td>
										 </tr>
								<%
									 }
								%>
                                <p> 
                                    <label for="email" class="email" data-icon="e" > Your Email </label>
                                    <input id="email" name="email" required="required" type="text" placeholder="mymail@mail.com"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Password </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="Enter your secret code" /> 
                                	<a href="ForgotPassword.jsp"> Forgot Password </a>
                                </p>
                                <p class="login button"> 
                                    <input type="submit" name="submit" value="Login" /> 
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="UserType.jsp" class="to_register">SignUp</a>
								</p>
                            </form>
                        </div>
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>