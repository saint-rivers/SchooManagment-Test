package services.subjects;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.SubjectBean;
import bean.SubjectCategoryBean;
import db.services.SubjectService;

@WebServlet("/UpdateASubjectServlet")
public class UpdateASubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateASubjectServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String subId = request.getParameter("subject_id");
		String subname = request.getParameter("subject_name");
		String catid = request.getParameter("category_id");
		
		SubjectBean sb = new SubjectBean();
		sb.setSubject_id(subId);
		
		
		sb.setSubject_name(subname);
		
		SubjectCategoryBean scb = new SubjectCategoryBean();
		scb.setCategory_id(catid);
		
		System.out.println("category id = " + scb.getCategory_id());
		sb.setScb(scb);
		
		String msg = SubjectService.updateSubject(sb);
		HttpSession session = request.getSession(true);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/edit/udateSubject?id="+sb.getSubject_id());
	}

}
