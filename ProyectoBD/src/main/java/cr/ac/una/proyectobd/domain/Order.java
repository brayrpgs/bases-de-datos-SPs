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
    private Client client;
    private Shipments shipments;
    private boolean deleted;
    private int productOrdered;

    public Order(int idOrder, Client client, Shipments shipments, boolean deleted, int productOrdered) {
        this.idOrder = idOrder;
        this.client = client;
        this.shipments = shipments;
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

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Shipments getShipments() {
        return shipments;
    }

    public void setShipments(Shipments shipments) {
        this.shipments = shipments;
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
        return "Order{" + "idOrder=" + idOrder + ", client=" + client + ", shipments=" + shipments + ", deleted=" + deleted + ", productOrdered=" + productOrdered + '}';
    }

    
    
    
}
