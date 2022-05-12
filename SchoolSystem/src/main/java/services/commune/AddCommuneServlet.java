package services.commune;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CommuneBean;
import bean.DistrictBean;

@WebServlet("/AddCommuneServlet")
public class AddCommuneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddCommuneServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");//display HTML from servlet.		
		String com = request.getParameter("commune");
		int distId = Integer.parseInt(request.getParameter("district_id")) ;
		
		CommuneBean cb = new CommuneBean();		
		cb.setCommune(com);
		
		DistrictBean distb = new DistrictBean();
		distb.setDistrict_id(distId);

		cb.setDb(distb);	
		String msg = db.services.CommuneService.addNewCommune(cb);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/detail/AddNewCommune?id=" + cb.getCommune_id());
	}

}
