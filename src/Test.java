import beans.User2;

public class Test {
    public static void main(String[] args) {
        User2 user2 = new User2("abc@abc.com", "abc223");

        if(user2.validate()){
            System.out.println("유효성 검사 ok");
        }else {
            System.out.println(" 유효성 검사 X " + user2.getMessage());
        }

    }
}
