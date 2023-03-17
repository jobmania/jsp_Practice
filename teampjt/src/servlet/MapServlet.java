package servlet;

import diner.DinerService;
import map.Addresses;
import map.MapService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpHeaders;
import java.util.Map;

@WebServlet(name = "mapServlet", value = "/map")
public class MapServlet extends HttpServlet {

    MapService mapService = new MapService();
    DinerService dinerService = new DinerService();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = request.getParameter("address");

        request.setAttribute("diners", dinerService.getDiners());
        request.setAttribute("findAddress", mapService.getMap(address));
        request.getRequestDispatcher("/WEB-INF/views/diner.jsp").forward(request,response);

    }
}
