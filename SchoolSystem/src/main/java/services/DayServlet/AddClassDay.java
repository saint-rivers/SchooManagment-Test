package services.DayServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ClassScheduleBean;
import db.services.DayService;

@WebServlet({ "/AddClassDay", "/AddClassSchedule" })
public class AddClassDay extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddClassDay() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClassScheduleBean csb = null;
		ArrayList<ClassScheduleBean> list  = new ArrayList<ClassScheduleBean>(); 
	        
	        String cid = request.getParameter("class_id");
	        String a[]= request.getParameterValues("day_id");
	        for(int i=0;i<a.length;i++){
	        	csb = new ClassScheduleBean();
	        	csb.setClass_id(cid);
	        	csb.setDay_id(Integer.parseInt(a[i]));
	            list.add(csb);
	        }
        
		String msg = DayService.insertClassSchedule(list);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/detail/TeacherTimeTable?id="+ msg);
		
	
	}

}
