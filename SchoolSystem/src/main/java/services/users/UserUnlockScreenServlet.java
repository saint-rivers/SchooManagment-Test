package services.users;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.RoleBean;
import bean.UserBean;
import db.services.UserService;

@WebServlet("/UserUnlockScreenServlet")
public class UserUnlockScreenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserUnlockScreenServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		UserBean ub = new UserBean();
		ub.setUser_name(user);
		ub.setPassword(pass);
		
		UserBean uBean = UserService.P_getUserUnlockScreen(ub);
	    if(!uBean.getUrl().equalsIgnoreCase("./lock_screen")){
	    	HttpSession session = request.getSession(true);
	    	session.setAttribute("user_id", uBean.getUser_id());
	    	session.setAttribute("user_name", uBean.getUser_name());
	    	session.setAttribute("photo_name", uBean.getPhoto_name());
	    	
	    	RoleBean rb = uBean.getRb();
	    	session.setAttribute("role_code", rb.getRole_id());
	    	session.setAttribute("role_name", rb.getRole_name());
	    	
	    	response.sendRedirect(uBean.getUrl());
	    }else{
	    	request.setAttribute("msg","incorrect username and password");
	    	RequestDispatcher disp = request.getRequestDispatcher(uBean.getUrl());
	    	disp.forward(request, response);
	    }
	}

}
