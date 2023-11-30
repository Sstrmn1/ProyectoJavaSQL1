package presentacion;

import com.github.sarxos.webcam.Webcam;
import com.github.sarxos.webcam.WebcamPanel;
import com.github.sarxos.webcam.WebcamResolution;
import javax.swing.JOptionPane;
import javax.swing.table.TableRowSorter;
import negocio.UsuarioControl;
import java.sql.Date;
import java.util.Calendar;
import entidades.Rol;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.HeadlessException;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class FrmUsuario extends javax.swing.JFrame {

    //atribubos
    private final UsuarioControl CONTROL;
    private String rutaDestino;
    private final String DIRECTORIO = "src/files/usuarios/";
    private String imagen = "";
    private String imagenAnt;

    //atributos de camara
    File salidaImage;
    int anchoCamara = 225;
    int altoCamara = 200;
    Dimension dimension = new Dimension(anchoCamara, altoCamara);
    Dimension dimension1 = WebcamResolution.VGA.getSize();
    Webcam webcam = Webcam.getDefault();
    WebcamPanel webcamPanel = new WebcamPanel(webcam, dimension, false);
    BufferedImage rutaWebCam;

    //constructor
    public FrmUsuario() {
        initComponents();
        this.CONTROL = new UsuarioControl();
        this.listado("");
        this.listarCombobox();

        dcFechaNac.setDate(new Date(1970 - 1900, 00, 01));

        txtIdUsuario.setEnabled(false);
        btnGuardar.setEnabled(false);

        webcam.setViewSize(dimension1);
        webcamPanel.setFillArea(true);
        pnlCamara.setLayout(new FlowLayout());
        pnlCamara.add(webcamPanel);

        ocultarColumnas();

        desactiva();
    }

    private void activa() {
        btnCapturaFoto.setEnabled(true);
    }

    private void desactiva() {
        btnCapturaFoto.setEnabled(false);
    }

    //metodos
    private void listado(String texto) {
        tblUsuario.setModel(this.CONTROL.listar(texto));
        TableRowSorter orden = new TableRowSorter(tblUsuario.getModel());
        tblUsuario.setRowSorter(orden);
    }

    private void listarCombobox() {
        cboRol.setModel(this.CONTROL.cargarRoles());
    }

    private void activar() {
        btnGuardar.setEnabled(true);
        btnRegistrar.setEnabled(false);
    }

    private void desactivar() {
        btnGuardar.setEnabled(false);
        btnRegistrar.setEnabled(true);
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

    private void limpiar() {
        txtNombre.setText("");
        txtApellido.setText("");
        txtIdUsuario.setText("");
        cboRol.setSelectedItem(null);
        txtCi.setText("");
        txtEmail.setText("");
        txtContraseña.setText("");
        txtFoto.setText("");
        rbtnActivo.setSelected(true);
        dcFechaNac.setDate(new Date(1970 - 1900, 00, 01));
        txtNombre.requestFocus();
        desactivar();

        this.imagen = "";
        this.imagenAnt = "";
        lblFoto.setIcon(null);
        this.rutaDestino = "";

    }

    private void ocultarColumnas() {
        tblUsuario.getColumnModel().getColumn(1).setMaxWidth(0);
        tblUsuario.getColumnModel().getColumn(1).setMinWidth(0);
        tblUsuario.getTableHeader().getColumnModel().getColumn(1).setMaxWidth(0);
        tblUsuario.getTableHeader().getColumnModel().getColumn(1).setMaxWidth(0);
    }

    private void subirImagenes() {
        this.imagen = CONTROL.generaNombreImagen(txtNombre.getText(), txtCi.getText()).trim() + ".jpg";
        this.rutaDestino = this.DIRECTORIO + this.imagen;
        salidaImage = new File(rutaDestino);
        try {
            ImageIO.write(rutaWebCam, "jpg", salidaImage);
            mensajeInformacion("Imagen guardada en: " + salidaImage.getAbsolutePath());
        } catch (HeadlessException | IOException e) {
            mensajeError(e.getMessage());
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTextField4 = new javax.swing.JTextField();
        rbtgOpcionBusqueda = new javax.swing.ButtonGroup();
        rbtgEstado = new javax.swing.ButtonGroup();
        tabbGeneral = new javax.swing.JTabbedPane();
        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        txtBuscar = new javax.swing.JTextField();
        rbtnNombre = new javax.swing.JRadioButton();
        rbtnRol = new javax.swing.JRadioButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblUsuario = new javax.swing.JTable();
        btnSalir = new javax.swing.JButton();
        btnEditar = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        txtNombre = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        txtApellido = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txtCi = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        txtEmail = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        txtContraseña = new javax.swing.JPasswordField();
        jLabel9 = new javax.swing.JLabel();
        txtFoto = new javax.swing.JTextField();
        btnRegistrar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        jLabel10 = new javax.swing.JLabel();
        rbtnActivo = new javax.swing.JRadioButton();
        rbtnInactivo = new javax.swing.JRadioButton();
        jLabel1 = new javax.swing.JLabel();
        cboRol = new javax.swing.JComboBox<>();
        dcFechaNac = new com.toedter.calendar.JDateChooser();
        txtIdUsuario = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        btnLimpiar = new javax.swing.JButton();
        jLabel13 = new javax.swing.JLabel();
        pnlCamara = new javax.swing.JPanel();
        lblFoto = new javax.swing.JLabel();
        btnIniciarCam = new javax.swing.JButton();
        btnApagarCam = new javax.swing.JButton();
        btnCapturaFoto = new javax.swing.JButton();

        jTextField4.setText("jTextField4");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel2.setText("Buscar usuario");

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

        rbtgOpcionBusqueda.add(rbtnNombre);
        rbtnNombre.setText("Nombre");

        rbtgOpcionBusqueda.add(rbtnRol);
        rbtnRol.setText("Rol");

        tblUsuario.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        tblUsuario.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblUsuarioMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblUsuario);

        btnSalir.setText("Salir");
        btnSalir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSalirActionPerformed(evt);
            }
        });

        btnEditar.setText("Editar");
        btnEditar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel2)
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addComponent(txtBuscar, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(46, 46, 46)
                                        .addComponent(rbtnNombre)
                                        .addGap(32, 32, 32)
                                        .addComponent(rbtnRol)))
                                .addGap(0, 214, Short.MAX_VALUE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addComponent(btnEditar)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(btnSalir)))
                        .addContainerGap())))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtBuscar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(rbtnNombre)
                    .addComponent(rbtnRol))
                .addGap(19, 19, 19)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnSalir)
                    .addComponent(btnEditar))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 349, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        tabbGeneral.addTab("Usuarios", jPanel1);

        jLabel3.setText("Nombre");

        jLabel4.setText("Apellido");

        jLabel5.setText("Documento de identidad");

        jLabel6.setText("Email");

        jLabel7.setText("Fecha de nacimiento");

        jLabel8.setText("Contraseña");

        jLabel9.setText("Cargar foto");

        btnRegistrar.setText("Registrar");
        btnRegistrar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRegistrarActionPerformed(evt);
            }
        });

        btnGuardar.setText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });

        jLabel10.setText("Estado");

        rbtgEstado.add(rbtnActivo);
        rbtnActivo.setSelected(true);
        rbtnActivo.setText("Activo");

        rbtgEstado.add(rbtnInactivo);
        rbtnInactivo.setText("Inactivo");

        jLabel1.setText("Rol");

        jLabel11.setText("Id usuario");

        btnLimpiar.setText("Limpiar");
        btnLimpiar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLimpiarActionPerformed(evt);
            }
        });

        jLabel13.setText("Foto");

        pnlCamara.setBackground(new java.awt.Color(153, 153, 153));
        pnlCamara.setPreferredSize(new java.awt.Dimension(225, 220));

        javax.swing.GroupLayout pnlCamaraLayout = new javax.swing.GroupLayout(pnlCamara);
        pnlCamara.setLayout(pnlCamaraLayout);
        pnlCamaraLayout.setHorizontalGroup(
            pnlCamaraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 225, Short.MAX_VALUE)
        );
        pnlCamaraLayout.setVerticalGroup(
            pnlCamaraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 220, Short.MAX_VALUE)
        );

        lblFoto.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        lblFoto.setPreferredSize(new java.awt.Dimension(225, 220));

        btnIniciarCam.setText("Iniciar camara");
        btnIniciarCam.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnIniciarCamActionPerformed(evt);
            }
        });

        btnApagarCam.setText("Apagar camara");

        btnCapturaFoto.setText("Capturar");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(btnRegistrar)
                        .addGap(18, 18, 18)
                        .addComponent(btnLimpiar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnGuardar))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(txtContraseña)
                            .addComponent(txtCi)
                            .addComponent(jLabel5, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabel8)
                            .addComponent(txtNombre))
                        .addGap(39, 39, 39)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                .addComponent(txtApellido, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 147, Short.MAX_VALUE)
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel6)
                                    .addComponent(jLabel9)
                                    .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                        .addComponent(txtFoto, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 147, Short.MAX_VALUE)
                                        .addComponent(txtEmail, javax.swing.GroupLayout.Alignment.LEADING))))
                            .addComponent(jLabel4))
                        .addGap(32, 32, 32)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(dcFechaNac, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel1)
                                    .addGroup(jPanel2Layout.createSequentialGroup()
                                        .addComponent(rbtnActivo)
                                        .addGap(18, 18, 18)
                                        .addComponent(rbtnInactivo))
                                    .addComponent(jLabel10)
                                    .addComponent(jLabel7)
                                    .addComponent(cboRol, 0, 233, Short.MAX_VALUE))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel11)
                                    .addComponent(txtIdUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, 58, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jLabel13)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addComponent(pnlCamara, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(lblFoto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(btnIniciarCam)
                                    .addComponent(btnApagarCam, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(btnCapturaFoto, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                        .addGap(0, 63, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(jLabel4)
                    .addComponent(jLabel1)
                    .addComponent(jLabel11))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtNombre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtApellido, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(cboRol, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtIdUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(jLabel6)
                    .addComponent(jLabel7))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(txtCi, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(txtEmail, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(dcFechaNac, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel8)
                    .addComponent(jLabel9)
                    .addComponent(jLabel10))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtContraseña, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtFoto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(rbtnActivo)
                    .addComponent(rbtnInactivo))
                .addGap(18, 18, 18)
                .addComponent(jLabel13)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(pnlCamara, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblFoto, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(btnIniciarCam)
                        .addGap(18, 18, 18)
                        .addComponent(btnApagarCam)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnCapturaFoto)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 21, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnRegistrar)
                    .addComponent(btnGuardar)
                    .addComponent(btnLimpiar))
                .addGap(62, 62, 62))
        );

        tabbGeneral.addTab("Mantenimiento", jPanel2);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(tabbGeneral)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(tabbGeneral))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txtBuscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtBuscarActionPerformed

    }//GEN-LAST:event_txtBuscarActionPerformed

    private void tblUsuarioMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblUsuarioMouseClicked


    }//GEN-LAST:event_tblUsuarioMouseClicked

    private void txtBuscarKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtBuscarKeyReleased
        this.listado(txtBuscar.getText());        // TODO add your handling code here:
    }//GEN-LAST:event_txtBuscarKeyReleased

    private void btnSalirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalirActionPerformed
        System.exit(0);        // TODO add your handling code here:
    }//GEN-LAST:event_btnSalirActionPerformed

    private void btnRegistrarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRegistrarActionPerformed
        String respuesta = "";
        String imagenActual = "";
        if (this.imagen.equals("")) {
            imagenActual = this.imagenAnt;
        } else {
            imagenActual = this.imagen;
        }

        String usuarioNombre = txtNombre.getText();
        String usuarioApellido = txtApellido.getText();
        String usuarioCI = txtCi.getText();
        String usuarioEmail = txtEmail.getText();
        String usuarioPassword = txtContraseña.getText();

        Rol rolSeleccionado = (Rol) cboRol.getSelectedItem();
        int rolId = rolSeleccionado.getIdRol();

        boolean estado;
        if (rbtnActivo.isSelected()) {
            estado = true;
        } else {
            estado = false;
        }

        Calendar cal;
        Date usuarioFechaNac;
        int d, m, a;
        try {
            cal = dcFechaNac.getCalendar();
            d = cal.get(Calendar.DAY_OF_MONTH);
            m = cal.get(Calendar.MONTH);
            a = cal.get(Calendar.YEAR) - 1900;
            usuarioFechaNac = new Date(a, m, d);
        } catch (Exception e) {
            mensajeError(e.getMessage());
            usuarioFechaNac = new Date(1970 - 1900, 00, 01);
        }

        respuesta = this.CONTROL.insertar(rolId, usuarioPassword, usuarioNombre, usuarioApellido, usuarioCI, usuarioEmail, usuarioFechaNac, imagenActual, estado);
        if (respuesta.equals("OK")) {
            if (!this.imagen.equals("")) {
                this.subirImagenes();
            }
            mensajeInformacion("Registro insertado");
        } else {
            mensajeError("Error insertando el registro");
        }
        limpiar();
        tabbGeneral.setSelectedIndex(0);
        this.listado("");

    }//GEN-LAST:event_btnRegistrarActionPerformed

    private void btnLimpiarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLimpiarActionPerformed
        limpiar();
    }//GEN-LAST:event_btnLimpiarActionPerformed

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        if (mensajeConfirmacion("Desea editar este registro") == 0) {
            String respuesta = "";

            String imagenActual = "";
            if (this.imagen.equals("")) {
                imagenActual = this.imagenAnt;
            } else {
                imagenActual = this.imagen;
            }

            String usuarioNombre = txtNombre.getText();
            String usuarioApellido = txtApellido.getText();
            String usuarioCI = txtCi.getText();
            String usuarioEmail = txtEmail.getText();
            String usuarioPassword = txtContraseña.getText();
            String usuarioFoto = txtFoto.getText();

            Rol rolSeleccionado = (Rol) cboRol.getSelectedItem();
            int rolId = rolSeleccionado.getIdRol();
            int usuarioId = Integer.parseInt(txtIdUsuario.getText());

            boolean estado;
            if (rbtnActivo.isSelected()) {
                estado = true;
            } else {
                estado = false;
            }

            Calendar cal;
            Date usuarioFechaNac;
            int d, m, a;
            try {
                cal = dcFechaNac.getCalendar();
                d = cal.get(Calendar.DAY_OF_MONTH);
                m = cal.get(Calendar.MONTH);
                a = cal.get(Calendar.YEAR) - 1900;
                usuarioFechaNac = new Date(a, m, d);
            } catch (Exception e) {
                mensajeError(e.getMessage());
                usuarioFechaNac = new Date(1970 - 1900, 00, 01);
            }

//        String fecha = ((JTextField)dcFechaNac.getDateEditor().getUiComponent()).getText();
            respuesta = this.CONTROL.actualizar(usuarioId, rolId, usuarioPassword, usuarioNombre, usuarioApellido, usuarioCI, usuarioEmail, usuarioFechaNac, imagenActual, estado);
            if (respuesta.equals("OK")) {
                if (!this.imagen.equals("")) {
                    this.subirImagenes();
                }
                mensajeInformacion("Registro Actualizado");
            } else {
                mensajeError("Error actualizando el registro");
            }
            limpiar();
            tabbGeneral.setSelectedIndex(0);
            this.listado("");
        } else {
            limpiar();
            desactivar();
            tabbGeneral.setSelectedIndex(0);
        }
        // TODO add your handling code here:
    }//GEN-LAST:event_btnGuardarActionPerformed

    private void btnEditarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarActionPerformed
        if (tblUsuario.getSelectedRowCount() == 1) {
            int fila = tblUsuario.getSelectedRow();

            String usuarioId = String.valueOf(tblUsuario.getValueAt(fila, 0));
            String rolId = String.valueOf(tblUsuario.getValueAt(fila, 1));
            String rolNombre = String.valueOf(tblUsuario.getValueAt(fila, 2));
            String usuarioNombre = String.valueOf(tblUsuario.getValueAt(fila, 3));
            String usuarioApellido = String.valueOf(tblUsuario.getValueAt(fila, 4));
            String usuarioPassword = String.valueOf(tblUsuario.getValueAt(fila, 5));
            String usuarioCI = String.valueOf(tblUsuario.getValueAt(fila, 6));
            String usuarioEmail = String.valueOf(tblUsuario.getValueAt(fila, 7));
            String usuarioFoto = String.valueOf(tblUsuario.getValueAt(fila, 9));
            String estado = String.valueOf(tblUsuario.getValueAt(fila, 10));

            Date usuarioFechaNac = Date.valueOf(tblUsuario.getValueAt(fila, 8).toString());

            Rol rolSeleccionado = new Rol(Integer.parseInt(rolId), rolNombre);

            txtIdUsuario.setText(usuarioId);
            txtNombre.setText(usuarioNombre);
            txtApellido.setText(usuarioApellido);
            txtContraseña.setText(usuarioPassword);
            txtCi.setText(usuarioCI);
            txtEmail.setText(usuarioEmail);
            txtFoto.setText(usuarioFoto);
            cboRol.setSelectedItem(rolSeleccionado);
            dcFechaNac.setDate(usuarioFechaNac);

            if (estado.equals("Activo")) {
                rbtnActivo.setSelected(true);
            } else {
                rbtnInactivo.setSelected(true);
            }
            activar();
            tabbGeneral.setSelectedIndex(1);
        } else {
            mensajeError("Debe seleccionar almenos un registro");
        }
        // TODO add your handling code here:
    }//GEN-LAST:event_btnEditarActionPerformed

    private void btnIniciarCamActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnIniciarCamActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnIniciarCamActionPerformed

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
            java.util.logging.Logger.getLogger(FrmUsuario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmUsuario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmUsuario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmUsuario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmUsuario().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnApagarCam;
    private javax.swing.JButton btnCapturaFoto;
    private javax.swing.JButton btnEditar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnIniciarCam;
    private javax.swing.JButton btnLimpiar;
    private javax.swing.JButton btnRegistrar;
    private javax.swing.JButton btnSalir;
    private javax.swing.JComboBox<String> cboRol;
    private com.toedter.calendar.JDateChooser dcFechaNac;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel13;
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
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField jTextField4;
    private javax.swing.JLabel lblFoto;
    private javax.swing.JPanel pnlCamara;
    private javax.swing.ButtonGroup rbtgEstado;
    private javax.swing.ButtonGroup rbtgOpcionBusqueda;
    private javax.swing.JRadioButton rbtnActivo;
    private javax.swing.JRadioButton rbtnInactivo;
    private javax.swing.JRadioButton rbtnNombre;
    private javax.swing.JRadioButton rbtnRol;
    private javax.swing.JTabbedPane tabbGeneral;
    private javax.swing.JTable tblUsuario;
    private javax.swing.JTextField txtApellido;
    private javax.swing.JTextField txtBuscar;
    private javax.swing.JTextField txtCi;
    private javax.swing.JPasswordField txtContraseña;
    private javax.swing.JTextField txtEmail;
    private javax.swing.JTextField txtFoto;
    private javax.swing.JTextField txtIdUsuario;
    private javax.swing.JTextField txtNombre;
    // End of variables declaration//GEN-END:variables
}
