import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.io.output.*;

/**
 * Servlet implementation class LectureServlet
 */
//@WebServlet("/LectureServlet")
public class LectureServlet extends HttpServlet
 {
	 private static final long serialVersionUID = 1L;
	 private boolean isMultipart;
	 private String filePath ="C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/courseatwheel/videos/";
	 private int maxFileSize = 50 * 1024 * 1204;
	 private int maxMemSize = 50 * 1024 * 1204;
	 private File file ;
	 private String fileUrl="videos/";
	 private Connection con;
	 private Statement st;
	 boolean flag;
       
    
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
		PrintWriter out =response.getWriter();
		int topic_id=0,course_id=0,lecture_id=0;
		String lecture_file=" ",user_id=" ",submit=" ",lecture_name =" ";
		HttpSession session = request.getSession();
		user_id=(String)session.getAttribute("user_id");
		
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
			out.println("<p> Name is "+lecture_file + "</p>");
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
						
						if(fi.getFieldName().equals( "lecture_name"))//lecture_name
							lecture_name = fi.getString();
						else if(fi.getFieldName().equals("course_id"))
							course_id=Integer.parseInt(fi.getString());
						else if(fi.getFieldName().equals("topic_id"))
							topic_id=Integer.parseInt(fi.getString());
						else if(fi.getFieldName().equals("submit"))//user_id
							submit=fi.getString();
					 }
				 }
				out.println("<p>"+ lecture_file + "</p>");
				out.println("</body>");
				out.println("</html>");
				// database coding
				if ( !flag ) return;
				try
				 {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseatwheel","root","aneri");
				
					String sql="";
					if(submit.equals("Lecture Add"))
						 sql = "insert into courseatwheel.lecture(lecture_name,lecture_file,course_id,topic_id,user_id) values(?,?,?,?,?)" ;
					
					PreparedStatement pstmt=con.prepareStatement(sql);
					System.out.println(sql);
					pstmt.setString(1,lecture_name);//1 specifies the first parameter in the query  
					pstmt.setString(2,fileUrl + fileName); 
					pstmt.setInt(3,course_id);
					pstmt.setInt(4,topic_id);
					pstmt.setString(5,user_id);
					
					int n = pstmt.executeUpdate();
					if(n == 0)
					 {
						response.sendRedirect("Error.jsp"); return;
					 }
	
					if(user_id.equals("Admin"))
					 {
						response.sendRedirect("AdminLec.jsp?tid="+topic_id+"&cid="+course_id+"");
					 }
					else
					 {
						 response.sendRedirect("TrainerLec.jsp?tid="+topic_id+"&cid="+course_id+"");
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
