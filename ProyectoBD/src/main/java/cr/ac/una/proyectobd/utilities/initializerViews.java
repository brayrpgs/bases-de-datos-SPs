/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cr.ac.una.proyectobd.utilities;

import cr.ac.una.proyectobd.presentation.product.viewListProduct;
import cr.ac.una.proyectobd.presentation.product.viewRegisterProduct;
import cr.ac.una.proyectobd.presentation.security.Login;
import cr.ac.una.proyectobd.presentation.viewMain;
import javax.swing.JOptionPane;

/**
 *
 * @author Daniel Briones
 */
public class initializerViews {
    
    public static void createViewLogin(){
        Login log = new Login();
        log.setVisible(true);
        log.setLocationRelativeTo(null);
    }
    
    public static void createViewMain(){
        viewMain view = new viewMain();
        view.setVisible(true);
        view.setLocationRelativeTo(null); 
    }
    
    public static void createViewRegisterProduct(){
        viewRegisterProduct view = new viewRegisterProduct();
        view.setVisible(true);
        view.setLocationRelativeTo(null);
    }
    
    public static void createViewListProduct(){
        viewListProduct view = new viewListProduct();
        view.setVisible(true);
        view.setLocationRelativeTo(null);
    }
    
    public static void createViewUpdateProduct(){
        JOptionPane.showMessageDialog(null, "Seleccione el producto a editar");
        createViewListProduct();
    }
    
    public static void createViewDeleteProduct(){
        JOptionPane.showMessageDialog(null, "Seleccione el producto a eliminar");
        createViewListProduct();
    }
}
