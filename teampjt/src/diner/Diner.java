package diner;

public class Diner {
    private int id;
    private String name;
    private String address;
    private String phone_num;
    private String dish;

    public Diner() {

    }

    public Diner(int id, String name, String address, String phone_num, String dish) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.phone_num = phone_num;
        this.dish = dish;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
