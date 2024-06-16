/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class ProductOrdered {
    private int idProductOrdered;
    private int idOrdered;
    private int idProduct;

    public ProductOrdered(int idProductOrdered, int idOrdered, int idProduct) {
        this.idProductOrdered = idProductOrdered;
        this.idOrdered = idOrdered;
        this.idProduct = idProduct;
    }

    public ProductOrdered() {
    }

    public int getIdProductOrdered() {
        return idProductOrdered;
    }

    public void setIdProductOrdered(int idProductOrdered) {
        this.idProductOrdered = idProductOrdered;
    }

    public int getIdOrdered() {
        return idOrdered;
    }

    public void setIdOrdered(int idOrdered) {
        this.idOrdered = idOrdered;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    @Override
    public String toString() {
        return "ProductOrdered{" + "idProductOrdered=" + idProductOrdered + ", idOrdered=" + idOrdered + ", idProduct=" + idProduct + '}';
    }
    
    
}
