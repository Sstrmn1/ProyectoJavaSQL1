package negocio;

import datos.ClienteDAO;
import datos.LoteDAO;
import datos.OrdenVentaDAO;
import datos.SucursalDAO;
import entidades.Cliente;
import entidades.Sucursal;
import entidades.OrdenVenta;
import entidades.Transaccion;

import entidades.Lote;
import java.util.ArrayList;
import java.util.List;
import javax.swing.DefaultComboBoxModel;
import javax.swing.table.DefaultTableModel;

public class OrdenVentaControl {

    private final OrdenVentaDAO DATOSORDEN;
    private final ClienteDAO DATOSCLIENTE;
    private final SucursalDAO DATOSSUCURSAL;
    private final LoteDAO DATOSLOTE;
    private OrdenVenta obj;
    private Transaccion objTransaccion;
    private DefaultTableModel modeloTablaOrden, modeloTablaSucursal, modeloTablaCliente, modeloTablaTransaccion;
    public int registrosMostrados;

    public OrdenVentaControl() {
        this.DATOSORDEN = new OrdenVentaDAO();
        this.DATOSCLIENTE = new ClienteDAO();
        this.DATOSSUCURSAL = new SucursalDAO();
        this.DATOSLOTE = new LoteDAO();
        this.obj = new OrdenVenta();
        this.objTransaccion = new Transaccion();
        this.registrosMostrados = 0;
    }

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

    public DefaultTableModel listarDetalle() {
        List<Transaccion> lista = new ArrayList();
        String[] titulos = {"ARTICULO", "DESCRIPCION", "LOTE", "CANTIDAD", "IMPORTE"};
        this.modeloTablaTransaccion = new DefaultTableModel(null, titulos);

        String[] registro = new String[5];

        return this.modeloTablaTransaccion;
    }

//        public DefaultTableModel listarDetalle(int idOrden) {
//        List<Transaccion> lista = new ArrayList();
//        lista.addAll(DATOSORDEN.listarTransacciones(idOrden));
//        String[] titulos = {"ARTICULO", "DESCRIPCION", "LOTE", "CANTIDAD", "ID IRDEN", "IMPORTE"};
//        this.modeloTablaTransaccion = new DefaultTableModel(null, titulos);
//
//        String[] registro = new String[6];
//
//        for (Transaccion item : lista) {
//            registro[0] = item.getArticulo();
//            registro[1] = item.getArticuloDescripcion();
//            registro[2] = item.getLoteCodigo();
//            registro[3] = String.valueOf(item.getCantidad());
//            registro[4] = String.valueOf(item.getIdOrden());
//            registro[5] = String.valueOf(item.getImporte());
//
//            this.modeloTablaTransaccion.addRow(registro);
//        }
//        return this.modeloTablaTransaccion;
//    }
    public String insertar(int numeroOrden, int idSucursal, int idUsuario, List<Transaccion> listaTransacciones) {

        obj.setNumeroOrden(numeroOrden);
        obj.setIdSucursal(idSucursal);
        obj.setIdUsuario(idUsuario);
        obj.setTransacciones(listaTransacciones);

//        for (Transaccion item : listaTransacciones) {
//            objTransaccion.setIdLote(item.getIdLote());
//            objTransaccion.setCantidad(item.getCantidad());
//        }

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
            items.addElement(new Lote(item.getIdLote(), item.getIdArticulo(), item.getLoteCodigo(), item.getPrecioUnitario()));
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

//    public void enviarTransacciones(List<Transaccion> listaTransacciones) {
//        for (Transaccion item : listaTransacciones) {
//            objTransaccion.setIdLote(item.getIdLote());
//            objTransaccion.setCantidad(item.getCantidad());
//        }
//    }

}
