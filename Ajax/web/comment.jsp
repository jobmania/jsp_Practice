<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
  String comment=request.getParameter("comment");
  String email=request.getParameter("email");


  if(comment==null||email==null||comment.trim().equals("")||email.trim().equals("")){
    out.print("<p>댓글 내용과 이메일을 적어 주세요.</p>");
  }else{

    try{
      String url = "jdbc:mysql://localhost:3306/webshop?useSSL=false";
      Connection con=DriverManager.getConnection(url,"root","test1234");
      PreparedStatement ps0=con.prepareStatement("SELECT * FROM USER WHERE email=?");
      ps0.setString(1, email);
      ResultSet rs0 = ps0.executeQuery();
      if(rs0.next()){
        PreparedStatement ps=con.prepareStatement("insert into COMMENT(comment,email) values(?,?)");
        ps.setString(1,comment);
        ps.setString(2,email);
        int i=ps.executeUpdate(); // 입력, 수정, 삭제시 >> rs int로 리턴이됨 ( 1 개 작업이 되었으면 1 이나옴)

        PreparedStatement ps2=con.prepareStatement("select * from COMMENT order by id desc");
        ResultSet rs=ps2.executeQuery(); // 조회시 >> rs 있음.

        out.print("<hr/><h2>Comments:</h2>");
        while(rs.next()){
          out.print("<div class='box'>");
          out.print("<p>"+rs.getString("comment")+"</p>"); ///getString(2)
          out.print("<p><strong>글쓴이 : "+rs.getString("email")+"</strong></p>");
          out.print("</div>");
        }
      }else {
        out.println("회원이 아닌 사람은 작성하실수 없습니다.");
      }


      con.close();
    }catch(Exception e){out.print(e);}
  }
%>