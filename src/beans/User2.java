package beans;

public class User2 {

    private String email;
    private String password;
    private String message = "";


    public User2() {

    }

    public User2(String email, String password) {
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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }


    /**
     * 이메일과 패스워드 형식에 대한 검사!
     */


    public boolean validate() {
        if (email.isEmpty()) {
            this.message = " 이메일을 입력하세요 ";
            return false;
        }else if (password.isEmpty()) {
            this.message = "비번을 입력하지 않음";
            return false;
        }else if (!email.matches("[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$")) {
            this.message = "이메일 형식이 맞지 않음";
            return false;
        }else if (password.length() < 4) {
            this.message = "패스워드는 4자 이상";
            return false;
        } else if (password.matches("\\w*\\s+\\w*")) {
            message = "패스워드에 스페이스가 포함되면 안됩니다.";
            return false;
        }

        return true;
    }


}
