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


@WebServlet({ "/UpdateEducation", "/UpdateEducationTeacher" })
public class UpdateEducation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateEducation() {
        super();
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String education_id = request.getParameter("education_id");
		String teacher_id = request.getParameter("teacher_id");
		String primary_name = request.getParameter("primary_school_name");
		String start_date_primary= request.getParameter("start_primaryschool_date");
		String end_date_primary= request.getParameter("end_primaryschool_date");
		
		String heigth_name = request.getParameter("heightschool_name");
		String start_date_height= request.getParameter("start_heightschool_date");
		String end_date_height= request.getParameter("end_heightschool_date");
		
		String universety_name = request.getParameter("university_name");
		String start_date_univerSety= request.getParameter("start_university_date");
		String end_date_univerSety= request.getParameter("end_university_date");
		
		String skill = request.getParameter("skill");
		String level = request.getParameter("level");
		String teacher_type = request.getParameter("teacher_type");
		
		EducationBean ed = new EducationBean();

		 ed.setEducation_id(education_id);
		 System.out.print(ed.getEducation_id());
		  TeacherBean tb = new TeacherBean();
		  tb.setT_id(teacher_id);
		  ed.setTeacherbean(tb);       
		 ed.setprimary_name(primary_name);
		 ed.setStart_date_primary(start_date_primary);
		 ed.setEnd_date_primary(end_date_primary);
		 ed.setHeigth_name(heigth_name);
		 ed.setStart_date_heigth(start_date_height);
		 ed.setEnd_date_heigth(end_date_height);
         ed.setUniverSety_name(universety_name);
		 ed.setStart_date_univerSety(start_date_univerSety);
		 ed.setEnd_date_univerSety(end_date_univerSety);
		 ed.setSkill(skill);
		 ed.setLevel(level);
		 ed.setTeacher_type(teacher_type);
		
		
		 String msg = db.services.EducationService.UpdateTeacherEducation(ed);
			HttpSession session = request.getSession(false);
			session.setAttribute("code", msg);
			response.sendRedirect("./view/teacher_education/UpdateEducationTeacher?id=" +ed.getEducation_id());
		
		
		
	}

}
