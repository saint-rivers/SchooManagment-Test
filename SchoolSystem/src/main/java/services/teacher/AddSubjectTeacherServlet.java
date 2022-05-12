package services.teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.SubjectTeacherBean;

import db.services.TeacherService;

@WebServlet({ "/AddSubjectTeacherServlet", "/AddNewSubjectTeacher" })
public class AddSubjectTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddSubjectTeacherServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SubjectTeacherBean stb = null;
		ArrayList<SubjectTeacherBean> list  = new ArrayList<SubjectTeacherBean>(); 	 
	        
	        String tid = request.getParameter("teacher_id");
	        String a[]=request.getParameterValues("subject_id");
	        for(int i=0;i<a.length;i++){
	        	stb = new SubjectTeacherBean();
	            stb.setSubjectID(a[i]);
	            stb.setTeacherID(tid);
	            list.add(stb);
	        }
        
		String msg = TeacherService.insertMultiSubjectTeacher(list);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/teacher/NewTeacherSubject?id="+ msg);
		
	}

}
