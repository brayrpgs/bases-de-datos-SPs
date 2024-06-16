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
    private int idSupplier;

    public MethodSend(int idMethodSend, String nameMethod, int idSupplier) {
        this.idMethodSend = idMethodSend;
        this.nameMethod = nameMethod;
        this.idSupplier = idSupplier;
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

    public int getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(int idSupplier) {
        this.idSupplier = idSupplier;
    }

    @Override
    public String toString() {
        return "MethodSend{" + "idMethodSend=" + idMethodSend + ", nameMethod=" + nameMethod + ", idSupplier=" + idSupplier + '}';
    }
   
    
}
