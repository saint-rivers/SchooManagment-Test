package services.DayServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.DayBean;
import db.services.DayService;

@WebServlet({ "/GetDay", "/GetDayServlet" })
public class GetDay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetDay() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String value =  request.getParameter("classid");
		try{
			System.out.println("Get day from Jsp: " + value);
			ArrayList<DayBean> list = DayService.getDaysByClassID(value);
			String getList = new Gson().toJson(list);
			response.setContentType("application/json");
			request.setCharacterEncoding("UTF-8");
			response.getWriter().write(getList);
			System.out.println("json format : " + getList);
		}catch(Exception e){
			e.toString();
		}
	}

}
