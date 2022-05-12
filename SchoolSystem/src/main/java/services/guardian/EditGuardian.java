package services.guardian;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AddressBean;
import bean.GuardianBean;

@WebServlet({ "/EditGuardian", "/UpdateGuardianServlet" })
public class EditGuardian extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditGuardian() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("guardian_id");
		String fname = request.getParameter("father_name");
		String fjob = request.getParameter("father_job");
		String mname = request.getParameter("mother_name");
		String mjob = request.getParameter("mother_job");
		String phone = request.getParameter("phone_number");
		int cvillage = Integer.parseInt(request.getParameter("current_village_id"));
		
		GuardianBean gb = new GuardianBean();
		AddressBean ab = new AddressBean();
		gb.setGuardian_id(id);
		gb.setFather_name(fname);
		gb.setFather_job(fjob);
		gb.setMother_name(mname);
		gb.setMother_job(mjob);
		gb.setGuardian_phone(phone);
		ab.setVillage_id(cvillage);
		gb.setAb(ab);
		
		String msg = db.services.GuardianService.updateGuardian(gb);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/update/UpdateAGuardian?id=" + gb.getGuardian_id());
		
	}

}
