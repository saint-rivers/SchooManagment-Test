package services.education;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.EducationBean;
import bean.TeacherBean;

@WebServlet("/AddNeweducation")
public class AddNeweducation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddNeweducation() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String education_id = request.getParameter("education_id");
		System.out.print("Education id = " + education_id);
		
		String teacher_id = request.getParameter("teacher_id");
		String primary_school_name = request.getParameter("primary_school_name");
		String start_primaryschool_date= request.getParameter("start_primaryschool_date");
		String end_primaryschool_date= request.getParameter("end_primaryschool_date");
		
		String heightschool_name = request.getParameter("heightschool_name");
		String start_heightschool_date= request.getParameter("start_heightschool_date");
		String end_heightschool_date= request.getParameter("end_heightschool_date");
		
		String university_name = request.getParameter("university_name");
		String start_university_date= request.getParameter("start_university_date");
		String end_university_date = request.getParameter("end_university_date");
		
		String skill = request.getParameter("skill");
		String level = request.getParameter("level");
		String teacher_type = request.getParameter("teacher_type");
		
		
		EducationBean ed = new EducationBean();
		 ed.setEducation_id(education_id);
		 
		 TeacherBean tb = new TeacherBean();
		 tb.setT_id(teacher_id);
		 ed.setTeacherbean(tb);
		  System.out.print(ed.getTeacherbean());
		 ed.setprimary_name(primary_school_name);
		 ed.setStart_date_primary(start_primaryschool_date);
		 ed.setEnd_date_primary(end_primaryschool_date);
		 ed.setHeigth_name(heightschool_name);
		 ed.setStart_date_heigth(start_heightschool_date);
		 ed.setEnd_date_heigth(end_heightschool_date);
		 ed.setUniverSety_name(university_name);
		 ed.setStart_date_univerSety(start_university_date);
		 ed.setEnd_date_univerSety(end_university_date);
		 ed.setSkill(skill);
		 ed.setLevel(level);
		 ed.setTeacher_type(teacher_type);
		  
		 String msg = db.services.EducationService.InsertTeacherEducation(ed);
			HttpSession session = request.getSession(false);
			session.setAttribute("code", msg);
			if(msg.equals("Error")) {
				response.sendRedirect("./view/teacher_education/AddEducationTeacher?message=" + msg);
			}else {
				response.sendRedirect("./view/detail/ListTeacher?message=" + msg);
			}
			
	}

}
