package services.subjects;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AddByBean;
import bean.SubjectBean;
import bean.SubjectCategoryBean;
import bean.UserBean;

@WebServlet("/AddNewSubjectServlet")
public class AddNewSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddNewSubjectServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("subject_id");
		String sub = request.getParameter("subject_name");
		String catid = request.getParameter("category_id");
		
		String input_date =request.getParameter("input_date");
		String time =request.getParameter("time");
		String user_id =request.getParameter("add_bye");
		String add_id = request.getParameter("add_by_id");
		int add_by_id = Integer.parseInt(add_id);
		
		SubjectBean sb = new SubjectBean();
		SubjectCategoryBean subcb = new SubjectCategoryBean();
		
		sb.setSubject_id(id);
		sb.setSubject_name(sub);
		subcb.setCategory_id(catid);
		
		AddByBean addby = new AddByBean ();
		UserBean user = new UserBean();
			addby.setAddby_id(add_by_id);
		    addby.setInputDate(input_date);
			addby.setInputTime(time);
			user.setUser_id(user_id);
			addby.setUserbean(user);
		sb.setAddbybean(addby);
		sb.setScb(subcb);		
		
		String msg = db.services.SubjectService.addNewSubject(sb,addby);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		if(msg.equals("Error")) {
		       response.sendRedirect("./view/detail/AddNewSubject?message="+ msg);
		}else {
			response.sendRedirect("./view/detail/ListSubject?message="+ msg);
		}
	}

}
