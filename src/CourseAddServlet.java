import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CourseAddServlet
 */
//@WebServlet("/CourseAddServlet")
public class CourseAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		//int course_novice_id=Integer.parseInt(request.getParameter("course_novice_id"));
		int course_novice_id=0;
		int course_id=Integer.parseInt(request.getParameter("course_id"));
		String course_name=" ",course_image=" ",user_id=" ",trainer_id=" ",submit=" ",join_date=" ",completion_date=" ",status=" ";
		course_name=request.getParameter("course_name");
		course_image=request.getParameter("course_image");
		user_id=request.getParameter("user_id");
		trainer_id=request.getParameter("trainer");
		submit=request.getParameter("submit");
		Connection connection;
		PreparedStatement pstmt;
		Statement stmt;
		String sql=" ";
		ResultSet rs;
		session.setAttribute("user_id",user_id);
//		if(user_id == null)
		if(user_id.equals("null"))
		 {
			response.sendRedirect("LogIn.jsp");
		 }
		else
		 {
			try
			 {
				Class.forName("com.mysql.jdbc.Driver");
				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
				if(submit.equals("Enroll"))
				 {
					 sql="insert into courseatwheel.course_novice(course_id,course_name,novice_id,trainer_id,join_date,completion_date,status,course_image) values(?,?,?,?,curdate(),null,'Activated',?)";
					pstmt=connection.prepareStatement(sql);
					System.out.println(sql);
					pstmt.setInt(1,course_id);
					pstmt.setString(2,course_name);
					pstmt.setString(3,user_id);
					pstmt.setString(4,trainer_id);
					pstmt.setString(5,course_image);
					int n=pstmt.executeUpdate();
					if(n==0)
					 {
						response.sendRedirect("Error.jsp");
					 }
					else
					 {
						response.sendRedirect("ActivatedCourse.jsp");
					 }
				 }
				else if(submit.equals("DeActivate Course"))
				 {
					 course_novice_id=Integer.parseInt(request.getParameter("course_novice_id"));
					 stmt = connection.createStatement();
					 sql="update courseatwheel.course_novice set status='DeActivated' where novice_id='"+user_id+"' and course_novice_id="+course_novice_id+"";
					 System.out.println(sql);
					 int n= stmt.executeUpdate(sql);
					 if(n==0)
					  {
						  response.sendRedirect("Error.jsp");
					  }
					 else
					  {
						  response.sendRedirect("DeActivatedCourse.jsp?cnid="+course_novice_id+"&uid='"+user_id+"'");
					  }
				 }
				else if(submit.equals("ReAdd"))
				 {
					 course_novice_id=Integer.parseInt(request.getParameter("course_novice_id"));
					 stmt = connection.createStatement();
					 sql="update courseatwheel.course_novice set status='Activated' where novice_id='"+user_id+"' and course_novice_id="+course_novice_id+"";
					 System.out.println(sql);
					 int n = stmt.executeUpdate(sql);
					 if(n==0)
					  {
						  response.sendRedirect("Error.jsp");
					  }
					 else 
					  {
						  response.sendRedirect("ActivatedCourse.jsp");
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

}
