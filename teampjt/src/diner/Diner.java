package diner;

public class Diner {
    private String name;
    private String address;
    private String phone_num;
    private String dish;

    public Diner(String name, String address, String phone_num, String dish) {
        this.name = name;
        this.address = address;
        this.phone_num = phone_num;
        this.dish = dish;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }

    public String getDish() {
        return dish;
    }

    public void setDish(String dish) {
        this.dish = dish;
    }
}
