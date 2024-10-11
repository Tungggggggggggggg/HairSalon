package nhomj.example.hairsalon.model;

public class Staff extends People{

    private float salary;
    //Chức vự
    private String position;

    public Staff(long id, String name, String address, String phone, String email, float salary, String position) {
        super(id, name, address, phone, email);
        this.salary = salary;
        this.position = position;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
