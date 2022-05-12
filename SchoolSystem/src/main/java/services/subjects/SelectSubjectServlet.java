package services.subjects;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import db.services.SubjectService;

@WebServlet("/SelectSubjectServlet")
public class SelectSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectSubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html: charset=UTF-8");
		
		response.setContentType("application/json");
		String value = request.getParameter("term");
		
		ArrayList<String> list = SubjectService.p_autoCompleteListSubject(value);
		String getList = new Gson().toJson(list);
		
		response.getWriter().write(getList);
		System.out.println("json format : " + getList);
	}

}
