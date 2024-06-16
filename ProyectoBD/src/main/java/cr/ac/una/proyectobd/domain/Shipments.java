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
    private int idSupplier;
    private Double priceFinal;
    private Date dateSend;
    private Date dateArrival;
    private Date elapsed;
    private int idAddress;

    public Shipments(int idShipments, int idSupplier, Double priceFinal, Date dateSend, Date dateArrival, Date elapsed, int idAddress) {
        this.idShipments = idShipments;
        this.idSupplier = idSupplier;
        this.priceFinal = priceFinal;
        this.dateSend = dateSend;
        this.dateArrival = dateArrival;
        this.elapsed = elapsed;
        this.idAddress = idAddress;
    }

    public Shipments() {
    }

    public int getIdShipments() {
        return idShipments;
    }

    public void setIdShipments(int idShipments) {
        this.idShipments = idShipments;
    }

    public int getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(int idSupplier) {
        this.idSupplier = idSupplier;
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

    public int getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(int idAddress) {
        this.idAddress = idAddress;
    }

    @Override
    public String toString() {
        return "Shipments{" + "idShipments=" + idShipments + ", idSupplier=" + idSupplier + ", priceFinal=" + priceFinal + ", dateSend=" + dateSend + ", dateArrival=" + dateArrival + ", elapsed=" + elapsed + ", idAddress=" + idAddress + '}';
    }
    
    
}
