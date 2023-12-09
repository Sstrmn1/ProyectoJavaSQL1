package negocio;

import datos.ClienteDAO;
import datos.LoteDAO;
import datos.OrdenVentaDAO;
import datos.SucursalDAO;
import entidades.Cliente;
import entidades.Sucursal;
import entidades.OrdenVenta;
import entidades.Distrito;
import entidades.Lote;
import java.util.ArrayList;
import java.util.List;
import javax.swing.DefaultComboBoxModel;
import javax.swing.table.DefaultTableModel;
import java.sql.Timestamp;

public class OrdenVentaControl {

    private final OrdenVentaDAO DATOSORDEN;
    private final ClienteDAO DATOSCLIENTE;
    private final SucursalDAO DATOSSUCURSAL;
    private final LoteDAO DATOSLOTE;
    private OrdenVenta obj;
    private DefaultTableModel modeloTablaOrden,
            modeloTablaSucursal, modeloTablaCliente;
    public int registrosMostrados;

    public OrdenVentaControl() {
        this.DATOSORDEN = new OrdenVentaDAO();
        this.DATOSCLIENTE = new ClienteDAO();
        this.DATOSSUCURSAL = new SucursalDAO();
        this.DATOSLOTE = new LoteDAO();
        this.obj = new OrdenVenta();
        this.registrosMostrados = 0;
    }

    //Pendiente si es necesario listar ordenes de venta
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
    public DefaultTableModel listarSucursal(int idCliente) {
        List<Sucursal> lista = new ArrayList();
        lista.addAll(DATOSSUCURSAL.listarDireccion(idCliente));
        String[] titulos = {"ID", "Distrito", "Direccion"};
        this.modeloTablaSucursal = new DefaultTableModel(null, titulos);

        String[] registro = new String[3];

        for (Sucursal item : lista) {
            registro[0] = Integer.toString(item.getIdSucursal());
            registro[1] = item.getNombreDistrito();
            registro[2] = item.getDireccion();

            this.modeloTablaSucursal.addRow(registro);
        }
        return this.modeloTablaSucursal;
        //        DefaultTableModel items = new DefaultTableModel();
        //        List<Sucursal> lista = new ArrayList();
        //        lista = DATOSSUCURSAL.listarDireccion(idCliente);
        //        for (Sucursal item : lista) {
        //            items.addElement(new Sucursal(item.getIdSucursal(), item.getNombreDistrito(), item.getDireccion()));
        //        }
        //        return items;
    }

    public DefaultTableModel listarClientes(String texto) {
        List<Cliente> lista = new ArrayList();
        lista.addAll(DATOSCLIENTE.listarNombres(texto));
        String[] titulos = {"ID", "Nombre"};
        this.modeloTablaCliente = new DefaultTableModel(null, titulos);

        String[] registro = new String[2];

        for (Cliente item : lista) {
            registro[0] = Integer.toString(item.getIdCliente());
            registro[1] = item.getNombre();

            this.modeloTablaCliente.addRow(registro);
        }
        return this.modeloTablaCliente;
    }

    public String insertar(int numeroOrden, int idSucursal, int idUsuario) {

        obj.setNumeroOrden(numeroOrden);
        obj.setIdSucursal(idSucursal);
        obj.setIdUsuario(idUsuario);

        if (DATOSORDEN.insertar(obj)) {
            return "OK";
        } else {
            return "Error en la insercion.";
        }

    }

    public DefaultComboBoxModel cargarLote(int idArticulo) {
        DefaultComboBoxModel items = new DefaultComboBoxModel();
        List<Lote> lista = new ArrayList();
        lista = DATOSLOTE.seleccionarLote(idArticulo);
        for (Lote item : lista) {
            items.addElement(new Lote(item.getIdLote(), item.getIdArticulo(), item.getLoteCodigo()));
        }
        return items;
    }

    public String calcularImporte(int idOrdenVenta, float importeTotal) {
        obj.setIdOrden(idOrdenVenta);
        obj.setImporteTotal(importeTotal);
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
