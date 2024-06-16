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
public class PaymentTransaccion {
    private int idPaymentTransaccion;
    private int idPayment;
    private Date transaccionDate;
    private Double transaccionAmount;
    private String transaccionStatus;

    public PaymentTransaccion(int idPaymentTransaccion, int idPayment, Date transaccionDate, Double transaccionAmount, String transaccionStatus) {
        this.idPaymentTransaccion = idPaymentTransaccion;
        this.idPayment = idPayment;
        this.transaccionDate = transaccionDate;
        this.transaccionAmount = transaccionAmount;
        this.transaccionStatus = transaccionStatus;
    }

    public PaymentTransaccion() {
    }

    public int getIdPaymentTransaccion() {
        return idPaymentTransaccion;
    }

    public void setIdPaymentTransaccion(int idPaymentTransaccion) {
        this.idPaymentTransaccion = idPaymentTransaccion;
    }

    public int getIdPayment() {
        return idPayment;
    }

    public void setIdPayment(int idPayment) {
        this.idPayment = idPayment;
    }

    public Date getTransaccionDate() {
        return transaccionDate;
    }

    public void setTransaccionDate(Date transaccionDate) {
        this.transaccionDate = transaccionDate;
    }

    public Double getTransaccionAmount() {
        return transaccionAmount;
    }

    public void setTransaccionAmount(Double transaccionAmount) {
        this.transaccionAmount = transaccionAmount;
    }

    public String getTransaccionStatus() {
        return transaccionStatus;
    }

    public void setTransaccionStatus(String transaccionStatus) {
        this.transaccionStatus = transaccionStatus;
    }

    @Override
    public String toString() {
        return "PaymentTransaccion{" + "idPaymentTransaccion=" + idPaymentTransaccion + ", idPayment=" + idPayment + ", transaccionDate=" + transaccionDate + ", transaccionAmount=" + transaccionAmount + ", transaccionStatus=" + transaccionStatus + '}';
    }
    
    
}
