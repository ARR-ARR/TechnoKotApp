package model;

public class Product {
    private String nameProduct;
    private String brand;
    private double price;
    private String description;
    private String page;
    private int id;

    public String getNameProduct() {
        return nameProduct;
    }

    public String getBrand() {
        return brand;
    }

    public double getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public String getPage(){
        return page;
    }

    public int getId() {
        return id;
    }

    public Product(String nameProduct, String brand, double price, String description, String page, int id) {
        this.nameProduct = nameProduct;
        this.brand = brand;
        this.price = price;
        this.description = description;
        this.page = page;
        this.id = id;


    }

    @Override
    public String toString() {
        return "Product{" +
                "nameProduct='" + nameProduct + '\'' +
                ", brand='" + brand + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", page='" + page + '\'' +
                ", id=" + id +
                '}' + "\n";
    }
}
