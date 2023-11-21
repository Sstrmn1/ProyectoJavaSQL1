package presentacion;

import javax.swing.JOptionPane;
import javax.swing.table.TableRowSorter;
import negocio.DireccionControl;
import entidades.Cliente;
import entidades.Distrito;

public class FrmDireccion extends javax.swing.JFrame {

    //atributos
    private final DireccionControl CONTROL;

    //constructor
    public FrmDireccion() {
        initComponents();
        this.CONTROL = new DireccionControl();
        this.listado("");
        this.listarCombobox();
        desactivar();
//        cboCliente.setSelectedItem(null);
//        cboDistrito.setSelectedItem(null);
    }

    //metodos
    private void listado(String texto) {
        tblDireccion.setModel(this.CONTROL.listar(texto));
        TableRowSorter orden = new TableRowSorter(tblDireccion.getModel());
        tblDireccion.setRowSorter(orden);
    }
    
    private void listarCombobox() {
        cboCliente.setModel(this.CONTROL.listarClientes());
        cboDistrito.setModel(this.CONTROL.listarDistritos());
    }
    
    private void activar() {
        btnEditar.setEnabled(true);
        btnRegistrar.setEnabled(false);
    }
    
    private void desactivar() {
        btnEditar.setEnabled(false);
        btnRegistrar.setEnabled(true);
    }
    
    private void limpiar() {
        cboCliente.setSelectedItem(null);
        cboDistrito.setSelectedItem(null);
        txtCalle.setText("");
        txtNumeroCalle.setText("");
        txtOficina.setText("");
        rbtnActivo.setSelected(true);
        txtBuscar.setText("");
        cboCliente.requestFocus();
        txtIdDireccion.setText("");
        
        desactivar();
    }
    
    private void mensajeError(String mensaje) {
        JOptionPane.showMessageDialog(this, mensaje, "Sistema", JOptionPane.ERROR_MESSAGE);
    }
    
    private void mensajeInformacion(String mensaje) {
        JOptionPane.showMessageDialog(this, mensaje, "Sistema", JOptionPane.INFORMATION_MESSAGE);
    }
    
