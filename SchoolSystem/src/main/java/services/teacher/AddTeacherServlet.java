package services.teacher;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import bean.AddressBean;
import bean.TeacherBean;
import db.services.ImageService;
import db.services.TeacherService;

@WebServlet("/AddTeacherServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,
						maxFileSize = 1024 * 1024 * 50,
						maxRequestSize = 1024 * 1024 * 100)


public class AddTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddTeacherServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");//display HTML from swiveled.
		
		String teacher_id = request.getParameter("teacher_id");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String gender = request.getParameter("gender");
		String nationality =request.getParameter("nationality");
		String nationality_id =request.getParameter("nationality_id");
		String dob =request.getParameter("dob");
		int village_id= Integer.parseInt(request.getParameter("village_id"));
		String phone =request.getParameter("phone_number");
		int current_village = Integer.parseInt(request.getParameter("current_village"));
		String status =request.getParameter("status");
		String Country = request.getParameter("country");
		String user_id = request.getParameter("user_id");
		  TeacherBean teb= new TeacherBean();		
		
		Part part = request.getPart("file");
		String fileName = ImageService.FileNameFilter(part);
		
		teb.setT_id(teacher_id);
	   	teb.setT_fname(first_name);
	   	teb.setT_lname(last_name);
		teb.setT_gender(gender);
	   	teb.setPob(village_id);
	   	teb.setT_dob(dob);
	   	teb.setT_phone(phone);
	   	teb.setNationality(nationality);
	   	
	   	AddressBean abb =new AddressBean();
	    abb.setVillage_id(current_village);
	    teb.setaddress_teacher(abb);
	    teb.setNationality_id(nationality_id);
	    teb.setStustus(status);
	    teb.setT_photo(fileName);	    
	    teb.setCountry(Country);
	    teb.setUser_id(user_id);
	    
	    String msg = TeacherService.P_AddTeacher_InforMation(teb);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		if(msg.equals("Error")) {
			response.sendRedirect("./view/Teacher/AddTeacher?message="+ msg);
		}else {
		   response.sendRedirect("./view/teacher_education/AddEducationTeacher?message="+ msg);
		}
	}
	
}

