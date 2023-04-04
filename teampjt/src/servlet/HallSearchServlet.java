package servlet;

import hall.Hall;
import hall.HallService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "hallServlet", value = "/hall",
		initParams = {@WebInitParam(name="page", value = "1")})
public class HallSearchServlet extends HttpServlet {
	
	HallService hallService = new HallService();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = getPage(request);

		int totalCount = hallService.getCount();
		List<Hall> pageHalls = hallService.getPageHalls(page);

		// 총 페이지 갯수 ! -> 15페이지
		int totalPages = (int) Math.ceil((double) totalCount / 10);

		request.setAttribute("totalPages",totalPages);
		request.setAttribute("halls", pageHalls);
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
