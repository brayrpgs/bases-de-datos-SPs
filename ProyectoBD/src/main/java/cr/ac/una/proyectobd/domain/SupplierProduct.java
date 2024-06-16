/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 *  @author Ceasar Calvo
 */
public class SupplierProduct {
    private int idSupplier;
    private String supplierCode;
    private String supplierName;

    public SupplierProduct() {
    }

    public SupplierProduct(int idSupplier, String supplierCode, String supplierName) {
        this.idSupplier = idSupplier;
        this.supplierCode = supplierCode;
        this.supplierName = supplierName;
    }

    public int getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(int idSupplier) {
        this.idSupplier = idSupplier;
    }

    public String getSupplierCode() {
        return supplierCode;
    }

    public void setSupplierCode(String supplierCode) {
        this.supplierCode = supplierCode;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    @Override
    public String toString() {
        return "Supplier{" + "idSupplier=" + idSupplier + ", supplierCode=" + supplierCode + ", supplierName=" + supplierName + '}';
    }
}