    private static int mensajeConfirmacion(String mensaje) {
        return JOptionPane.showConfirmDialog(null, mensaje, "Confirmación", JOptionPane.YES_NO_OPTION);
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        rbtngEstado = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        cboCliente = new javax.swing.JComboBox<>();
        jLabel2 = new javax.swing.JLabel();
        cboDistrito = new javax.swing.JComboBox<>();
        jLabel3 = new javax.swing.JLabel();
        txtCalle = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        txtNumeroCalle = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txtOficina = new javax.swing.JTextField();
        btnRegistrar = new javax.swing.JButton();
        btnLimpiar = new javax.swing.JButton();
        btnEditar = new javax.swing.JButton();
        jLabel7 = new javax.swing.JLabel();
        rbtnActivo = new javax.swing.JRadioButton();
        rbtnInactivo = new javax.swing.JRadioButton();
        jLabel8 = new javax.swing.JLabel();
        txtIdCliente = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        txtIdDireccion = new javax.swing.JTextField();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblDireccion = new javax.swing.JTable();
        jLabel6 = new javax.swing.JLabel();
        txtBuscar = new javax.swing.JTextField();
        jRadioButton3 = new javax.swing.JRadioButton();
        jRadioButton4 = new javax.swing.JRadioButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Registrar direccion de cliente"));

        jLabel1.setText("Nombre de cliente");

        cboCliente.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                cboClienteItemStateChanged(evt);
            }
        });
        cboCliente.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboClienteActionPerformed(evt);
            }
        });

        jLabel2.setText("Distrito");

        cboDistrito.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cboDistritoActionPerformed(evt);
            }
        });

        jLabel3.setText("Calle/Avenida");

        jLabel4.setText("Numero");

        jLabel5.setText("Oficina");

        btnRegistrar.setText("Registrar");
        btnRegistrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRegistrarActionPerformed(evt);
            }
        });

        btnLimpiar.setText("Limpiar");
        btnLimpiar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLimpiarActionPerformed(evt);
            }
        });

        btnEditar.setText("Editar");
        btnEditar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarActionPerformed(evt);
            }
        });

        jLabel7.setText("Estado de direccion");

        rbtngEstado.add(rbtnActivo);
        rbtnActivo.setText("Activo");

        rbtngEstado.add(rbtnInactivo);
        rbtnInactivo.setText("Inactivo");
        rbtnInactivo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                rbtnInactivoActionPerformed(evt);
            }
        });

        jLabel8.setText("Id cliente");

        txtIdCliente.setEnabled(false);

        jLabel9.setText("Id direccion");

        txtIdDireccion.setEnabled(false);
        txtIdDireccion.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtIdDireccionActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(btnRegistrar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnLimpiar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnEditar)
                        .addContainerGap())
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(cboDistrito, javax.swing.GroupLayout.PREFERRED_SIZE, 131, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel7)
                                .addGap(18, 18, 18)
                                .addComponent(rbtnActivo)
                                .addGap(18, 18, 18)
                                .addComponent(rbtnInactivo)
                                .addGap(50, 50, 50)
                                .addComponent(jLabel9)))
                        .addGap(38, 38, 38)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(txtIdDireccion)
                            .addComponent(txtOficina, javax.swing.GroupLayout.DEFAULT_SIZE, 79, Short.MAX_VALUE))
                        .addGap(0, 59, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addComponent(jLabel2))
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(18, 18, 18)
                                .addComponent(cboCliente, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addGap(36, 36, 36))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(57, 57, 57)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel3)
                                    .addComponent(txtCalle, javax.swing.GroupLayout.PREFERRED_SIZE, 127, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(38, 38, 38)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel4)
                                    .addComponent(txtNumeroCalle, javax.swing.GroupLayout.PREFERRED_SIZE, 76, javax.swing.GroupLayout.PREFERRED_SIZE))))
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(10, 10, 10)
                                .addComponent(jLabel5)
                                .addGap(36, 36, 36))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel8)
                                .addGap(18, 18, 18)))
                        .addComponent(txtIdCliente, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(14, 14, 14))))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(cboCliente, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel8)
                    .addComponent(txtIdCliente, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(jLabel3)
                    .addComponent(jLabel4)
                    .addComponent(jLabel5))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cboDistrito, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtCalle, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtNumeroCalle, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtOficina, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(rbtnActivo)
                    .addComponent(rbtnInactivo)
                    .addComponent(jLabel9)
                    .addComponent(txtIdDireccion, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 25, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnRegistrar)
                    .addComponent(btnLimpiar)
                    .addComponent(btnEditar))
                .addContainerGap())
        );

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Direcciones registradas"));

        tblDireccion.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        tblDireccion.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblDireccionMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblDireccion);

        jLabel6.setText("Buscar");

        txtBuscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtBuscarActionPerformed(evt);
            }
        });
        txtBuscar.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txtBuscarKeyReleased(evt);
            }
        });

        jRadioButton3.setText("Cliente");
        jRadioButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jRadioButton3ActionPerformed(evt);
            }
        });

        jRadioButton4.setText("Distrito");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel6)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtBuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 148, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jRadioButton3)
                        .addGap(28, 28, 28)
                        .addComponent(jRadioButton4)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap(8, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(txtBuscar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jRadioButton3)
                    .addComponent(jRadioButton4))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 159, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cboDistritoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboDistritoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cboDistritoActionPerformed

    private void rbtnInactivoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_rbtnInactivoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_rbtnInactivoActionPerformed

    private void cboClienteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cboClienteActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_cboClienteActionPerformed

    private void jRadioButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButton3ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jRadioButton3ActionPerformed

    private void tblDireccionMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblDireccionMouseClicked
        int fila = tblDireccion.getSelectedRow();
        
        String direccionId = String.valueOf(tblDireccion.getValueAt(fila, 0));
        int clienteId = Integer.parseInt(String.valueOf(tblDireccion.getValueAt(fila, 2)));
        String clienteNombre = String.valueOf(tblDireccion.getValueAt(fila, 3));
        int distritoId = Integer.parseInt(String.valueOf(tblDireccion.getValueAt(fila, 1)));
        String distritoNombre = String.valueOf(tblDireccion.getValueAt(fila, 4));
        String calle = String.valueOf(tblDireccion.getValueAt(fila, 5));
        String numeroCalle = String.valueOf(tblDireccion.getValueAt(fila, 6));
        String oficina = String.valueOf(tblDireccion.getValueAt(fila, 7));
        String estado = String.valueOf(tblDireccion.getValueAt(fila, 8));

        //Instanciar nuevos objetos cliente y distrito para determinar
        //el objeto seleccionado en la tabla
        Cliente clienteSeleccionado = new Cliente(clienteId, clienteNombre);
        Distrito distritoSeleccionado = new Distrito(distritoId, distritoNombre);
        
        txtIdDireccion.setText(direccionId);
        cboCliente.setSelectedItem(clienteSeleccionado);
        cboDistrito.setSelectedItem(distritoSeleccionado);
        txtIdCliente.setText(String.valueOf(clienteId));
        txtCalle.setText(calle);
        txtNumeroCalle.setText(numeroCalle);
        txtOficina.setText(oficina);
        
        if (estado.equals("Activo")) {
            rbtnActivo.setSelected(true);
        } else {
            rbtnInactivo.setSelected(true);
        }
        activar();
    }//GEN-LAST:event_tblDireccionMouseClicked

    private void cboClienteItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_cboClienteItemStateChanged
        //Realizar refundicion a las clases cliente y distrito con los objetos seleccionados
        //en los combobox
