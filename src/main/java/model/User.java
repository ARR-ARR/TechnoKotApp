package model;

public class User {

    private int id;
    private String fio;
    private String email;
    private String login;
    private String password;
    private String account;
    private double sum;
    private ROLE role;

    public User(int id, String fio, String email, String login, String password, String account, double sum, ROLE role) {
        this.id = id;
        this.fio = fio;
        this.email = email;
        this.login = login;
        this.password = password;
        this.account = account;
        this.sum = sum;
        this.role = role;

    }

    public int getId() {
        return id;
    }

    public String getFio() {
        return fio;
    }

    public String getEmail() {
        return email;
    }

    public String getLogin() {
        return login;
    }

    public String getPassword() {
        return password;
    }

    public String getAccount() {
        return account;
    }

    public double getSum() {
        return sum;
    }

    public enum ROLE {
        CLIENT, ADMIN, UNKNOWN
    }

    public ROLE getRole() {
        return role;
    }

    public void setSum(double sum) {
        this.sum = sum;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", fio='" + fio + '\'' +
                ", email='" + email + '\'' +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                ", account='" + account + '\'' +
                ", sum=" + sum +
                ", role=" + role +
                '}';
    }
}
