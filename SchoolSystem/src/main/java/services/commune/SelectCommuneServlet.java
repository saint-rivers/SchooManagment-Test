package services.commune;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.CommuneBean;
import db.services.CommuneService;

@WebServlet("/SelectCommuneServlet")
public class SelectCommuneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectCommuneServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("distid"));
		try{
			ArrayList<CommuneBean> list = CommuneService.p_listAllCommuneByDistrictID(id);
			String json = new Gson().toJson(list);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}catch(Exception e){
			e.toString();
		}
	}

}
