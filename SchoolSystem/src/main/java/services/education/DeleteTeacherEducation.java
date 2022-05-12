package services.education;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import bean.EducationBean;
import bean.TeacherBean;
import db.services.EducationService;
import db.services.RoomService;

@WebServlet({ "/DeleteTeacherEducation", "/DeleteTeacherEductionById" })
public class DeleteTeacherEducation extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteTeacherEducation() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String education_id = request.getParameter("education_id");
		
		String result = EducationService.DeleteEducationTeacher(education_id);
		String msg = new Gson().toJson(result);
		response.setContentType("application/json");
		request.setCharacterEncoding("UTF-8");
		response.getWriter().write(msg);	
	}

}
