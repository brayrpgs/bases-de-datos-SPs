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
    private int idClient;

    public ShoppingHistory(int idShoppingHistory, int idClient) {
        this.idShoppingHistory = idShoppingHistory;
        this.idClient = idClient;
    }

    public ShoppingHistory() {
    }

    public int getIdShoppingHistory() {
        return idShoppingHistory;
    }

    public void setIdShoppingHistory(int idShoppingHistory) {
        this.idShoppingHistory = idShoppingHistory;
    }

    public int getIdClient() {
        return idClient;
    }

    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    @Override
    public String toString() {
        return "ShoppingHistory{" + "idShoppingHistory=" + idShoppingHistory + ", idClient=" + idClient + '}';
    }
    
    
}
