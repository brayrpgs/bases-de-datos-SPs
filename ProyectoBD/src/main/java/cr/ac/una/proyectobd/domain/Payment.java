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
public class Payment {
    private int idPayment;
    private int idOrder;
    private Date paymentDate;
    private Double amount;
    private String paymentStatus;
    private int idPaymentMethod;

    public Payment(int idPayment, int idOrder, Date paymentDate, Double amount, String paymentStatus, int idPaymentMethod) {
        this.idPayment = idPayment;
        this.idOrder = idOrder;
        this.paymentDate = paymentDate;
        this.amount = amount;
        this.paymentStatus = paymentStatus;
        this.idPaymentMethod = idPaymentMethod;
    }

    public Payment() {
    }

    public int getIdPayment() {
        return idPayment;
    }

    public void setIdPayment(int idPayment) {
        this.idPayment = idPayment;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public int getIdPaymentMethod() {
        return idPaymentMethod;
    }

    public void setIdPaymentMethod(int idPaymentMethod) {
        this.idPaymentMethod = idPaymentMethod;
    }

    @Override
    public String toString() {
        return "Payment{" + "idPayment=" + idPayment + ", idOrder=" + idOrder + ", paymentDate=" + paymentDate + ", amount=" + amount + ", paymentStatus=" + paymentStatus + ", idPaymentMethod=" + idPaymentMethod + '}';
    }
    
    
}
