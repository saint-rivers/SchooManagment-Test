package services.Attendance;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AttendantBean;
import bean.DistrictBean;
import bean.SubjectTeacherBean;

@WebServlet({ "/AddAttendance", "/AddStudentAttendance" })
public class AddAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public AddAttendance() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AttendantBean atb = null;
		ArrayList<AttendantBean> list  = new ArrayList<AttendantBean>();		
		String att_date = request.getParameter("attendance_date");
		//System.out.print("Result = " + stuid_and_status);
		String data[]=request.getParameterValues("stuid_and_status");		
		for(int i=0;i<data.length;i++){
        	atb = new AttendantBean();
        	 String newData = data[i];
        	 String val[] = newData.split(":");
        	 atb.setStudent_id(val[0]);
        	 System.out.print("Chamroeun your result here : "+ val[0] );
        	 int status = Integer.parseInt(val[1]);
        	 atb.setStatus(status);
        	 atb.setDate(att_date);
        	 list.add(atb);
        }
		
		String msg = db.services.AttendanceService.insertMultiStudentAttendance(list);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/attendant/StudentAttendant?id=" + atb.getAttendace_id());
	}

}
