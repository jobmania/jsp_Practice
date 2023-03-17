package servlet;

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

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = request.getParameter("address");

        mapService.getMap();
        //네이버 api 지오코딩을 이용해 주소를 좌표값으로 변환.
        StringBuilder urlBuilder = new StringBuilder("https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="); // URL
        urlBuilder.append(URLEncoder.encode(address, "UTF-8"));  // 주소를 인코딩

        String set = "129.0756416,35.1795543"; // 현재 위치
        urlBuilder.append("&coordinate="); // 부산 위도 경도..
        urlBuilder.append(URLEncoder.encode(set, "UTF-8"));
        String url = urlBuilder.toString();

        response.setHeader("X-NCP-APIGW-API-KEY-ID","ywu2wqjm9z");
        response.setHeader("X-NCP-APIGW-API-KEY","hIAqxfsbM2UVHCBj40JJLJWqfT1MO315FTJl4TQx");

        response.sendRedirect(url);


//
//        URL url = new URL(urlBuilder.toString());
//        HttpURLConnection conn = (HttpURLConnection) url.openConnection();  // http 연결
//        conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID","ywu2wqjm9z");
//        conn.setRequestProperty("X-NCP-APIGW-API-KEY","hIAqxfsbM2UVHCBj40JJLJWqfT1MO315FTJl4TQx");
//
//




    }
}
