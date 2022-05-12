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

@WebServlet("/EditSubjectCategoryServlet")
public class EditSubjectCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public EditSubjectCategoryServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String cId = request.getParameter("category_id");
		String cname = request.getParameter("category_name");
		
		
		SubjectCategoryBean scb = new SubjectCategoryBean();
		scb.setCategory_id(cId);
		scb.setCategory_name(cname);
		
		String msg = SubjectCategoryService.updateSubjectCategory(scb);
		HttpSession session = request.getSession(true);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/edit/EditSubjectCategory?id="+scb.getCategory_id());
	}

}
