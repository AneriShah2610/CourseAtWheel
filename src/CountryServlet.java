import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

/**
 * Servlet implementation class CountryServlet
 */
//@WebServlet("/Admin/CountryServlet")
public class CountryServlet extends HttpServlet 
 {
	private static final long serialVersionUID = 1L;
       
	public void init(ServletConfig config) throws ServletException 
	 {
		// TODO Auto-generated method stub
	 }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	 {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	 {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		int country_id=Integer.parseInt(request.getParameter("country_id"));
		String country_name=request.getParameter("country_name");
		String submit=request.getParameter("submit");
		
		try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
			String sql=" ";
			if(submit.equals("Add country"))
				sql = "insert into country values(?,?)" ;
			
			PreparedStatement pstmt=con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setInt(1,country_id);//1 specifies the first parameter in the query  
			pstmt.setString(2,country_name);  
			
			int n = pstmt.executeUpdate();
			if(n == 0)
			 {
				response.sendRedirect("Error.jsp");
			 }
			else
			 {
				response.sendRedirect("Country.jsp");
			 }
		 }
		catch(Exception e)
		 {
			e.printStackTrace();
			System.out.println(e);
		 }
	 }

}
