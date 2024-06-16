/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package cr.ac.una.proyectobd.domain;
/**
 *
 * @author Ceasar Calvo
 */
public class Address {
    private int idAddress;
    private String street;
    private int idProvince;

    public Address(int idAddress, String street, int idProvince) {
        this.idAddress = idAddress;
        this.street = street;
        this.idProvince = idProvince;
    }

    public Address() {
    }

    public int getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(int idAddress) {
        this.idAddress = idAddress;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public int getIdProvince() {
        return idProvince;
    }

    public void setIdProvince(int idProvince) {
        this.idProvince = idProvince;
    }

    @Override
    public String toString() {
        return "Address{" + "idAddress=" + idAddress + ", street=" + street + ", idProvince=" + idProvince + '}';
    }
    
    
}
