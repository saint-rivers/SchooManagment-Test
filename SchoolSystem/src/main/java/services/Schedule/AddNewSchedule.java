package services.Schedule;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ScheduleBean;
import db.services.ScheduleService;

@WebServlet("/AddNewSchedule")
public class AddNewSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddNewSchedule() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("class_id");
		int time_id = Integer.parseInt(request.getParameter("time_id"));
		int day_id = Integer.parseInt(request.getParameter("day_id"));
		String sub_id = request.getParameter("subject_id");
		String tid = request.getParameter("teacher_id");
		ScheduleBean sb = new ScheduleBean();
		sb.setClass_id(cid);
		sb.setTime_id(time_id);
		sb.setDay_id(day_id);
		sb.setTeacher_id(tid);
		sb.setSubject_id(sub_id);
		
		String msg = ScheduleService.addNewSchedule(sb);
		HttpSession session = request.getSession(false);
		session.setAttribute("message", msg);
		response.sendRedirect("./view/detail/ClassSchedule?id=" + sb.getClass_id());
		
	}

}
