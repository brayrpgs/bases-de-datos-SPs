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
    private Order order;
    private Date paymentDate;
    private Double amount;
    private String paymentStatus;
    private PaymentMethod paymentMethod;

    public Payment(int idPayment, Order order, Date paymentDate, Double amount, String paymentStatus, PaymentMethod paymentMethod) {
        this.idPayment = idPayment;
        this.order = order;
        this.paymentDate = paymentDate;
        this.amount = amount;
        this.paymentStatus = paymentStatus;
        this.paymentMethod = paymentMethod;
    }

    

    public Payment() {
    }

    public int getIdPayment() {
        return idPayment;
    }

    public void setIdPayment(int idPayment) {
        this.idPayment = idPayment;
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

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    @Override
    public String toString() {
        return "Payment{" + "idPayment=" + idPayment + ", order=" + order + ", paymentDate=" + paymentDate + ", amount=" + amount + ", paymentStatus=" + paymentStatus + ", paymentMethod=" + paymentMethod + '}';
    }
    
    
    
    
}
