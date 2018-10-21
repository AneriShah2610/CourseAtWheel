import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

/**
 * Servlet implementation class QuizServlet
 */
//@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet 
 {
	private static final long serialVersionUID = 1L;
       
	public void init(ServletConfig config) throws ServletException 
	 {
		// TODO Auto-generated method stub
	 }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	 {
		PrintWriter out = response.getWriter(); 
		int course_id=0,topic_id=0,lecture_id=0,quiz_id=0;
		String user_id=request.getParameter("uid");
		topic_id=Integer.parseInt(request.getParameter("tid"));
		course_id=Integer.parseInt(request.getParameter("cid"));
		lecture_id=Integer.parseInt(request.getParameter("lid"));
		quiz_id=Integer.parseInt(request.getParameter("qid"));
		Connection connection;
		PreparedStatement pstmt;
		String sql;
		
		try 
		 {
			Class.forName("com.mysql.jdbc.Driver");
   			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
			sql="delete from courseatwheel.quiz where quiz_id=?";
			pstmt=connection.prepareStatement(sql);
			pstmt.setInt(1,quiz_id);
			int n = pstmt.executeUpdate();
			if(n==0)
		     {
				System.out.println("Error.jsp");
			 }
		   else
			{
				if(user_id.equals("Admin"))
				 {
					response.sendRedirect("AdminQuiz.jsp?cid="+course_id+"&tid="+topic_id+"&lid="+lecture_id+"");
				 }
				else 
				 {
					response.sendRedirect("TrainerQuiz.jsp?cid="+course_id+"&tid="+topic_id+"&lid="+lecture_id+"");
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
		String user_id=" ",quiz_name=" ",submit=" ";
		int  course_id=0,topic_id=0,lecture_id=0,quiz_id=0;
		HttpSession session = request.getSession();
		topic_id=Integer.parseInt(request.getParameter("topic_id"));
		user_id=request.getParameter("trainer_id");
		course_id=Integer.parseInt(request.getParameter("course_id"));
		lecture_id=Integer.parseInt(request.getParameter("lecture_id"));
		quiz_name=request.getParameter("quiz_name");
		submit=request.getParameter("submit");
		Connection connection;
		PreparedStatement pstmt;
		String sql=" ";
		try
		 {
			Class.forName("com.mysql.jdbc.Driver");
   			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
   			if(submit.equals("Add"))
				sql="insert into courseatwheel.quiz(quiz_name,course_id,topic_id,lecture_id,user_id) values(?,?,?,?,?)";
	   			pstmt=connection.prepareStatement(sql);
	   			pstmt.setString(1, quiz_name);
	   			pstmt.setInt(2, course_id);
	   			pstmt.setInt(3, topic_id);
	   			pstmt.setInt(4, lecture_id);
				pstmt.setString(5, user_id);
				System.out.println(sql);
				int n = pstmt.executeUpdate();
				if(n==0)
				 {
					response.sendRedirect("Error.jsp");
				 }
				else
				 {
					if(user_id.equals("Admin"))
					 {
						response.sendRedirect("AdminQuiz.jsp?cid="+course_id+"&tid="+topic_id+"&lid="+lecture_id+"");
					 }
					else 
					 {
						response.sendRedirect("TrainerQuiz.jsp?cid="+course_id+"&tid="+topic_id+"&lid="+lecture_id+"");
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
