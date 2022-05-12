package services.student;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import bean.AddressBean;
import bean.StudentBean;
import db.services.ImageService;

@WebServlet("/AddStudentServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,
						maxFileSize = 1024 * 1024 * 50,
						maxRequestSize = 1024 * 1024 * 100
)


public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddStudentServlet() {
        super();

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");//display HTML from servlet.
		
		String id = request.getParameter("student_id");
		String fname = request.getParameter("first_name");
		String lname = request.getParameter("last_name");
		String gen = request.getParameter("gender");
		String nation = request.getParameter("nationality");
		String gid = request.getParameter("guardain_id");
		String dob = request.getParameter("dob");
		int pob = Integer.parseInt(request.getParameter("pob_village"));
		int current = Integer.parseInt(request.getParameter("current_village"));
		String phone = request.getParameter("phone_number");		
		String user_id = request.getParameter("user_id");
		StudentBean sb = new StudentBean();
		
		Part part = request.getPart("file");
		String fileName = ImageService.FileNameFilter(part);
		ServletContext context = getServletContext();
  	     ImageService.GetImagePart(sb.getGetPath());
		  ImageService.DeletImageFromfolder(context,fileName,sb.getUrlFolder());
		
		sb.setStudent_id(id);
		sb.setFirst_name(fname);
		sb.setLast_name(lname);
		sb.setGender(gen);
		sb.setNationality(nation);
		sb.setDob(dob);
		sb.setPob(pob);
		
		AddressBean ab = new AddressBean();
		ab.setVillage_id(current);
		sb.setAb(ab);
		
		sb.setGuardian_id(gid);
		sb.setPhone(phone);		
		sb.setPhoto_name(fileName);		
		sb.setUser_id(user_id);
		
		String msg = db.services.StudentService.addNewStudent(sb);
		HttpSession session = request.getSession(false);
		if(msg.equalsIgnoreCase("error")) {
			session.setAttribute("code", msg);
			response.sendRedirect("./view/detail/AddAStudent?id="+sb.getStudent_id());	
		}else {
			session.setAttribute("code", msg);
			response.sendRedirect("./view/add/AddAGuardian?id="+sb.getStudent_id());	
		}
			
	}
	
	

}
