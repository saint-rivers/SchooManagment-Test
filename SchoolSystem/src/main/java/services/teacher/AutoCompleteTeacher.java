package services.teacher;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import db.services.TeacherService;

@WebServlet({ "/AutoCompleteTeacher", "/TeacherAutocompleteServlet.do" })
public class AutoCompleteTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AutoCompleteTeacher() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		response.setContentType("application/json");
		
		String value =  request.getParameter("term");
		System.out.println("Get teacher from Jsp: " + value);
		ArrayList<String> list = TeacherService.listTeacherAutoComplete(value);
		String getList = new Gson().toJson(list);
		
		response.getWriter().write(getList);
		System.out.println("json format : " + getList);
	}

}
