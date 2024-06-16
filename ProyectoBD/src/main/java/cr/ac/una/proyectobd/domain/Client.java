/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class Client extends Person {
    private int idClient;

    public Client() {
    }

    public Client(int idClient) {
        this.idClient = idClient;
    }

    public Client(int idClient, int idPerson, String name, String lastName, String secondLastName, Address address) {
        super(idPerson, name, lastName, secondLastName, address);
        this.idClient = idClient;
    }

  

    public int getIdClient() {
        return idClient;
    }

    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    @Override
    public String toString() {
        return "Client{" + "idClient=" + idClient + '}';
    }

    
    
    
}
