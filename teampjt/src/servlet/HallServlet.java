package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import diner.DinerService;
import hall.HallService;

@WebServlet(name = "hallServlet", value = "/hall",
		initParams = {@WebInitParam(name="page", value = "1")})
public class HallServlet extends HttpServlet {
	
	HallService hallService = new HallService();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = getPage(request);

		request.setAttribute("totalPages",0);
		request.setAttribute("halls", null);
		request.setAttribute("sendPageNum",page+1); // 현재 페이지
		request.getRequestDispatcher("/WEB-INF/views/hall.jsp").forward(request,response);

	}


	private int getPage(HttpServletRequest request) {
		String stringPage = request.getParameter("page");
		int page ;

		if(stringPage==null){
			page = Integer.parseInt(this.getInitParameter("page"));
		}else {
			page = Integer.parseInt(stringPage);
		}


		// 1페이지당 10개.
		page -= 1; // first page =
		return page;
	}
}
