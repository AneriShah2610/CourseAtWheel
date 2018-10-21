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
 * Servlet implementation class LogInServlet
 */
//@WebServlet("/LogInServlet")
public class LogInServlet extends HttpServlet 
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
		PrintWriter out = response.getWriter();
		String user_id=" ",email,password,user_type=" ",status=" ",submit;
		email=request.getParameter("email");
		password=request.getParameter("password");
		submit=request.getParameter("submit");
		HttpSession session = request.getSession();
		Connection connection;
		PreparedStatement pstmt;
		String sql=" ";
		ResultSet rs;
		try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
			if(submit.equals("Login"))
				sql="select *from courseatwheel.user where email='"+email+"' && password='"+password+"' ";
			pstmt = connection.prepareStatement(sql);
			rs=pstmt.executeQuery(sql);
			System.out.println(sql);
		
			if(! rs.next())
			 {
				out.println("Invalid password or email");
				response.sendRedirect("LogIn.jsp?e=1");
				return;
			 }
		
			user_id=rs.getString(1);
			user_type=rs.getString(7);
			status=rs.getString(12);
			
			session.setAttribute("user_id", user_id);
			System.out.println(user_id);
			session.setAttribute("user_type", user_type);
			System.out.println(user_type);
			session.setAttribute("status",status);
			
			response.sendRedirect("Index.jsp");
		 }
		catch(Exception e)
		 {
			e.printStackTrace();
			System.out.println(e);
		 }
	 }
}
