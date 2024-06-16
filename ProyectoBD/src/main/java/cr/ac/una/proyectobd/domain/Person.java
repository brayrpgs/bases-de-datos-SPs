/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasar Calvo
 */
public class Person {
    private int idPerson;
    private String name;
    private String lastName;
    private String secondLastName;
    private int idAddress;

    public Person() {
    }

    public Person(int idPerson, String name, String lastName, String secondLastName, int idAddress) {
        this.idPerson = idPerson;
        this.name = name;
        this.lastName = lastName;
        this.secondLastName = secondLastName;
        this.idAddress = idAddress;
    }

    public int getIdPerson() {
        return idPerson;
    }

    public void setIdPerson(int idPerson) {
        this.idPerson = idPerson;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getSecondLastName() {
        return secondLastName;
    }

    public void setSecondLastName(String secondLastName) {
        this.secondLastName = secondLastName;
    }

    public int getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(int idAddress) {
        this.idAddress = idAddress;
    }

    @Override
    public String toString() {
        return "Person{" + "idPerson=" + idPerson + ", name=" + name + ", lastName=" + lastName + ", secondLastName=" + secondLastName + ", idAddress=" + idAddress + '}';
    }
    
    
}
