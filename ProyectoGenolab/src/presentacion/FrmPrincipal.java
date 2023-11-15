package presentacion;

public class FrmPrincipal extends javax.swing.JFrame {
    
    public FrmPrincipal() {
        initComponents();
        setExtendedState(MAXIMIZED_BOTH);
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        escritorio = new javax.swing.JDesktopPane();
        menuBar = new javax.swing.JMenuBar();
        mnuInicio = new javax.swing.JMenu();
        mnuiSalir = new javax.swing.JMenuItem();
        mnuOrdenVenta = new javax.swing.JMenu();
        cutMenuItem = new javax.swing.JMenuItem();
        mnuiOrdenVenta = new javax.swing.JMenuItem();
        mnuAcceso = new javax.swing.JMenu();
        mnuiRoles = new javax.swing.JMenuItem();
        mnuiUsuarios = new javax.swing.JMenuItem();
        mnuConsultas = new javax.swing.JMenu();
        mnuiConsultasOrdenes = new javax.swing.JMenuItem();
        mnuSalir = new javax.swing.JMenu();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Sisterma administrativo Genolab");
        setPreferredSize(new java.awt.Dimension(1100, 700));

        mnuInicio.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Home.png"))); // NOI18N
        mnuInicio.setMnemonic('f');
        mnuInicio.setText("Inicio");

        mnuiSalir.setAccelerator(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_W, java.awt.event.InputEvent.CTRL_DOWN_MASK));
        mnuiSalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Exit.png"))); // NOI18N
        mnuiSalir.setMnemonic('x');
        mnuiSalir.setText("Salir");
        mnuiSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mnuiSalirActionPerformed(evt);
            }
        });
        mnuInicio.add(mnuiSalir);

        menuBar.add(mnuInicio);

        mnuOrdenVenta.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Shopping cart.png"))); // NOI18N
        mnuOrdenVenta.setMnemonic('e');
        mnuOrdenVenta.setText("Ordenes de venta");

        cutMenuItem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/User group.png"))); // NOI18N
        cutMenuItem.setMnemonic('t');
        cutMenuItem.setText("Clientes");
        mnuOrdenVenta.add(cutMenuItem);

        mnuiOrdenVenta.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Notes.png"))); // NOI18N
        mnuiOrdenVenta.setMnemonic('y');
        mnuiOrdenVenta.setText("Orden de venta");
        mnuOrdenVenta.add(mnuiOrdenVenta);

        menuBar.add(mnuOrdenVenta);

        mnuAcceso.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Lock.png"))); // NOI18N
        mnuAcceso.setMnemonic('h');
        mnuAcceso.setText("Acceso");

        mnuiRoles.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Company.png"))); // NOI18N
        mnuiRoles.setMnemonic('c');
        mnuiRoles.setText("Roles");
        mnuiRoles.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mnuiRolesActionPerformed(evt);
            }
        });
        mnuAcceso.add(mnuiRoles);

        mnuiUsuarios.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/People.png"))); // NOI18N
        mnuiUsuarios.setMnemonic('a');
        mnuiUsuarios.setText("Usuarios");
        mnuAcceso.add(mnuiUsuarios);

        menuBar.add(mnuAcceso);

        mnuConsultas.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Table.png"))); // NOI18N
        mnuConsultas.setText("Consultas");

        mnuiConsultasOrdenes.setText("Consultas ordenes");
        mnuConsultas.add(mnuiConsultasOrdenes);

        menuBar.add(mnuConsultas);

        mnuSalir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Exit.png"))); // NOI18N
        mnuSalir.setText("Salir");
        mnuSalir.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                mnuSalirMouseClicked(evt);
            }
        });
        mnuSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mnuSalirActionPerformed(evt);
            }
        });
        menuBar.add(mnuSalir);

        setJMenuBar(menuBar);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(escritorio)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(escritorio, javax.swing.GroupLayout.DEFAULT_SIZE, 0, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void mnuiSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mnuiSalirActionPerformed
        System.exit(0);
    }//GEN-LAST:event_mnuiSalirActionPerformed

    private void mnuiRolesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mnuiRolesActionPerformed
        FrmiRol frm = new FrmiRol();
        escritorio.add(frm);
        frm.setVisible(true);
    }//GEN-LAST:event_mnuiRolesActionPerformed

    private void mnuSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mnuSalirActionPerformed
        System.exit(0);        // TODO add your handling code here:
    }//GEN-LAST:event_mnuSalirActionPerformed

    private void mnuSalirMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_mnuSalirMouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_mnuSalirMouseClicked
    
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmPrincipal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmPrincipal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenuItem cutMenuItem;
    private javax.swing.JDesktopPane escritorio;
    private javax.swing.JMenuBar menuBar;
    private javax.swing.JMenu mnuAcceso;
    private javax.swing.JMenu mnuConsultas;
    private javax.swing.JMenu mnuInicio;
    private javax.swing.JMenu mnuOrdenVenta;
    private javax.swing.JMenu mnuSalir;
    private javax.swing.JMenuItem mnuiConsultasOrdenes;
    private javax.swing.JMenuItem mnuiOrdenVenta;
    private javax.swing.JMenuItem mnuiRoles;
    private javax.swing.JMenuItem mnuiSalir;
    private javax.swing.JMenuItem mnuiUsuarios;
    // End of variables declaration//GEN-END:variables

}
