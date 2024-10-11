package nhomj.example.hairsalon.model;

public class Customer extends People {

    //Số lần đến shop
    private int number;

    public Customer(long id, String name, String address, String phone, String email, int number) {
        super(id, name, address, phone, email);
        this.number = number;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
