/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

import java.sql.Date;

/**
 *
 * @author Ceasa
 */
public class Shipments {
    private int idShipments;
    private Supplier supplier;
    private Double priceFinal;
    private Date dateSend;
    private Date dateArrival;
    private Date elapsed;
    private Address address;

    public Shipments(int idShipments, Supplier supplier, Double priceFinal, Date dateSend, Date dateArrival, Date elapsed, Address address) {
        this.idShipments = idShipments;
        this.supplier = supplier;
        this.priceFinal = priceFinal;
        this.dateSend = dateSend;
        this.dateArrival = dateArrival;
        this.elapsed = elapsed;
        this.address = address;
    }



   

    public Shipments() {
    }

    public int getIdShipments() {
        return idShipments;
    }

    public void setIdShipments(int idShipments) {
        this.idShipments = idShipments;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }



    public Double getPriceFinal() {
        return priceFinal;
    }

    public void setPriceFinal(Double priceFinal) {
        this.priceFinal = priceFinal;
    }

    public Date getDateSend() {
        return dateSend;
    }

    public void setDateSend(Date dateSend) {
        this.dateSend = dateSend;
    }

    public Date getDateArrival() {
        return dateArrival;
    }

    public void setDateArrival(Date dateArrival) {
        this.dateArrival = dateArrival;
    }

    public Date getElapsed() {
        return elapsed;
    }

    public void setElapsed(Date elapsed) {
        this.elapsed = elapsed;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Shipments{" + "idShipments=" + idShipments + ", supplier=" + supplier + ", priceFinal=" + priceFinal + ", dateSend=" + dateSend + ", dateArrival=" + dateArrival + ", elapsed=" + elapsed + ", address=" + address + '}';
    }

 
    
    
    
}
