/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class Order {
    private int idOrder;
    private int idClient;
    private int idShipment;
    private boolean deleted;
    private int productOrdered;

    public Order(int idOrder, int idClient, int idShipment, boolean deleted, int productOrdered) {
        this.idOrder = idOrder;
        this.idClient = idClient;
        this.idShipment = idShipment;
        this.deleted = deleted;
        this.productOrdered = productOrdered;
    }

    public Order() {
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getIdClient() {
        return idClient;
    }

    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    public int getIdShipment() {
        return idShipment;
    }

    public void setIdShipment(int idShipment) {
        this.idShipment = idShipment;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public int getProductOrdered() {
        return productOrdered;
    }

    public void setProductOrdered(int productOrdered) {
        this.productOrdered = productOrdered;
    }

    @Override
    public String toString() {
        return "Order{" + "idOrder=" + idOrder + ", idClient=" + idClient + ", idShipment=" + idShipment + ", deleted=" + deleted + ", productOrdered=" + productOrdered + '}';
    }
    
    
}
