
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%
  String strId = request.getParameter("id");
  if (strId == null || strId.trim().equals("")) { // id 입력값이 널값인 경우에
    out.print("아이디를 입력해주세요!");
  } else {
    int id = Integer.parseInt(strId);
    //System.out.println(id);
    try {
      String url = "jdbc:mysql://localhost:3306/webshop?useSSL=false";
      Connection con = DriverManager.getConnection(url, "root", "test1234");

      PreparedStatement ps = con.prepareStatement("select * from emp where id=?");
      ps.setInt(1, id);
      ResultSet rs = ps.executeQuery(); //SQL문 실제 실행후 결과 rs 리턴
      if (rs.next()) {
        out.print(rs.getInt(1) + " " +rs.getString(2) + " "+rs.getString(3)+" "+rs.getString(4));
      }else {
        out.println("조회한 id에 회원이 없습니다. ");
      }

      con.close();
    } catch (Exception e) {
      e.printStackTrace(); //예외 발생시
    }
  }
%>