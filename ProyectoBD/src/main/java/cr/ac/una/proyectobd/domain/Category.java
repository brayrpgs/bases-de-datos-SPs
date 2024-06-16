/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 * @author Ceasa
 */
public class Category {
    private int idCategory;
    private String codeCategory;
    private String categoryName;

    public Category(int idCategory, String codeCategory, String categoryName) {
        this.idCategory = idCategory;
        this.codeCategory = codeCategory;
        this.categoryName = categoryName;
    }

    public Category() {
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getCodeCategory() {
        return codeCategory;
    }

    public void setCodeCategory(String codeCategory) {
        this.codeCategory = codeCategory;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "Category{" + "idCategory=" + idCategory + ", codeCategory=" + codeCategory + ", categoryName=" + categoryName + '}';
    }
    
    
}
