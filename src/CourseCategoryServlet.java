import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class CourseCategoryServlet extends HttpServlet
 {
	 private static final long serialVersionUID = 1L;
	
	public void init(ServletConfig config)
	throws ServletException
	 {
		//
	 }
	 
	 /*
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	 {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	 }
	 
	 /*
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	 {
		 PrintWriter out=response.getWriter();
		 int course_category_id;
		 String course_category_name,course_sub_category_name;
		 course_sub_category_name=request.getParameter("optionsRadios");
		 course_category_name=request.getParameter("category_name");
		 String submit=request.getParameter("submit");
		 
		 try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
			String sql=" ";
			if(submit.equals("submit"))
				sql = "insert into courseatwheel.course_category(course_category_name,course_sub_category_name) values(?,?)";
			
			PreparedStatement pstmt=con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1,course_category_name);//1 specifies the first parameter in the query  
			pstmt.setString(2,course_sub_category_name);  
			
			int n = pstmt.executeUpdate();
			if(n == 0)
			 {
				response.sendRedirect("Error.jsp");
			 }
			else
			 {
				response.sendRedirect("ViewCourseCategory.jsp");
			 }
		 }
		catch(Exception e)
		 {
			e.printStackTrace();
			System.out.println(e);
		 }
	 }
 }