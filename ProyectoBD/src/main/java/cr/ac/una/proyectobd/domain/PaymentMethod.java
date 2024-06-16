/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class PaymentMethod {
    private int idPaymentMethod;
    private String paymentMethodName;

    public PaymentMethod() {
    }

    public PaymentMethod(int idPaymentMethod, String paymentMethodName) {
        this.idPaymentMethod = idPaymentMethod;
        this.paymentMethodName = paymentMethodName;
    }

    public int getIdPaymentMethod() {
        return idPaymentMethod;
    }

    public void setIdPaymentMethod(int idPaymentMethod) {
        this.idPaymentMethod = idPaymentMethod;
    }

    public String getPaymentMethodName() {
        return paymentMethodName;
    }

    public void setPaymentMethodName(String paymentMethodName) {
        this.paymentMethodName = paymentMethodName;
    }

    @Override
    public String toString() {
        return "PaymentMethod{" + "idPaymentMethod=" + idPaymentMethod + ", paymentMethodName=" + paymentMethodName + '}';
    }
    
    
}
