package entidades;

import java.sql.Timestamp;

public class Transaccion {

    private int idTransaccion;
    private int idLote;
    private String Articulo;
    private String ArticuloDescripcion;
    private String LoteCodigo;
    private int idOrden;
    private int cantidad;
    private float importe;
    private Timestamp fechaHora;

    public Transaccion() {
    }

    public Transaccion(int idTransaccion, int idLote, String Articulo, String ArticuloDescripcion, String LoteCodigo, int idOrden, int cantidad, Timestamp fechaHora) {
        this.idTransaccion = idTransaccion;
        this.idLote = idLote;
        this.Articulo = Articulo;
        this.ArticuloDescripcion = ArticuloDescripcion;
        this.LoteCodigo = LoteCodigo;
        this.idOrden = idOrden;
        this.cantidad = cantidad;
        this.fechaHora = fechaHora;
    }

    public Transaccion(int idTransaccion, int idLote, int idOrden, int cantidad, Timestamp fechaHora) {
        this.idTransaccion = idTransaccion;
        this.idLote = idLote;
        this.idOrden = idOrden;
        this.cantidad = cantidad;
        this.fechaHora = fechaHora;
    }

    public Transaccion(String Articulo, String ArticuloDescripcion, String LoteCodigo, int idOrden, int cantidad, float importe) {
        this.Articulo = Articulo;
        this.ArticuloDescripcion = ArticuloDescripcion;
        this.LoteCodigo = LoteCodigo;
        this.idOrden = idOrden;
        this.cantidad = cantidad;
        this.importe = importe;
    }    
    

    public float getImporte() {
        return importe;
    }

    public void setImporte(float importe) {
        this.importe = importe;
    }
    
    
    
    

    public int getIdTransaccion() {
        return idTransaccion;
    }

    public void setIdTransaccion(int idTransaccion) {
        this.idTransaccion = idTransaccion;
    }

    public int getIdLote() {
        return idLote;
    }

    public void setIdLote(int idLote) {
        this.idLote = idLote;
    }

    public String getArticulo() {
        return Articulo;
    }

    public void setArticulo(String Articulo) {
        this.Articulo = Articulo;
    }

    public String getArticuloDescripcion() {
        return ArticuloDescripcion;
    }

    public void setArticuloDescripcion(String ArticuloDescripcion) {
        this.ArticuloDescripcion = ArticuloDescripcion;
    }

    public String getLoteCodigo() {
        return LoteCodigo;
    }

    public void setLoteCodigo(String LoteCodigo) {
        this.LoteCodigo = LoteCodigo;
    }

    public int getIdOrden() {
        return idOrden;
    }

    public void setIdOrden(int idOrden) {
        this.idOrden = idOrden;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Timestamp getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Timestamp fechaHora) {
        this.fechaHora = fechaHora;
    }

    @Override
    public String toString() {
        return "Transaccion{" + "idTransaccion=" + idTransaccion + ", idLote=" + idLote + ", Articulo=" + Articulo + ", ArticuloDescripcion=" + ArticuloDescripcion + ", LoteCodigo=" + LoteCodigo + ", idOrden=" + idOrden + ", cantidad=" + cantidad + ", fechaHora=" + fechaHora + '}';
    }
    
    
}
