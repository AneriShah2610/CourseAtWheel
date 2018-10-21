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
        <title>Forgot password</title>
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
            <div class="codrops-top">
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
                            <form  action="caw5" method="post" autocomplete="on"> 
                                <h1>Forgot Password</h1> 
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
                                    <label for="password" class="youpasswd" data-icon="p" > Enter New Password </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="Enter new password" minlength="6" maxlength="25" />
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="cp"> ReEnter Password </label>
                                    <input required type="password" name="cpassword" id="cpassword" minlength="6" maxlength="25" placeholder="Enter password again" onkeyup="checkPass(); return false;"/>
									<span id="confirmMessage" class="confirmMessage"></span>
                                </p>
								<a href="LogIn.jsp"> SignIn </a>
                                <p class="login button"> 
                                    <input type="submit" name="submit" value="Submit"/> 
								</p>
                            </form>
                        </div>
                    </div>
                </div>  
            </section>
        </div>
		<script type="text/javascript">
			function checkPass()
			 {
				//Store the password field objects into variables ...
				var pass1 = document.getElementById('password');
				var pass2 = document.getElementById('cpassword');
				//Store the Confimation Message Object ...
				var message = document.getElementById('confirmMessage');
				//Set the colors we will be using ...
				var goodColor = "#66cc66";
				var badColor = "#ff6666";
				//Compare the values in the password field 
				//and the confirmation field
				if(pass1.value == pass2.value){
					//The passwords match. 
					//Set the color to the good color and inform
					//the user that they have entered the correct password 
					pass2.style.backgroundColor = goodColor;
					message.style.color = goodColor;
					message.innerHTML = "Passwords Match"
				}else{
					//The passwords do not match.
					//Set the color to the bad color and
					//notify the user.
					pass2.style.backgroundColor = badColor;
					message.style.color = badColor;
					message.innerHTML = "Passwords Do Not Match!"
				}
			 }
		</script>
    </body>
</html>