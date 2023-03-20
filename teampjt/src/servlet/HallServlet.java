package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import diner.DinerService;
import hall.HallService;

@WebServlet(name = "hallServlet", value = "/hall")
public class HallServlet extends HttpServlet {
	
	HallService hallService = new HallService();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("halls", hallService.getHalls());
		request.getRequestDispatcher("/WEB-INF/views/hall.jsp").forward(request, response);
	}

	

}
