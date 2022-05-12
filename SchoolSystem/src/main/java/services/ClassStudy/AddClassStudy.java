package services.ClassStudy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ClassStudyBean;
import bean.RoomBean;
import db.services.ClassStudyService;

@WebServlet({ "/AddClassStudy", "/AddClassServlet" })
public class AddClassStudy extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AddClassStudy() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String cid = request.getParameter("class_id");
		String rid = request.getParameter("room_id");
		String sdate = request.getParameter("start_date");
		String edate = request.getParameter("end_date");
		String stime = request.getParameter("time_study");
		String status = request.getParameter("status");
		
		ClassStudyBean csb = new ClassStudyBean();
		csb.setClass_id(cid);
		RoomBean rb = new RoomBean();
		rb.setRoom_id(rid);
		csb.setRoomb(rb);
		csb.setStart_date(sdate);
		csb.setEnd_date(edate);
		csb.setTime_study(stime);
		csb.setStatus(status);
		
		String msg = ClassStudyService.addNewClassStudy(csb);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/list/ClassStudy?id=" + csb.getClass_id());	
	}
}
