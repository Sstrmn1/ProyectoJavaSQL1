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
        mnuAcceso = new javax.swing.JMenu();
        mnuiRoles = new javax.swing.JMenuItem();
        mnuiUsuarios = new javax.swing.JMenuItem();
        mnuOrdenVenta = new javax.swing.JMenu();
        mnuiOrdenVenta = new javax.swing.JMenuItem();
        jMenu1 = new javax.swing.JMenu();
        mnuiArticulos = new javax.swing.JMenuItem();
        mnuiLotes = new javax.swing.JMenuItem();
        mnuiLaboratorios = new javax.swing.JMenuItem();
        mnuiFFarmaceuticas = new javax.swing.JMenuItem();
        mnuClientes = new javax.swing.JMenu();
        mnuiRegCliente = new javax.swing.JMenuItem();
        mnuiSucursales = new javax.swing.JMenuItem();
        mnuiDistritos = new javax.swing.JMenuItem();
        mnuiConsultas = new javax.swing.JMenu();
        mnuiKardex = new javax.swing.JMenuItem();
        mnuiInventario = new javax.swing.JMenuItem();
        mnuSalir = new javax.swing.JMenu();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Sisterma administrativo Genolab");

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

        mnuOrdenVenta.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Shopping cart.png"))); // NOI18N
        mnuOrdenVenta.setMnemonic('e');
        mnuOrdenVenta.setText("Ordenes de venta");

        mnuiOrdenVenta.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Notes.png"))); // NOI18N
        mnuiOrdenVenta.setMnemonic('y');
        mnuiOrdenVenta.setText("Orden de venta");
        mnuOrdenVenta.add(mnuiOrdenVenta);

        menuBar.add(mnuOrdenVenta);

        jMenu1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/snake_cup-024.png"))); // NOI18N
        jMenu1.setText("Productos");

        mnuiArticulos.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/pill-024.png"))); // NOI18N
        mnuiArticulos.setText("Articulos");
        jMenu1.add(mnuiArticulos);

        mnuiLotes.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/132342_box_box.png"))); // NOI18N
        mnuiLotes.setText("Lotes");
        jMenu1.add(mnuiLotes);

        mnuiLaboratorios.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/132186_industry_industry.png"))); // NOI18N
        mnuiLaboratorios.setText("Laboratorios");
        jMenu1.add(mnuiLaboratorios);

        mnuiFFarmaceuticas.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Retort.png"))); // NOI18N
        mnuiFFarmaceuticas.setText("Formas Farmaceuticas");
        jMenu1.add(mnuiFFarmaceuticas);

        menuBar.add(jMenu1);

        mnuClientes.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/User group.png"))); // NOI18N
        mnuClientes.setText("Clientes");

        mnuiRegCliente.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Picture.png"))); // NOI18N
        mnuiRegCliente.setText("Registrar");
        mnuClientes.add(mnuiRegCliente);

        mnuiSucursales.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/132240_home_home.png"))); // NOI18N
        mnuiSucursales.setText("Sucursales");
        mnuClientes.add(mnuiSucursales);

        mnuiDistritos.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Earth.png"))); // NOI18N
        mnuiDistritos.setText("Distritos");
        mnuClientes.add(mnuiDistritos);

        menuBar.add(mnuClientes);

        mnuiConsultas.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/Table.png"))); // NOI18N
        mnuiConsultas.setText("Consultas");

        mnuiKardex.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/132237_card_card_file_file.png"))); // NOI18N
        mnuiKardex.setText("Kardex");
        mnuiConsultas.add(mnuiKardex);

        mnuiInventario.setIcon(new javax.swing.ImageIcon(getClass().getResource("/presentacion/imagenes/132332_clipboard_clipboard.png"))); // NOI18N
        mnuiInventario.setText("Inventario");
        mnuiInventario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mnuiInventarioActionPerformed(evt);
            }
        });
        mnuiConsultas.add(mnuiInventario);

        menuBar.add(mnuiConsultas);

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

    private void mnuiInventarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_mnuiInventarioActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_mnuiInventarioActionPerformed
    
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
    private javax.swing.JDesktopPane escritorio;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenuBar menuBar;
    private javax.swing.JMenu mnuAcceso;
    private javax.swing.JMenu mnuClientes;
    private javax.swing.JMenu mnuInicio;
    private javax.swing.JMenu mnuOrdenVenta;
    private javax.swing.JMenu mnuSalir;
    private javax.swing.JMenuItem mnuiArticulos;
    private javax.swing.JMenu mnuiConsultas;
    private javax.swing.JMenuItem mnuiDistritos;
    private javax.swing.JMenuItem mnuiFFarmaceuticas;
    private javax.swing.JMenuItem mnuiInventario;
    private javax.swing.JMenuItem mnuiKardex;
    private javax.swing.JMenuItem mnuiLaboratorios;
    private javax.swing.JMenuItem mnuiLotes;
    private javax.swing.JMenuItem mnuiOrdenVenta;
    private javax.swing.JMenuItem mnuiRegCliente;
    private javax.swing.JMenuItem mnuiRoles;
    private javax.swing.JMenuItem mnuiSalir;
    private javax.swing.JMenuItem mnuiSucursales;
    private javax.swing.JMenuItem mnuiUsuarios;
    // End of variables declaration//GEN-END:variables

}
