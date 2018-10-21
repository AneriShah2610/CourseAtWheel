import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserRegistrationServlet
 */
//@WebServlet("/UserRegistrationServlet")
public class UserRegistrationServlet extends HttpServlet 
 {
	private static final long serialVersionUID = 1L;
       
    
	public void init(ServletConfig config) throws ServletException 
	 {
		// TODO Auto-generated method stub
	 }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	 {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException 
	 {
		PrintWriter out= response.getWriter();
		String user_id,fname,lname,email,contact,password,city_name=" ",user_type,join_date,submit,status=" ";
		int country_id=0,state_id=0;
		user_id=request.getParameter("username");
		fname=request.getParameter("fname");
		lname=request.getParameter("lname");
		contact=request.getParameter("phone");
		email=request.getParameter("email");
		password=request.getParameter("password");
		submit=request.getParameter("submit");
		Connection connection;
		PreparedStatement pstmt = null;
		ResultSet rs;
		HttpSession session=request.getSession();
		user_type=(String) session.getAttribute("User_Type");
		try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
			String sql=" ";
			if(submit.equals("Register"))
			 {
				if(user_type.equals("Register as Novice"))
				 {
					sql="insert into courseatwheel.user(user_id,fname,lname,email,contact,password,user_type,join_date,status) values(?,?,?,?,?,?,'novice',CURDATE(),'Accepted')";
					pstmt=connection.prepareStatement(sql);
					pstmt.setString(1,user_id);
					pstmt.setString(2,fname);
					pstmt.setString(3,lname);
					pstmt.setString(4,email);
					pstmt.setString(5,contact);
					pstmt.setString(6,password);
					user_type = "novice";
					status = "Accepted";
				 }
				else if(user_type.equals("Register as Trainer"))
				 {
					country_id=Integer.parseInt(request.getParameter("country"));
					state_id=Integer.parseInt(request.getParameter("state"));
					city_name=request.getParameter("city");
					sql="insert into courseatwheel.user(user_id,fname,lname,email,contact,password,user_type,join_date,country_id,state_id,city_name,status) values(?,?,?,?,?,?,'trainer',CURDATE(),?,?,?,'Not Accepted')";
					pstmt=connection.prepareStatement(sql);
					pstmt.setString(1,user_id);
					pstmt.setString(2,fname);
					pstmt.setString(3,lname);
					pstmt.setString(4,email);
					pstmt.setString(5,contact);
					pstmt.setString(6,password);
					pstmt.setInt(7,country_id);
					pstmt.setInt(8,state_id);
					pstmt.setString(9,city_name);
					user_type="trainer";
					status="Not Accepted";
				 }
				int n=pstmt.executeUpdate();
				if(n==0)
				 {
					response.sendRedirect("Error.jsp");
				 }
				else
				 {
					session.setAttribute("user_id",user_id);
					session.setAttribute("fname", fname);
					session.setAttribute("lname", lname);
					session.setAttribute("email", email);
					session.setAttribute("contact", contact);
					session.setAttribute("user_type", user_type);
					session.setAttribute("country_id", country_id);
					session.setAttribute("state_id", state_id);
					session.setAttribute("city_name", city_name);
					session.setAttribute("status",status);
					response.sendRedirect("Index.jsp");
				 } 
			 }
			else if(submit.equals("Submit"))	
			 {
				 sql="update courseatwheel.user set password=? where email=?";
				 pstmt=connection.prepareStatement(sql);
				 pstmt.setString(1,password);
				 pstmt.setString(2,email);
				 System.out.println(sql);
				 pstmt.executeUpdate();
				 int n=pstmt.executeUpdate();
				 if(n==0)
				 {
					response.sendRedirect("Error.jsp");
				 }
				else
				 {
					session.setAttribute("email", email);
					response.sendRedirect("LogIn.jsp");
				 } 
			 }
		 }
		catch(Exception e)
		 {
			e.printStackTrace();
			System.out.println(e);
		 }
	 }

}
