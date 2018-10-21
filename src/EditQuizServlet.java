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
 * Servlet implementation class EditQuizServlet
 */
//@WebServlet("/EdiQuizServlet")
public class EditQuizServlet extends HttpServlet 
 {
	private static final long serialVersionUID = 1L;
       
	public void init(ServletConfig config) throws ServletException 
	 {
		// TODO Auto-generated method stub
	 }
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	 {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();		
		String question=" ",option1=" ",option2=" ",option3=" ",option4=" ",answer=" ",submit=" ",user_id=" ";
		int quiz_id=0,question_id=0,topic_id=0,lecture_id=0,course_id=0;
		user_id=request.getParameter("user_id");
		quiz_id=Integer.parseInt(request.getParameter("quiz_id"));
		question=request.getParameter("question");
		option1=request.getParameter("option1");
		option2=request.getParameter("option2");
		option3=request.getParameter("option3");
		option4=request.getParameter("option4");
		answer=request.getParameter("answer");
		course_id=Integer.parseInt(request.getParameter("course_id"));
		topic_id=Integer.parseInt(request.getParameter("topic_id"));
		lecture_id=Integer.parseInt(request.getParameter("lecture_id"));
		submit=request.getParameter("submit");
		Connection connection;
		PreparedStatement pstmt;
		String sql=" ";
		
		try
		 {
			Class.forName("com.mysql.jdbc.Driver");
   			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
   			if(submit.equals("submit"))
				sql="insert into courseatwheel.quiz_details(question,option1,option2,option3,option4,answer,quiz_id) values(?,?,?,?,?,?,?)";
	   			pstmt=connection.prepareStatement(sql);
	   			pstmt.setString(1, question);
	   			pstmt.setString(2, option1);
	   			pstmt.setString(3, option2);
	   			pstmt.setString(4, option3);
				pstmt.setString(5, option4);
				pstmt.setString(6, answer);
				pstmt.setInt(7, quiz_id);
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
						response.sendRedirect("AdminEditQuiz.jsp?qid="+quiz_id+"&cid="+course_id+"&tid="+topic_id+"&lid="+lecture_id+"");
					 }
					else 
					 {
						response.sendRedirect("TrainerEditQuiz.jsp?qid="+quiz_id+"&cid="+course_id+"&tid="+topic_id+"&lid="+lecture_id+"");
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
