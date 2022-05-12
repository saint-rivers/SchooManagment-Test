package services.ClassStudyDetail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ClassStudyDetailBean;

@WebServlet("/AddClassStudyDetailServlet")
public class AddClassStudyDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public AddClassStudyDetailServlet() {
        super();
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String course = request.getParameter("txtcourse");
		
		ClassStudyDetailBean csdb = new ClassStudyDetailBean();
		csdb.setName(course);
		
		String msg = db.services.ClassStudyService.addNewClassStudyDetail(csdb);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/detail/ClassStudyDetailInfo?id="+csdb.getClassID());
	}

}
