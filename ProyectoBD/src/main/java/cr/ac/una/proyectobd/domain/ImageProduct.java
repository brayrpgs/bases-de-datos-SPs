/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.domain;

/**
 *
 *@author Ceasar Calvo
 */
public class ImageProduct {
    private int idImage;
    private int idProduct;
    private String imageName;
    private byte[] productImage;

    public ImageProduct(int idImage, int idProduct, String imageName, byte[] productImage) {
        this.idImage = idImage;
        this.idProduct = idProduct;
        this.imageName = imageName;
        this.productImage = productImage;
    }

    public ImageProduct() {
    }

    public int getIdImage() {
        return idImage;
    }

    public void setIdImage(int idImage) {
        this.idImage = idImage;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public byte[] getProductImage() {
        return productImage;
    }

    public void setProductImage(byte[] productImage) {
        this.productImage = productImage;
    }

    @Override
    public String toString() {
        return "ImageProduct{" + "idImage=" + idImage + ", idProduct=" + idProduct + ", imageName=" + imageName + ", productImage=" + productImage + '}';
    }
    
}
