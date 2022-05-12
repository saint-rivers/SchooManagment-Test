package services.Schedule;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.TimeBean;

@WebServlet("/AddTimeServlet")
public class AddTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AddTimeServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String st = request.getParameter("start_time");
		String et = request.getParameter("end_time");
		System.out.print("Time " + st + et);
		TimeBean tb = new TimeBean();
		tb.setStart_time(st);
		tb.setEnd_time(et);
			
		String msg = db.services.ScheduleService.addTime(tb);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/Timetable/AddTime?message=" + msg);
	}

}
