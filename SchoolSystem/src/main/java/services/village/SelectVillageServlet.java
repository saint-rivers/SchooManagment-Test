package services.village;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.VillageBean;
import db.services.VillageService;

@WebServlet("/SelectVillageServlet")
public class SelectVillageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SelectVillageServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("comid"));
		try{
			ArrayList<VillageBean> list = VillageService.p_listAllVillageByCommuneID(id);
			String json = new Gson().toJson(list);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}catch(Exception e){
			e.toString();
		}
	}

}
