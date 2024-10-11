package nhomj.example.hairsalon.model;

public class SeviceShop {
    private int id;
    private String name;
    private double price;
    private String describe;
    private int time;

    public SeviceShop() {

    }
    public SeviceShop(int id, String name, double price, String describe, int time) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.time = time;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }
}
