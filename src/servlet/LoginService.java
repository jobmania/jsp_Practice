package servlet;

public class LoginService {
    public boolean isUserValid(String user, String pw){
        return user.equals("99xx") && pw.equals("1234");
    }
}
