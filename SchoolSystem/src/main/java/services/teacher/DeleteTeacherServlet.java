package services.teacher;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet({ "/DeleteTeacherServlet", "/DeleteTeacher" })
public class DeleteTeacherServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
 
    public DeleteTeacherServlet() 
    {
        super();
     
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
	    
	    System.out.print("Teacher id = " + id);
	    String result = db.services.TeacherService.P_Delete_Teacher(id);
	    
	    String msg = new Gson().toJson(result);
	    response.setContentType("application/json");
	    request.setCharacterEncoding("UTF-8");
	    response.getWriter().write(msg);
	}

}
