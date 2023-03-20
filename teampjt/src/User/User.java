package User;

public class User {
    private String email; //
    private String password;  // 복호화 인코딩

    private String nickName;


    // 추가 항목들 설정 가능

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
