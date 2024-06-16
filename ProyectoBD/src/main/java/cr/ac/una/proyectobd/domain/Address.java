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
    private Province province;

    public Address(int idAddress, String street, Province province) {
        this.idAddress = idAddress;
        this.street = street;
        this.province = province;
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

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }

    @Override
    public String toString() {
        return "Address{" + "idAddress=" + idAddress + ", street=" + street + ", province=" + province + '}';
    }

    

    
}
