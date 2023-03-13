<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = request.getParameter("email");

    if (email != null && !email.isBlank()) {
        try {
            String url = "jdbc:mysql://localhost:3306/webshop?useSSL=false";
            Connection con = DriverManager.getConnection(url, "root", "test1234");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM USER WHERE email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery(); //SQL문 실제 실행후 결과 rs 리턴
            if (rs.next()) {
              out.println("조회한 id에 회원이 있음. ");
            } else {
                out.println("조회한 id에 회원이 없습니다. ");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace(); //예외 발생시
        }

    }

%>