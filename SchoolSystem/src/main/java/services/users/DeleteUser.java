package services.users;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import db.services.UserService;

@WebServlet({ "/DeleteUser", "/DeleteUserAccount.do" })
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		System.out.print("User id = " + id);
		String result = UserService.P_deleteUser(id);
		
		String msg = new Gson().toJson(result);
		response.setContentType("application/json");
		request.setCharacterEncoding("UTF-8");
		response.getWriter().write(msg);
	}

}
