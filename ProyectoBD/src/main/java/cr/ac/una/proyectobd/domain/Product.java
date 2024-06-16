/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
*
* @author Ceasar Calvo
* 
 */
public class Product {
    private int idProduct;
    private String productCode;
    private String productName;
    private String productDescription;
    private int idSupplier;
    private Double price;
    private int idCategory;

    public Product() {
    }

    public Product(int idProduct, String productCode, String productName, String productDescription, int idSupplier, Double price, int idCategory) {
        this.idProduct = idProduct;
        this.productCode = productCode;
        this.productName = productName;
        this.productDescription = productDescription;
        this.idSupplier = idSupplier;
        this.price = price;
        this.idCategory = idCategory;
    }

   

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public int getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(int idSupplier) {
        this.idSupplier = idSupplier;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    @Override
    public String toString() {
        return "Product{" + "idProduct=" + idProduct + ", productCode=" + productCode + ", productName=" + productName + ", productDescription=" + productDescription + ", idSupplier=" + idSupplier + ", price=" + price + ", idCategory=" + idCategory + '}';
    }

    
}
