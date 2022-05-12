package services.district;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DistrictBean;
import bean.ProvinceBean;

@WebServlet("/AddDistrictServlet")
public class AddDistrictServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddDistrictServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");//display HTML from servlet.		
		String dist = request.getParameter("district");
		int proId = Integer.parseInt(request.getParameter("province_id"));
		
		DistrictBean distb = new DistrictBean();		
		distb.setDistrict(dist);
		distb.setProvince_id(proId);	
		String msg = db.services.DistrictService.addNewDistrict(distb);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/detail/AddNewDistrict?message=" + msg);
	}

}
