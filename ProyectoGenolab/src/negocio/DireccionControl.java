package negocio;

import datos.ClienteDAO;
import datos.DireccionDAO;
import datos.DistritoDAO;
import entidades.Cliente;
import entidades.Direccion;
import entidades.Distrito;
import java.util.ArrayList;
import java.util.List;
import javax.swing.DefaultComboBoxModel;
import javax.swing.table.DefaultTableModel;

public class DireccionControl {

    private final DireccionDAO DATOSDIRECCION;
    private final ClienteDAO DATOSCLIENTE;
    private final DistritoDAO DATOSDISTRITO;
    private Direccion obj;
    private DefaultTableModel modeloTabla;
    public int registrosMostrados;

    public DireccionControl() {
        this.DATOSDIRECCION = new DireccionDAO();
        this.DATOSCLIENTE = new ClienteDAO();
        this.DATOSDISTRITO = new DistritoDAO();
        this.obj = new Direccion();
        this.registrosMostrados = 0;
    }

    public DefaultTableModel listar(String texto) {
        List<Direccion> lista = new ArrayList();
        lista.addAll(DATOSDIRECCION.listar(texto));
        String[] titulos = {"ID", "IDDistrito", "IDCliente", "Nom Cliente", "Nom Distrito", "Calle",
            "Numero", "Oficina", "Estado"};
        this.modeloTabla = new DefaultTableModel(null, titulos);

        String estado;
        String[] registro = new String[9];
        this.registrosMostrados = 0;

        for (Direccion item : lista) {
            if (item.isActivo()) {
                estado = "Activo";
            } else {
                estado = "Inactivo";
            }

            registro[0] = Integer.toString(item.getIdDireccion());
            registro[1] = Integer.toString(item.getIdDistrito());
            registro[2] = Integer.toString(item.getIdCliente());
            registro[3] = item.getNombreCliente();
            registro[4] = item.getNombreDistrito();
            registro[5] = item.getCalle();
            registro[6] = item.getNumeroCalle();
            registro[7] = item.getOficina();
            registro[8] = estado;

            this.modeloTabla.addRow(registro);
            registrosMostrados++;
        }
        return this.modeloTabla;
    }

    public DefaultComboBoxModel listarDistritos() {
        DefaultComboBoxModel items = new DefaultComboBoxModel();
        List<Distrito> lista = new ArrayList();
        lista = DATOSDISTRITO.listarNombres();
        for (Distrito item : lista) {
            items.addElement(new Distrito(item.getIdDistrito(), item.getNombre()));
        }
        return items;
    }

    public DefaultComboBoxModel listarClientes() {
        DefaultComboBoxModel items = new DefaultComboBoxModel();
        List<Cliente> lista = new ArrayList();
        lista = DATOSCLIENTE.listarNombres();
        for (Cliente item : lista) {
            items.addElement(new Cliente(item.getIdCliente(), item.getNombre()));
        }
        return items;
    }

    public int enviarIdCliente(Cliente cliente) {
        return cliente.getIdCliente();
    }

    public String insertar(int idDistrito, int idCliente, String calle, String numeroCalle, String oficina, boolean estado) {

        obj.setIdDistrito(idDistrito);
        obj.setIdCliente(idCliente);
        obj.setCalle(calle);
        obj.setNumeroCalle(numeroCalle);
        obj.setOficina(oficina);
        obj.setActivo(estado);

        if (DATOSDIRECCION.insertar(obj)) {
            return "OK";
        } else {
            return "Error en la insercion.";
        }

    }

    public String actualizar(int idDireccion, int idDistrito, int idCliente, String calle, String numeroCalle, String oficina, boolean estado) {
        obj.setIdDireccion(idDireccion);
        obj.setIdDistrito(idDistrito);
        obj.setIdCliente(idCliente);
        obj.setCalle(calle);
        obj.setNumeroCalle(numeroCalle);
        obj.setOficina(oficina);
        obj.setActivo(estado);
        if (DATOSDIRECCION.actualizar(obj)) {
            return "OK";
        } else {
            return "Error en la insercion";
        }

    }

    public int total() {
        return DATOSDIRECCION.total();
    }

    public int totalMostrados() {
        return this.registrosMostrados;
    }

}
