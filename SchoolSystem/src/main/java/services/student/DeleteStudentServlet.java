package services.student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import db.services.StudentService;
@WebServlet({ "/DeleteStudentServlet", "/DeleteAStudent.do" })
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;     
    public DeleteStudentServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		System.out.print("Student id = " + id);
		String result = StudentService.deleteStudent(id);
		
		String msg = new Gson().toJson(result);
		response.setContentType("application/json");
		request.setCharacterEncoding("UTF-8");
		response.getWriter().write(msg);
	}
}
