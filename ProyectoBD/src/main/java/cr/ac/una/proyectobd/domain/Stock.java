/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class Stock {
    private int idStock;
    private int idProduct;
    private int quantity;

    public Stock(int idStock, int idProduct, int quantity) {
        this.idStock = idStock;
        this.idProduct = idProduct;
        this.quantity = quantity;
    }

    public Stock() {
    }

    public int getIdStock() {
        return idStock;
    }

    public void setIdStock(int idStock) {
        this.idStock = idStock;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Stock{" + "idStock=" + idStock + ", idProduct=" + idProduct + ", quantity=" + quantity + '}';
    }
    
    
    
}
