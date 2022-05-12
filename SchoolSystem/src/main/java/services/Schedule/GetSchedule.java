package services.Schedule;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.ScheduleBean;
import db.services.ScheduleService;

@WebServlet("/GetSchedule")
public class GetSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetSchedule() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String value =  request.getParameter("classid");
		System.out.print("value");
		try{
			System.out.println("Get day from Jsp: " + value);
			ArrayList<ScheduleBean> list = ScheduleService.getScheduleByClassID(value);
			
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
