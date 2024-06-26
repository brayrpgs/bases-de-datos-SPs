/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package cr.ac.una.proyectobd.presentation;

import cr.ac.una.proyectobd.presentation.cliente.viewCliente;
import cr.ac.una.proyectobd.presentation.shoppingCart.viewProductSale;
import cr.ac.una.proyectobd.presentation.shoppingCart.viewShipping;
import cr.ac.una.proyectobd.utilities.initializerViews;

/**
 *
 * @author Daniel Briones
 */
public class viewMain extends javax.swing.JFrame {

    /**
     * Creates new form viewMain
     */
    public viewMain() {
        initComponents();
        setExtendedState(this.MAXIMIZED_BOTH);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jMenuItem1 = new javax.swing.JMenuItem();
        jDesktopPane1 = new javax.swing.JDesktopPane();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jSeparator1 = new javax.swing.JPopupMenu.Separator();
        jSeparator2 = new javax.swing.JPopupMenu.Separator();
        jmenuItemClientes = new javax.swing.JMenuItem();
        muIProduct = new javax.swing.JMenu();
        miNewProduct = new javax.swing.JMenuItem();
        miGetProduct = new javax.swing.JMenuItem();
        miUpdateProduct = new javax.swing.JMenuItem();
        miDeleteProduct = new javax.swing.JMenuItem();
        jMenuItemEnvios = new javax.swing.JMenuItem();
        jSeparator3 = new javax.swing.JPopupMenu.Separator();
        miExit = new javax.swing.JMenuItem();
        miMyAccount = new javax.swing.JMenu();
        miLogOut = new javax.swing.JMenuItem();
        miHelp = new javax.swing.JMenu();
        muMyCar = new javax.swing.JMenu();
        jMenuItem5 = new javax.swing.JMenuItem();

        jMenuItem1.setText("jMenuItem1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Principal");
        getContentPane().setLayout(new javax.swing.BoxLayout(getContentPane(), javax.swing.BoxLayout.LINE_AXIS));

        javax.swing.GroupLayout jDesktopPane1Layout = new javax.swing.GroupLayout(jDesktopPane1);
        jDesktopPane1.setLayout(jDesktopPane1Layout);
        jDesktopPane1Layout.setHorizontalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 738, Short.MAX_VALUE)
        );
        jDesktopPane1Layout.setVerticalGroup(
            jDesktopPane1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 265, Short.MAX_VALUE)
        );

        getContentPane().add(jDesktopPane1);

        jMenu1.setText("Archivo");
        jMenu1.add(jSeparator1);
        jMenu1.add(jSeparator2);

        jmenuItemClientes.setText("Clientes");
        jmenuItemClientes.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jmenuItemClientesActionPerformed(evt);
            }
        });
        jMenu1.add(jmenuItemClientes);

        muIProduct.setText("Productos");

        miNewProduct.setText("Registrar producto");
        miNewProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miNewProductActionPerformed(evt);
            }
        });
        muIProduct.add(miNewProduct);

        miGetProduct.setText("Listar productos");
        miGetProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miGetProductActionPerformed(evt);
            }
        });
        muIProduct.add(miGetProduct);

        miUpdateProduct.setText("Actualizar producto");
        miUpdateProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miUpdateProductActionPerformed(evt);
            }
        });
        muIProduct.add(miUpdateProduct);

        miDeleteProduct.setText("Eliminar producto");
        miDeleteProduct.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miDeleteProductActionPerformed(evt);
            }
        });
        muIProduct.add(miDeleteProduct);

        jMenu1.add(muIProduct);

        jMenuItemEnvios.setText("Envios");
        jMenuItemEnvios.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItemEnviosActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItemEnvios);
        jMenu1.add(jSeparator3);

        miExit.setText("Salir");
        miExit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miExitActionPerformed(evt);
            }
        });
        jMenu1.add(miExit);

        jMenuBar1.add(jMenu1);

        miMyAccount.setText("Mi cuenta");

        miLogOut.setText("Cerrar sesión");
        miLogOut.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                miLogOutActionPerformed(evt);
            }
        });
        miMyAccount.add(miLogOut);

        jMenuBar1.add(miMyAccount);

        miHelp.setText("Ayuda");
        jMenuBar1.add(miHelp);

        muMyCar.setText("Carrito");

        jMenuItem5.setText("Agregar productos");
        jMenuItem5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuItem5ActionPerformed(evt);
            }
        });
        muMyCar.add(jMenuItem5);

        jMenuBar1.add(muMyCar);

        setJMenuBar(jMenuBar1);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void miGetProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miGetProductActionPerformed
        initializerViews.createViewListProduct();
    }//GEN-LAST:event_miGetProductActionPerformed

    private void miExitActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miExitActionPerformed
        dispose();
        System.exit(0);
    }//GEN-LAST:event_miExitActionPerformed

    private void miNewProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miNewProductActionPerformed
        initializerViews.createViewRegisterProduct();
    }//GEN-LAST:event_miNewProductActionPerformed

    private void miLogOutActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miLogOutActionPerformed
        dispose();
        initializerViews.createViewLogin();
    }//GEN-LAST:event_miLogOutActionPerformed

    private void miUpdateProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miUpdateProductActionPerformed
        initializerViews.createViewUpdateProduct(null);
    }//GEN-LAST:event_miUpdateProductActionPerformed

    private void miDeleteProductActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_miDeleteProductActionPerformed
//       initializerViews.createViewDeleteProduct();
       
        viewCliente form = new viewCliente();
        jDesktopPane1.add(form);
        form.setVisible(true);
    }//GEN-LAST:event_miDeleteProductActionPerformed

    private void jmenuItemClientesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jmenuItemClientesActionPerformed
        // TODO add your handling code here:
        viewCliente form = new viewCliente();
        jDesktopPane1.add(form);
        form.setVisible(true);
    }//GEN-LAST:event_jmenuItemClientesActionPerformed

    private void jMenuItem5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItem5ActionPerformed
        // TODO add your handling code here:
        
        viewProductSale form = new viewProductSale();
//        form.setSize(getSize());
        jDesktopPane1.add(form);
        form.setVisible(true);
    }//GEN-LAST:event_jMenuItem5ActionPerformed

    private void jMenuItemEnviosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuItemEnviosActionPerformed
        // TODO add your handling code here:
        viewShipping form = new viewShipping();
        jDesktopPane1.add(form);
        form.setVisible(true);
    }//GEN-LAST:event_jMenuItemEnviosActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JDesktopPane jDesktopPane1;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem5;
    private javax.swing.JMenuItem jMenuItemEnvios;
    private javax.swing.JPopupMenu.Separator jSeparator1;
    private javax.swing.JPopupMenu.Separator jSeparator2;
    private javax.swing.JPopupMenu.Separator jSeparator3;
    private javax.swing.JMenuItem jmenuItemClientes;
    private javax.swing.JMenuItem miDeleteProduct;
    private javax.swing.JMenuItem miExit;
    private javax.swing.JMenuItem miGetProduct;
    private javax.swing.JMenu miHelp;
    private javax.swing.JMenuItem miLogOut;
    private javax.swing.JMenu miMyAccount;
    private javax.swing.JMenuItem miNewProduct;
    private javax.swing.JMenuItem miUpdateProduct;
    private javax.swing.JMenu muIProduct;
    private javax.swing.JMenu muMyCar;
    // End of variables declaration//GEN-END:variables
}
