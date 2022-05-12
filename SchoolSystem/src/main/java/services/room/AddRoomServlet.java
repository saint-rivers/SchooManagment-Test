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

@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddRoomServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("room_id");
		String name = request.getParameter("room_name");
		
		RoomBean rb = new RoomBean();
		rb.setRoom_id(id);
		rb.setRoom(name);
		String msg = RoomService.addNewClassroom(rb);
		HttpSession session = request.getSession(false);
		session.setAttribute("code", msg);
		response.sendRedirect("./view/detail/AddClassroom?id="+rb.getRoom_id());
	}

}
