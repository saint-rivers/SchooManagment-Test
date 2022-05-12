package services.teacher;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import bean.TeacherBean;
import db.services.TeacherService;

@WebServlet("/GetTeacherBySubjectID")
public class GetTeacherBySubjectID extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetTeacherBySubjectID() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("subject_id");
		System.out.print("Subject_id " + id);
		try{
			ArrayList<TeacherBean> list = TeacherService.getTeacherBySubjectID(id);
			String json = new Gson().toJson(list);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}catch(Exception e){
			e.toString();
		}
	}

}
