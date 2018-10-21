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
 * Servlet implementation class TopicServlet
 */
//@WebServlet("/TopicServlet")
public class TopicServlet extends HttpServlet 
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
		String user_id=" ",course_name=" ",course_category_name=" ";
		int  course_id=0,topic_id=0;
		HttpSession session = request.getSession();
		topic_id=Integer.parseInt(request.getParameter("tid"));
		user_id=request.getParameter("uid");
		course_name=request.getParameter("cn");
		course_id=Integer.parseInt(request.getParameter("cid"));
		Connection connection;
		PreparedStatement pstmt;
		String sql;
		
		try 
		 {
			Class.forName("com.mysql.jdbc.Driver");
   			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
			sql="delete from courseatwheel.topic where topic_id=?";
			pstmt=connection.prepareStatement(sql);
			pstmt.setInt(1,topic_id);
			int n = pstmt.executeUpdate();
			if(n==0)
		     {
				System.out.println("Error.jsp");
			 }
		   else 
		    {
				if(user_id.equals("Admin"))
				 {
					response.sendRedirect("AdminTopic.jsp?cid="+course_id+"&cn="+course_name+"&ct="+course_category_name+"");
				 }
				else 
				 {
					response.sendRedirect("TrainerTopic.jsp?cid="+course_id+"&cn="+course_name+"&ct="+course_category_name+"");
				 }
			}
		 }
		catch(Exception e)
		 {
			 e.printStackTrace();
			 System.out.println(e);
		 }
	 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	 {
		PrintWriter out = response.getWriter(); 
		HttpSession session = request.getSession();
		int course_id=0,topic_id=0;
		String topic_name=" ",topic_description=" ",user_id=" ",course_name=" ",submit=" ",course_category_name=" ";
		course_id=Integer.parseInt(request.getParameter("course_id"));
		course_name=request.getParameter("course_name");
		// course_id=(Integer) session.getAttribute("course_id");
		user_id=(String)session.getAttribute("user_id");
		topic_name=request.getParameter("topic_name");
		topic_description=request.getParameter("description");
		course_category_name=request.getParameter("course_category_name");
		submit=request.getParameter("submit");
		Connection connection;
		PreparedStatement pstmt=null;
		ResultSet rs;
		String sql=" ";
		
		try
		 {
			Class.forName("com.mysql.jdbc.Driver");
   			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
   			if(submit.equals("Topic Add"))
   			 {
   				sql="insert into courseatwheel.topic(course_id,user_id,topic_name,topic_description) values(?,?,?,?)";
   				
	   			pstmt=connection.prepareStatement(sql);
	   			pstmt.setInt(1, course_id);
	   			pstmt.setString(2, user_id);
	   			pstmt.setString(3, topic_name);
	   			pstmt.setString(4, topic_description);
				System.out.println(sql);
   			 }
   			int n = pstmt.executeUpdate();
   			if(n==0)
   			 {
   				response.sendRedirect("Error.jsp");
   			 }
   			else
   			 {
   				if(user_id.equals("Admin"))
				 {
					response.sendRedirect("AdminTopic.jsp?cid="+course_id+"&cn="+course_name+"&ct="+course_category_name+"");
				 }
				else 
				 {
					response.sendRedirect("TrainerTopic.jsp?cid="+course_id+"&cn="+course_name+"&ct="+course_category_name+"");
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
