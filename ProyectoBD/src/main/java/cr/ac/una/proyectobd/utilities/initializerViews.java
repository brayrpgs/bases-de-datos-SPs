
package cr.ac.una.proyectobd.utilities;

import cr.ac.una.proyectobd.domain.Product;
import cr.ac.una.proyectobd.presentation.product.viewEditProduct;
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
    
    public static void createViewUpdateProduct(Product p){
        
        if(p == null){
            JOptionPane.showMessageDialog(null, "Seleccione el producto a editar");
            createViewListProduct();
        } else {
            viewEditProduct view = new viewEditProduct(p);
            view.setVisible(true);
            view.setLocationRelativeTo(null);
        }
    }
    
    public static void createViewDeleteProduct(){
        JOptionPane.showMessageDialog(null, "Seleccione el producto a eliminar");
        createViewListProduct();
    }
}
