/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class PaymentRejected {
    private int idPaymentRejected;
    private int idPayment;

    public PaymentRejected() {
    }

    public PaymentRejected(int idPaymentRejected, int idPayment) {
        this.idPaymentRejected = idPaymentRejected;
        this.idPayment = idPayment;
    }

    public int getIdPaymentRejected() {
        return idPaymentRejected;
    }

    public void setIdPaymentRejected(int idPaymentRejected) {
        this.idPaymentRejected = idPaymentRejected;
    }

    public int getIdPayment() {
        return idPayment;
    }

    public void setIdPayment(int idPayment) {
        this.idPayment = idPayment;
    }

    @Override
    public String toString() {
        return "PaymentRejected{" + "idPaymentRejected=" + idPaymentRejected + ", idPayment=" + idPayment + '}';
    }
    
    
}
