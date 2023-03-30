package servlet;

import cafe.CafeService;
import diner.DinerService;
import hall.Hall;
import hall.HallService;
import map.Addresses;
import map.MapService;
import review.ReviewService;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;

@WebServlet(name = "mapServlet", value = "/map")
public class MapServlet extends HttpServlet {

    MapService mapService = new MapService();
    DinerService dinerService = new DinerService();
    CafeService cafeService = new CafeService();
    HallService hallService = new HallService();
    ReviewService reviewService = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = request.getParameter("address");
        int id = Integer.parseInt(request.getParameter("id"));
        String tableName = request.getParameter("board");

        // tableName 유효성
        if(!tableName.equals("diner")&&!tableName.equals("hall")&&!tableName.equals("gym")
           &&!tableName.equals("library")&&!tableName.equals("cafe")){
            request.setAttribute("fail", "잘못된 table 경로입니다.");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        }

        try {

            Addresses findAddress = mapService.getMap(address);

            if(findAddress!=null){

                Image mapImg = mapService.getMapImg(findAddress.getX(), findAddress.getY(),address);

                // Image를 BufferedImage로 변환
                BufferedImage bufferedImage = (BufferedImage) mapImg;
                // BufferedImage를 base64로 인코딩
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                ImageIO.write(bufferedImage, "png", baos);
                baos.flush();
                byte[] imageInByte = baos.toByteArray();
                baos.close();
                String base64Encoded = Base64.getEncoder().encodeToString(imageInByte);

                request.setAttribute("mapImage",base64Encoded);

            }

            request.setAttribute("reviews",reviewService.getReviewsAboutTarget(id,tableName));
            switch (tableName){
                case "diner":
                    request.setAttribute("diner", dinerService.getOneDiner(address));
                    request.getRequestDispatcher("/WEB-INF/views/diner-detail.jsp").forward(request,response);
                    break;
                case "cafe":
                    request.setAttribute("cafe", cafeService.getOneCafe(address));
                    request.getRequestDispatcher("/WEB-INF/views/cafe-detail.jsp").forward(request,response);
                    break;
                case "hall":

                    request.setAttribute("hall", hallService.getOneHall(address));
                    request.getRequestDispatcher("/WEB-INF/views/hall-detail.jsp").forward(request,response);
                    break;
            }


        }catch (NullPointerException e){
            request.setAttribute("fail", "네이버 서버 오류(올바른 주소를 불러오지 못함)");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request,response);
        }

    }



}
