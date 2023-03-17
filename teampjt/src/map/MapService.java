package map;

import java.awt.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpHeaders;

public class MapService {
    private int x = 0;
    private int y = 0;



    // 지오 코드 좌표값 들고오기
    public void getMap(String address) throws IOException {

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

        System.out.println(result);

        //지오코드 좌표값으로 이미지 들고오기
        getImage(x, y);




    }

    private void getImage(int x, int y) {
    }


}
