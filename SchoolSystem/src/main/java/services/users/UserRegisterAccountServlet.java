package services.users;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import bean.RoleBean;
import bean.UserBean;
import db.services.ImageService;

@WebServlet("/UserRegisterAccountServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,
						maxFileSize = 1024 * 1024 * 50,
						maxRequestSize = 1024 * 1024 * 100
)


public class UserRegisterAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public UserRegisterAccountServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");	
		String userId = request.getParameter("user_id");
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		String hin = request.getParameter("hin");
		String quest = request.getParameter("question");
		String answer = request.getParameter("answer");
		String role_code = request.getParameter("role_code");

		Part part = request.getPart("file");
		String fileName = ImageService.FileNameFilter(part);
	               
		UserBean ub = new UserBean();
		ub.setUser_id(userId);
		ub.setUser_name(user);
		ub.setPassword(pass);
		ub.setHin(hin);
		ub.setQuestion(quest);
		ub.setAnswer(answer);
		ub.setPhoto_name(fileName);
		
		RoleBean rb = new RoleBean();
		rb.setRole_id(role_code);
		ub.setRb(rb);
		String msg = db.services.UserService.P_addNewRegisterUserAccount(ub);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		session.setAttribute("user_id", ub.getUser_id());
		
		if(msg.contentEquals("Success")) {
			if(ub.getRb().getRole_id().equals("role001")) {		
				  response.sendRedirect("./view/Teacher/AddTeacher?message="+ msg);	
			}else {
				  response.sendRedirect("./view/detail/AddAStudent?message="+ msg);
			}
		}else {
			     response.sendRedirect("./view/account/RegisterForm?message="+ msg);	
		}
				
		
	}

}
