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

@WebServlet("/UpdateStudentServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,
						maxFileSize = 1024 * 1024 * 50,
						maxRequestSize = 1024 * 1024 * 100
)

public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateStudentServlet() {super(); }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");//display HTML from servlet.
	    
		String stu_id = request.getParameter("student_id");
		String fname = request.getParameter("first_name");
		String lname = request.getParameter("last_name");
		String gender =request.getParameter("gender");
		String nation = request.getParameter("nationality");
		String dob = request.getParameter("dob");
		int pob_address = Integer.parseInt(request.getParameter("pob_village_id"));
		int current_address = Integer.parseInt(request.getParameter("current_village_id"));
		String phone = request.getParameter("phone_number");
		String guardian = request.getParameter("guardian_id");
		
		String oldFileName = request.getParameter("old_photo");
		Part part = request.getPart("file");
		String fileName = ImageService.FileNameFilter(part);
		
		StudentBean sb = new StudentBean();
		AddressBean pob = new AddressBean();
		AddressBean current_add = new AddressBean();
		
		if(!fileName.equals("")){ // have new photo to update
			
			ServletContext context = getServletContext();
	    	  ImageService.GetImagePart(sb.getGetPath());
			  ImageService.DeletImageFromfolder(context,oldFileName,sb.getUrlFolder());
			sb.setStudent_id(stu_id);
			sb.setFirst_name(fname);
			sb.setLast_name(lname);
			sb.setGender(gender);
			sb.setNationality(nation);
			sb.setDob(dob);
			pob.setVillage_id(pob_address);
			sb.setAb(pob);
			current_add.setVillage_id(current_address);
			sb.setAbCurrent(current_add);
			
			sb.setPhone(phone);
			sb.setGuardian_id(guardian);
			sb.setPhoto_name(fileName);			
		}else{
			
			sb.setStudent_id(stu_id);
			sb.setFirst_name(fname);
			sb.setLast_name(lname);
			sb.setGender(gender);
			sb.setNationality(nation);
			sb.setDob(dob);
			pob.setVillage_id(pob_address);
			sb.setAb(pob);
			current_add.setVillage_id(current_address);
			sb.setAbCurrent(current_add);
			sb.setPhone(phone);
			sb.setGuardian_id(guardian);
			sb.setPhoto_name("");
		}
		
		String msg = db.services.StudentService.updateAStudent(sb);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		if(msg.equals("Error")) {
			    response.sendRedirect("./view/update/EditStudent?message=" + msg);
		}else {
		   response.sendRedirect("./view/detail/NameList?msg=" + msg);
		}
		
	}

}