//        Cliente clienteSeleccionado = (Cliente) cboCliente.getSelectedItem();
//        Distrito distritoSeleccionado = (Distrito) cboDistrito.getSelectedItem();

    }//GEN-LAST:event_cboClienteItemStateChanged

    private void btnLimpiarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLimpiarActionPerformed
        limpiar();          // TODO add your handling code here:
    }//GEN-LAST:event_btnLimpiarActionPerformed

    private void btnRegistrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRegistrarActionPerformed
        String respuesta = "";
        //Realizar refundicion a las clases cliente y distrito con los objetos seleccionados
        //en los combobox para luego capturar las ID cliente, distrito
        Cliente clienteSeleccionado = (Cliente) cboCliente.getSelectedItem();
        Distrito distritoSeleccionado = (Distrito) cboDistrito.getSelectedItem();
        int clienteId = clienteSeleccionado.getIdCliente();
//        String clienteNombre = clienteSeleccionado.getNombre();
        int distritoId = distritoSeleccionado.getIdDistrito();
//        String distritoNombre = distritoSeleccionado.getNombre();
        String calle = txtCalle.getText();
        String numeroCalle = txtNumeroCalle.getText();
        String oficina = txtOficina.getText();
        boolean estado;
        if (rbtnActivo.isSelected()) {
            estado = true;
        } else {
            estado = false;
        }
        
        respuesta = this.CONTROL.insertar(distritoId, clienteId, calle, numeroCalle, oficina, estado);
        if (respuesta.equals("OK")) {
            mensajeInformacion("Registro insertado");
        } else {
            mensajeError("Error insertando el registro");
        }
        limpiar();
        this.listado("");

     }//GEN-LAST:event_btnRegistrarActionPerformed

    private void btnEditarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarActionPerformed
        if (mensajeConfirmacion("Desea editar este registro") == 0) {
            String respuesta = "";
            //Realizar refundicion a las clases cliente y distrito con los objetos seleccionados
            //en los combobox para luego capturar las ID cliente, distrito
            int direccionId = Integer.parseInt(txtIdDireccion.getText());
            Cliente clienteSeleccionado = (Cliente) cboCliente.getSelectedItem();
            Distrito distritoSeleccionado = (Distrito) cboDistrito.getSelectedItem();
            int clienteId = clienteSeleccionado.getIdCliente();
            
            int distritoId = distritoSeleccionado.getIdDistrito();
            String calle = txtCalle.getText();
            String numeroCalle = txtNumeroCalle.getText();
            String oficina = txtOficina.getText();
            boolean estado;
            if (rbtnActivo.isSelected()) {
                estado = true;
            } else {
                estado = false;
            }
            
            respuesta = this.CONTROL.actualizar(direccionId, distritoId, clienteId, calle, numeroCalle, oficina, estado);
            
            if (respuesta.equals("OK")) {
                mensajeInformacion("Registro actualizado");
            } else {
                mensajeError("Error actualizando el registro");
            }
            limpiar();
            this.listado("");
        } else {
            limpiar();
        }
    }//GEN-LAST:event_btnEditarActionPerformed

    private void txtIdDireccionActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtIdDireccionActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtIdDireccionActionPerformed

    private void txtBuscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtBuscarActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtBuscarActionPerformed

    private void txtBuscarKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtBuscarKeyReleased
        this.listado(txtBuscar.getText());        // TODO add your handling code here:
    }//GEN-LAST:event_txtBuscarKeyReleased

    /**
     * @param args the command line arguments
     */
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
            java.util.logging.Logger.getLogger(FrmDireccion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmDireccion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmDireccion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmDireccion.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmDireccion().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnEditar;
    private javax.swing.JButton btnLimpiar;
    private javax.swing.JButton btnRegistrar;
    private javax.swing.JComboBox<String> cboCliente;
    private javax.swing.JComboBox<String> cboDistrito;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JRadioButton jRadioButton3;
    private javax.swing.JRadioButton jRadioButton4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JRadioButton rbtnActivo;
    private javax.swing.JRadioButton rbtnInactivo;
    private javax.swing.ButtonGroup rbtngEstado;
    private javax.swing.JTable tblDireccion;
    private javax.swing.JTextField txtBuscar;
    private javax.swing.JTextField txtCalle;
    private javax.swing.JTextField txtIdCliente;
    private javax.swing.JTextField txtIdDireccion;
    private javax.swing.JTextField txtNumeroCalle;
    private javax.swing.JTextField txtOficina;
    // End of variables declaration//GEN-END:variables
}
