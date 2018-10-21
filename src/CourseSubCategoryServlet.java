import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import Admin.CourseSubCategory;
import AdminDAO.CourseSubCategoryDAO;

public class CourseSubCategoryServlet extends HttpServlet
 {
	 private static final long serialVersionUID = 1L;
	
	protected void init(ServletConfig config)
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
	 }
 }