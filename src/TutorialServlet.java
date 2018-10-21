import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.io.output.*;


/**
 * Servlet implementation class TutorialServlet
 */
//@WebServlet("/Admin/TutorialServlet")
public class TutorialServlet extends HttpServlet 
 {
	private static final long serialVersionUID = 1L;
    private boolean isMultipart;
	private String filePath ="C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/courseatwheel/files/";
	private int maxFileSize = 1000 * 1024 * 1024;
	private int maxMemSize = 1000 * 1024 * 1024;
	private File file ;
	private String fileUrl="files/";
	private Connection con;
	private Statement st;
	boolean flag;
	
	
	// init method
	public void init(ServletConfig config)
	throws ServletException 
	 {
//		System.out.println(config.getServletContext().getInitParameter("file-upload"));
//		System.out.println(config.getServletContext().getInitParameter("file-url"));

		// Get the file location where it would be stored.
		/*filePath = 
             getServletContext().getInitParameter("file-upload"); 
		fileUrl = getServletContext().getInitParameter("file-url");*/
	 }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	 {
		String user_id=" ";
		int topic_id=0,course_id=0;
		HttpSession session = request.getSession();
		topic_id=(Integer) session.getAttribute("topic_id");
		user_id=(String) session.getAttribute("user_id");
		course_id=(Integer) session.getAttribute("course_id");
		Connection connection;
		PreparedStatement pstmt,pstmt1;
		String sql,sql1;
		
		try 
		 {
			Class.forName("com.mysql.jdbc.Driver");
   			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
			
			sql="delete from courseatwheel.course where course_id=?";
			pstmt=connection.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setInt(1,course_id);
			int n = pstmt.executeUpdate();
			
			sql1="delete from courseatwheel.topic where course_id=?";
			pstmt1=connection.prepareStatement(sql1);
			System.out.println(sql1);
			pstmt.setInt(1,course_id);
			int n1 = pstmt1.executeUpdate();
			
			if(n==0 || n1==0)
		     {
				System.out.println("Error.jsp");
			 }
		   else 
		    {
				if(user_id.equals("Admin"))
				 {
					response.sendRedirect("AdminCourseAdd.jsp");
				 }
				else 
				 {
					response.sendRedirect("TrainerCourseAdd.jsp");
				 }
			}
		 }
		catch(Exception e)
		 {
			 e.printStackTrace();
			 System.out.println(e);
		 }
	 }*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException 
	 {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String user_id=" ",tutorial_file=" ",trainer_id=" ",submit=" ";
		int course_id=0,topic_id=0,lecture_id=0,tutorial_id=0;
		
		HttpSession session = request.getSession();
		user_id=(String)session.getAttribute("user_id");
		// Check that we have a file upload request

		isMultipart = ServletFileUpload.isMultipartContent(request);
		response.setContentType("text/html");
		System.out.println(filePath);
		if( !isMultipart )
		 {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet upload</title>");  
			out.println("</head>");
			out.println("<body>");
			out.println("<p> Name is "+ tutorial_file + "</p>");
			out.println("<p>No file uploaded</p>"); 
			out.println("</body>");
			out.println("</html>");
			return;
		 }
		 DiskFileItemFactory factory = new DiskFileItemFactory();
		 // maximum size that will be stored in memory
		 factory.setSizeThreshold(maxMemSize);
		 // Location to save data that is larger than maxMemSize.
		 factory.setRepository(new File("c:\\temp"));
		 // Create a new file upload handler
		 ServletFileUpload upload = new ServletFileUpload(factory);
		 // maximum file size to be uploaded.
		 upload.setSizeMax( maxFileSize );
		try
		 { 
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);
			// Process the uploaded file items
			Iterator i = fileItems.iterator();
				out.println("<html>");
				out.println("<head>");
				out.println("<title>Servlet upload</title>");  
				out.println("</head>");
				out.println("<body>");
				String fileName ="";
				while ( i.hasNext () ) 
				 {
					System.out.println("Before fi ");
					FileItem fi = (FileItem)i.next();
					System.out.println("After fi ");
					System.out.println("! fi.isFormField " + !fi.isFormField());
					flag = true;
					if ( !fi.isFormField () )	
					 {
						// Get the uploaded file parameters
						String fieldName = fi.getFieldName();
						fileName = fi.getName();
						String contentType = fi.getContentType();
						boolean isInMemory = fi.isInMemory();
						long sizeInBytes = fi.getSize();
						// Write the file
			
						if( fileName.lastIndexOf("\\") >= 0 )
						 {
							fileName = fileName.substring( fileName.lastIndexOf("\\"));
							file = new File( filePath + fileName );
							// fileUrl += fileName.substring( fileName.lastIndexOf("\\"));
						 }
						else
						 {
							fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
							file = new File( filePath + fileName   ) ;
							//fileUrl += fileName.substring( fileName.lastIndexOf("\\") + 1);
						 }
						fi.write( file ) ;
						out.println("Uploaded Filename: " + fileName + "<br>");
						out.println("Url : "+ fileUrl + "</br>");
					 }
					else
					 {
						/*if ( fi.getFieldName().equals( "name"))
							name = fi.getString();*/
						if(fi.getFieldName().equals( "course_id"))//course_id
							course_id=Integer.parseInt(fi.getString());
						else if(fi.getFieldName().equals("topic_id"))//topic_id
							topic_id=Integer.parseInt(fi.getString());
						else if(fi.getFieldName().equals("lecture_id"))//lecture_id
							lecture_id=Integer.parseInt(fi.getString());
						else if(fi.getFieldName().equals("trainer_id"))//trainer_id
							trainer_id = fi.getString();
						else if(fi.getFieldName().equals("submit"))//submit
							submit=fi.getString();
					 }
				 }
				out.println("<p>"+ tutorial_file + "</p>");
				out.println("</body>");
				out.println("</html>");
				// database coding
				if ( !flag ) return;
				try
				 {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
				
					String sql="";
					if(submit.equals("Add"))
						 sql = "insert into courseatwheel.tutorial(tutorial_file,course_id,topic_id,lecture_id,trainer_id) values(?,?,?,?,?)";
					
					PreparedStatement pstmt=con.prepareStatement(sql);
					System.out.println(sql);
					pstmt.setString(1,fileUrl + fileName);//1 specifies the first parameter in the query  
					pstmt.setInt(2,course_id); 
					pstmt.setInt(3,topic_id);
					pstmt.setInt(4,lecture_id);
					pstmt.setString(5,trainer_id);
					
					int n = pstmt.executeUpdate();
					if(n == 0)
					 {
						response.sendRedirect("Error.jsp"); return;
					 }
	
					if(user_id.equals("Admin"))
					{
						response.sendRedirect("AdminTutorial.jsp?cid="+course_id+"&tid="+topic_id+"&lid="+lecture_id+"");
					 }
					else 
					 {
					  response.sendRedirect("TrainerTutorial.jsp?cid="+course_id+"&tid="+topic_id+"&lid="+lecture_id+"");
					  }
				 }
				catch(Exception e)
				 {
					e.printStackTrace();
					System.out.println(e);
				 }
			 }
		 catch(Exception ex) 
		  {
			System.out.println(ex);
			ex.printStackTrace();
		 }
	 }

}
