package dao;

import model.Login;

public interface LoginDAO {
    //    로그인 확인(로그인 객체 입력)
    String loginCheck(Login loginBean);
}
