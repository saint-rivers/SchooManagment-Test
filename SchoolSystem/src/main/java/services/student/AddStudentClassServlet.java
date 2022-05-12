package services.student;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.StudentClassBean;
import db.services.StudentClassService;

@WebServlet({ "/AddStudentClassServlet", "/AddStudentClass" })
public class AddStudentClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AddStudentClassServlet() {super();}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentClassBean scb = null;
		ArrayList<StudentClassBean> list  = new ArrayList<StudentClassBean>(); 
		
        String cid = request.getParameter("class_id");
        String a[]=request.getParameterValues("student_id");
        for(int i=0;i<a.length;i++){
        	scb = new StudentClassBean();
        	scb.setStudent_id(a[i]);
        	scb.setClass_id(cid);
            list.add(scb);
        }
        
		String msg = StudentClassService.addStudentClass(list);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/StudentClass/ClassStudent?id="+ scb.getClass_id());
	}

}
