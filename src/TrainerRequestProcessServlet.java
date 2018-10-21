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
 * Servlet implementation class TrainerRequestProcessServlet
 */
@WebServlet("/TrainerRequestProcessServlet")
public class TrainerRequestProcessServlet extends HttpServlet 
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
		String submit,status,trainer_id;
		HttpSession session = request.getSession();
		trainer_id=(String) session.getAttribute("trainer_id");
		submit=request.getParameter("submit");
		status=" ";
		Connection connection;
		PreparedStatement pstmt;
		ResultSet rs;
		String sql=" ";
		
		try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
			if(submit.equals("Accept"))
				sql="update courseatwheel.user set status='Accepted' where user_id='"+trainer_id+"' ";
			else if(submit.equals("Deny"))
				sql="delete from courseatwheel.user where user_id='"+trainer_id+"'";
			pstmt=connection.prepareStatement(sql);
			System.out.println(sql);
			pstmt.executeUpdate();
			int n=pstmt.executeUpdate();
			if(n==0)
				response.sendRedirect("Error.jsp");
			else
				response.sendRedirect("TrainerRequest.jsp");
		 }
		catch(Exception e)
		 {
			e.printStackTrace();
			System.out.println(e);
		 }
	 }

}
