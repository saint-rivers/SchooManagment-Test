package services.subjects;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.SubjectClassBean;
import db.services.SubjectClassService;

@WebServlet({ "/AddSubjectClass", "/AddSubjectClassServlet" })
public class AddSubjectClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddSubjectClass() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SubjectClassBean scb = null;
		ArrayList<SubjectClassBean> list  = new ArrayList<SubjectClassBean>(); 
		
        String cid = request.getParameter("class_id");
        String a[]=request.getParameterValues("subject_id");
        for(int i=0;i<a.length;i++){
        	scb = new SubjectClassBean();
        	scb.setSubject_id(a[i]);
        	scb.setClass_id(cid);
            list.add(scb);
        }
        
		String msg = SubjectClassService.addSubjectClass(list);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/add/SubjectClass?id="+ scb.getClass_id());
	}

}
