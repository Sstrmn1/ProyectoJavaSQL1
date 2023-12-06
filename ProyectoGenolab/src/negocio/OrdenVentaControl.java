package negocio;

import datos.ClienteDAO;
import datos.OrdenVentaDAO;
import datos.SucursalDAO;
import entidades.Cliente;
import entidades.Sucursal;
import entidades.OrdenVenta;
import entidades.Distrito;
import java.util.ArrayList;
import java.util.List;
import javax.swing.DefaultComboBoxModel;
import javax.swing.table.DefaultTableModel;

public class OrdenVentaControl {

    private final OrdenVentaDAO DATOSORDEN;
    private final ClienteDAO DATOSCLIENTE;
    private final SucursalDAO DATOSSUCURSAL;
    private OrdenVenta obj;
    private DefaultTableModel modeloTabla;
    public int registrosMostrados;

    public OrdenVentaControl() {
        this.DATOSORDEN = new OrdenVentaDAO();
        this.DATOSCLIENTE = new ClienteDAO();
        this.DATOSSUCURSAL = new SucursalDAO();
        this.obj = new OrdenVenta();
        this.registrosMostrados = 0;
    }

//    public DefaultTableModel listar(String texto) {
//        List<OrdenVenta> lista = new ArrayList();
//        lista.addAll(DATOSORDEN.listar(texto));
//        String[] titulos = {"ID", "IDDistrito", "IDCliente", "Nom Cliente", "Nom Distrito", "Direccion",
//            "Estado"};
//        this.modeloTabla = new DefaultTableModel(null, titulos);
//
//        String estado;
//        String[] registro = new String[7];
//        this.registrosMostrados = 0;
//
//        for (OrdenVenta item : lista) {
//            if (item.isActivo()) {
//                estado = "Activo";
//            } else {
//                estado = "Inactivo";
//            }
//
//            registro[0] = Integer.toString(item.getIdOrdenVenta());
//            registro[1] = Integer.toString(item.getIdDistrito());
//            registro[2] = Integer.toString(item.getIdCliente());
//            registro[3] = item.getNombreCliente();
//            registro[4] = item.getNombreDistrito();
//            registro[5] = item.getDireccion();
//            registro[6] = estado;
//
//            this.modeloTabla.addRow(registro);
//            registrosMostrados++;
//        }
//        return this.modeloTabla;
//    }

    public DefaultComboBoxModel listarSucursal(int idCliente) {
        DefaultComboBoxModel items = new DefaultComboBoxModel();
        List<Distrito> lista = new ArrayList();
        lista = DATOSSUCURSAL.listarDireccion(idCliente);
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

    public String insertar(int idDistrito, int idCliente, String direccion, boolean estado) {

        obj.setIdDistrito(idDistrito);
        obj.setIdCliente(idCliente);
        obj.setDireccion(direccion);

        obj.setActivo(estado);

        if (DATOSORDEN.insertar(obj)) {
            return "OK";
        } else {
            return "Error en la insercion.";
        }

    }

    public String actualizar(int idOrdenVenta, int idDistrito, int idCliente, String direccion, boolean estado) {
        obj.setIdOrdenVenta(idOrdenVenta);
        obj.setIdDistrito(idDistrito);
        obj.setIdCliente(idCliente);
        obj.setDireccion(direccion);
        obj.setActivo(estado);
        if (DATOSORDEN.actualizar(obj)) {
            return "OK";
        } else {
            return "Error en la insercion";
        }

    }

    public int total() {
        return DATOSORDEN.total();
    }

    public int totalMostrados() {
        return this.registrosMostrados;
    }

}
