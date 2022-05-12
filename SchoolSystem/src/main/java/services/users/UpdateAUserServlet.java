package services.users;

import java.io.IOException;
import javax.servlet.ServletContext;
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

@WebServlet("/UpdateAUserServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,
						maxFileSize = 1024 * 1024 * 50,
						maxRequestSize = 1024 * 1024 * 100
)


public class UpdateAUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public UpdateAUserServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");//display HTML from servlet.
		
		String uid = request.getParameter("user_id");
		String uname = request.getParameter("user_name");
		String pass = request.getParameter("password");
		String hin = request.getParameter("hin");
		String question = request.getParameter("question");
		String ans = request.getParameter("answer");
		String role = request.getParameter("role_id");
		
		String oldFileName = request.getParameter("old_photo");
		Part part = request.getPart("file");
		String fileName = ImageService.FileNameFilter(part);
			UserBean ub = new UserBean();
			RoleBean rb = new RoleBean();
		if(!fileName.equals("")){ 
			
			ServletContext context = getServletContext();
	    	  ImageService.GetImagePart(ub.getGetPath());
			  ImageService.DeletImageFromfolder(context, oldFileName ,ub.getUrlfolder());
			ub.setUser_id(uid);
			ub.setUser_name(uname);
			ub.setPassword(pass);
			ub.setHin(hin);
			ub.setQuestion(question);
			ub.setAnswer(ans);
			rb.setRole_id(role);
			ub.setRb(rb);
			ub.setPhoto_name(fileName);
			
		}else{
			ub.setUser_id(uid);
			ub.setUser_name(uname);
			ub.setPassword(pass);
			ub.setHin(hin);
			ub.setQuestion(question);
			ub.setAnswer(ans);
			rb.setRole_id(role);
			ub.setRb(rb);
			ub.setPhoto_name("");
		}
		String msg = db.services.UserService.p_updateExistUserAccount(ub);
		HttpSession session = request.getSession(true);
		session.setAttribute("code", msg);
		if(msg.equals("Error")) {
			response.sendRedirect("./view/detail/EditAUser?id=" +msg);
		}else {
		    response.sendRedirect("./view/detail/ListUsers?id=" +msg);
		}
}

}
