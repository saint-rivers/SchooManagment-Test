package services.teacher;


import java.io.IOException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import bean.AddressBean;
import bean.TeacherBean;
import db.services.ImageService;

@WebServlet("/EditeTeacherServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,maxFileSize = 1024 * 1024 * 50,maxRequestSize = 1024 * 1024 * 100)


public class EditeTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditeTeacherServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
	      
	      String teacher_id = request.getParameter("teacher_id");
			String first_name = request.getParameter("first_name");
			String last_name = request.getParameter("last_name");
			String gender = request.getParameter("gender");
			String nationality =request.getParameter("nationality");
			String nationality_id =request.getParameter("nationality_id");
			String dob =request.getParameter("dob");
			int village_id= Integer.parseInt(request.getParameter("village_id"));			
			String phone =request.getParameter("phone_number");
			String country =request.getParameter("country");
			String status =request.getParameter("status");
			int current_village = Integer.parseInt(request.getParameter("current_village"));
			 
			String oldFileName = request.getParameter("old_photo");
			Part part = request.getPart("file");
			String fileName = ImageService.FileNameFilter(part);
			
			
			TeacherBean teb = new TeacherBean();
			AddressBean ab = new AddressBean();
			AddressBean ad = new AddressBean();
	    if(!fileName.equals("")){ 	   
	    
	    	ServletContext context = getServletContext();
	    	  ImageService.GetImagePart(teb.getPartOf());
			  ImageService.DeletImageFromfolder(context, oldFileName ,teb.getUrl());
			  
			teb.setT_id(teacher_id);
		   	teb.setT_fname(first_name);
		   	teb.setT_lname(last_name);
			teb.setT_gender(gender);
		    ab.setVillage_id(village_id);
		   	teb.setaddress_teacher(ab);
		   	teb.setT_dob(dob);
		   	teb.setT_phone(phone);
		   	teb.setNationality(nationality);
		    teb.setCountry(country);		   
		    teb.setNationality_id(nationality_id);
		    ad.setVillage_id(current_village);
		    teb.setCurrent_address(ad);
		    teb.setStustus(status);
		    teb.setT_photo(fileName);		    
	    }else{
	    	
	    	teb.setT_id(teacher_id);
		   	teb.setT_fname(first_name);
		   	teb.setT_lname(last_name);
			teb.setT_gender(gender);
			ab.setVillage_id(village_id);
		   	teb.setaddress_teacher(ab);
		   	teb.setT_dob(dob);
		   	teb.setT_phone(phone);
		   	teb.setNationality(nationality);
		   	teb.setCountry(country);
		    ad.setVillage_id(current_village);
		    teb.setCurrent_address(ad);
		    teb.setNationality_id(nationality_id);
		    teb.setStustus(status);
		    teb.setT_photo("");
	    }
	    
	    String msg = db.services.TeacherService.UpdateATeacher(teb);
	    HttpSession session = request.getSession(false);
	    session.setAttribute("code", msg);
	    if(msg.equals("Error")) {
	         response.sendRedirect("./view/update/UpdateATeacher?message=" + msg);
	    }else {
	    	 response.sendRedirect("./view/detail/ListTeacher?message=" + msg);
	    }
	    
	  }
	  
}

