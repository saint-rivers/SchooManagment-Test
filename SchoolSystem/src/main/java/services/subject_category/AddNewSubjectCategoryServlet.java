package services.subject_category;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.SubjectCategoryBean;
import db.services.SubjectCategoryService;

@WebServlet("/AddNewSubjectCategoryServlet")
public class AddNewSubjectCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AddNewSubjectCategoryServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("category_id");
		String name = request.getParameter("category_name");
		
		SubjectCategoryBean scb = new SubjectCategoryBean();
		scb.setCategory_id(id);
		scb.setCategory_name(name);
		String msg = SubjectCategoryService.addNewSubjectCategory(scb);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/add/AddSubjectCategory?id="+scb.getCategory_id());
	}

}
