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
    private SupplierProduct supplierProduct;
    private Double price;
    private Stock stock;
    private Category category;

    public Product() {
    }

    public Product(int idProduct, String productCode, String productName, String productDescription, SupplierProduct supplierProduct, Double price, Stock stock, Category category) {
        this.idProduct = idProduct;
        this.productCode = productCode;
        this.productName = productName;
        this.productDescription = productDescription;
        this.supplierProduct = supplierProduct;
        this.price = price;
        this.stock = stock;
        this.category = category;
    }

    public Stock getStock() {
        return stock;
    }

    public void setStock(Stock stock) {
        this.stock = stock;
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

    

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public SupplierProduct getSupplierProduct() {
        return supplierProduct;
    }

    public void setSupplierProduct(SupplierProduct supplierProduct) {
        this.supplierProduct = supplierProduct;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" + "idProduct=" + idProduct + ", productCode=" + productCode + ", productName=" + productName + ", productDescription=" + productDescription + ", supplierProduct=" + supplierProduct + ", price=" + price + ", stock=" + stock + ", category=" + category + '}';
    }

   
   

  
    
}
