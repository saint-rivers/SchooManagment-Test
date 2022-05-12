package services.village;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CommuneBean;
import bean.VillageBean;

@WebServlet("/AddVillageServlet")
public class AddVillageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public AddVillageServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");//display HTML from servlet.
		
		
		String vil = request.getParameter("village");
		int comId = Integer.parseInt(request.getParameter("commune_id"));
		
		VillageBean vb = new VillageBean();
		
		vb.setVillage(vil);
		
		CommuneBean cb = new CommuneBean();
		cb.setCommune_id(comId);
		vb.setCb(cb);
		
		String msg = db.services.VillageService.addNewVillage(vb);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/add/AddVillage?id="+vb.getVillage_id());
	}

}
