/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class Supplier extends Person {
    private int idSupplier;
    private String nameSupplier;
    private String informationSupplier;
    private Double priceBase;


    public Supplier(int idSupplier, String nameSupplier, String informationSupplier, Double priceBase, int idPerson, String name, String lastName, String secondLastName, Address address) {
        super(idPerson, name, lastName, secondLastName, address);
        this.idSupplier = idSupplier;
        this.nameSupplier = nameSupplier;
        this.informationSupplier = informationSupplier;
        this.priceBase = priceBase;
    }

    

    public Supplier() {
    }

    public int getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(int idSupplier) {
        this.idSupplier = idSupplier;
    }

    public String getNameSupplier() {
        return nameSupplier;
    }

    public void setNameSupplier(String nameSupplier) {
        this.nameSupplier = nameSupplier;
    }

    public String getInformationSupplier() {
        return informationSupplier;
    }

    public void setInformationSupplier(String informationSupplier) {
        this.informationSupplier = informationSupplier;
    }

    public Double getPriceBase() {
        return priceBase;
    }

    public void setPriceBase(Double priceBase) {
        this.priceBase = priceBase;
    }

    @Override
    public String toString() {
        return "Supplier{" + "idSupplier=" + idSupplier + ", nameSupplier=" + nameSupplier + ", informationSupplier=" + informationSupplier + ", priceBase=" + priceBase + '}';
    }
    
    
    
    
}
