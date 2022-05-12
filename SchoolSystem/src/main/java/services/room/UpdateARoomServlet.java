package services.room;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.RoomBean;
import db.services.RoomService;

@WebServlet("/UpdateARoomServlet")
public class UpdateARoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateARoomServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String roomId = request.getParameter("room_id");
		String rname = request.getParameter("room_name");
		
		
		RoomBean rb = new RoomBean();
		rb.setRoom_id(roomId);
		rb.setRoom(rname);
		
		String msg = RoomService.updateClassroom(rb);
		HttpSession session = request.getSession(true);
		RoomService.getAClassroom(roomId);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/detail/UpdateClassroom?id=" + rb.getRoom_id());
		
	}

}
