/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class ShoppingHistory {
    private int idShoppingHistory;
    private Client client;

    public ShoppingHistory(int idShoppingHistory, Client client) {
        this.idShoppingHistory = idShoppingHistory;
        this.client = client;
    }

    

    public ShoppingHistory() {
    }

    public int getIdShoppingHistory() {
        return idShoppingHistory;
    }

    public void setIdShoppingHistory(int idShoppingHistory) {
        this.idShoppingHistory = idShoppingHistory;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Override
    public String toString() {
        return "ShoppingHistory{" + "idShoppingHistory=" + idShoppingHistory + ", client=" + client + '}';
    }

   

    
    
    
}
