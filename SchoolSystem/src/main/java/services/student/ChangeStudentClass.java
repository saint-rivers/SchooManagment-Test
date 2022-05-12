package services.student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.StudentClassBean;
import db.services.StudentClassService;

@WebServlet({ "/ChangeStudentClass", "/MoveStudentClass" })
public class ChangeStudentClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ChangeStudentClass() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String student_id = request.getParameter("student_id");
		String class_id = request.getParameter("edit_id");
		
		System.out.print("student_id" + student_id);
		System.out.print("Class id = " + class_id);
		
		StudentClassBean scb = new StudentClassBean();
		scb.setStudent_id(student_id);
		scb.setClass_id(class_id);
		String msg = StudentClassService.changeStudentClass(scb);
		
		String message = new Gson().toJson(msg);
		response.setContentType("application/json");
		request.setCharacterEncoding("UTF-8");
		response.getWriter().write(message);
	}

}
