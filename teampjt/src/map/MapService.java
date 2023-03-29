package map;

import com.google.gson.*;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.RenderedImage;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpHeaders;
import java.util.List;
import java.util.UUID;

public class MapService {
    private String x;
    private String y;



    // 지오 코드 좌표값 들고오기
    public Addresses getMap(String address) throws IOException {

        //네이버 api 지오코딩을 이용해 주소를 좌표값으로 변환.
        StringBuilder urlBuilder = new StringBuilder("https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="); // URL
        urlBuilder.append(URLEncoder.encode(address, "UTF-8"));  // 주소를 인코딩


        String set = "129.0756416,35.1795543"; // 현재 위치
        urlBuilder.append("&coordinate="); // 부산 위도 경도..
        urlBuilder.append(URLEncoder.encode(set, "UTF-8"));

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();  // http 연결
        conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID","ywu2wqjm9z");
        conn.setRequestProperty("X-NCP-APIGW-API-KEY","hIAqxfsbM2UVHCBj40JJLJWqfT1MO315FTJl4TQx");

        BufferedReader br;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        } else {
            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        String result = br.readLine();
        br.close();
        conn.disconnect();

        // Gson 객체 생성
        Gson gson = new Gson();
        Map map = gson.fromJson(result, Map.class);

        for (Addresses addresses : map.getAddresses()) {
            x = addresses.getX();
            y = addresses.getY();
        }
       if(map.getAddresses().size()!=0){
           return map.getAddresses().get(0);
       }
        return null;

    }

    public Image getMapImg(String x, String y, String address) throws IOException {

        String pos = URLEncoder.encode(x + " " + y, "UTF-8");  // 인코딩 하는 이유, 한칸 띄움이 있음!
        String setUrl = "https://naveropenapi.apigw.ntruss.com/map-static/v2/raster?w=600&h=400&markers=type:t|size:mid|pos:"+pos+"|label:"+URLEncoder.encode(address, "UTF-8");

        URL url = new URL(setUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();  // http 연결
        conn.setRequestMethod("GET");
        conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID","ywu2wqjm9z");
        conn.setRequestProperty("X-NCP-APIGW-API-KEY","hIAqxfsbM2UVHCBj40JJLJWqfT1MO315FTJl4TQx");



        int responseCode = conn.getResponseCode();
        if (responseCode == 200) { //OK
            InputStream is = conn.getInputStream();
            InputStream in = conn.getInputStream();
            Image image = ImageIO.read(is);


            is.close();
            conn.disconnect();
            return image;
        }

        return null; // error 이미지 송출.
    }


}
