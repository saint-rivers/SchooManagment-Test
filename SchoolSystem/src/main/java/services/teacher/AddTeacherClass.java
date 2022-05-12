package services.teacher;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.TeacherClassBean;
import db.services.TeacherClassService;

@WebServlet({ "/AddTeacherClass", "/AddTeacherClassServlet" })
public class AddTeacherClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddTeacherClass() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TeacherClassBean tcb = null;
		ArrayList<TeacherClassBean> list  = new ArrayList<TeacherClassBean>(); 
		
        String cid = request.getParameter("class_id");
        String a[]=request.getParameterValues("teacher_id");
        for(int i=0;i<a.length;i++){
        	tcb = new TeacherClassBean();
        	tcb.setTeacher_id(a[i]);
        	tcb.setClass_id(cid);
            list.add(tcb);
        }
        
		String msg = TeacherClassService.addTeacherClass(list);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/add/TeacherClass?id="+ tcb.getClass_id());
	}

}
