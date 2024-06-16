/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class Phone {
    
    private int idPhone;
    private String phone;
    private Person person;

    public Phone(int idPhone, String phone, Person person) {
        this.idPhone = idPhone;
        this.phone = phone;
        this.person = person;
    }

    

    public Phone() {
    }

    public int getIdPhone() {
        return idPhone;
    }

    public void setIdPhone(int idPhone) {
        this.idPhone = idPhone;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    @Override
    public String toString() {
        return "Phone{" + "idPhone=" + idPhone + ", phone=" + phone + ", person=" + person + '}';
    }

   

    
    
    
}
