package services.district;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.DistrictBean;
import db.services.DistrictService;

@WebServlet("/ProvinceServlet")
public class DistrictServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;   
    public DistrictServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("proid"));
		try{
			ArrayList<DistrictBean> list = DistrictService.p_listAllDistrictByProvinceID(id);
			String json = new Gson().toJson(list);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}catch(Exception e){
			e.toString();
		}
	}

}
