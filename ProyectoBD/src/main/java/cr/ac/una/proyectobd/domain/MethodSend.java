/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class MethodSend {
    private int idMethodSend;
    private String nameMethod;
    private Supplier supplier;

    public MethodSend(int idMethodSend, String nameMethod, Supplier supplier) {
        this.idMethodSend = idMethodSend;
        this.nameMethod = nameMethod;
        this.supplier = supplier;
    }


    public MethodSend() {
    }

    public int getIdMethodSend() {
        return idMethodSend;
    }

    public void setIdMethodSend(int idMethodSend) {
        this.idMethodSend = idMethodSend;
    }

    public String getNameMethod() {
        return nameMethod;
    }

    public void setNameMethod(String nameMethod) {
        this.nameMethod = nameMethod;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    @Override
    public String toString() {
        return "MethodSend{" + "idMethodSend=" + idMethodSend + ", nameMethod=" + nameMethod + ", supplier=" + supplier + '}';
    }

   

   
    
}
