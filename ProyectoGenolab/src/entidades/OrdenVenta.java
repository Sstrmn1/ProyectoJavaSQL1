package entidades;
import java.sql.Timestamp;

public class OrdenVenta {
    private int idOrden;
    private int idSucursal;
    private int idUsuario;
    private Timestamp fechaHora;
    private float importeTotal;

    public OrdenVenta() {
    }

    public OrdenVenta(int idOrden, int idSucursal, int idUsuario, Timestamp fechaHora, float importeTotal) {
        this.idOrden = idOrden;
        this.idSucursal = idSucursal;
        this.idUsuario = idUsuario;
        this.fechaHora = fechaHora;
        this.importeTotal = importeTotal;
    }

    public int getIdOrden() {
        return idOrden;
    }

    public void setIdOrden(int idOrden) {
        this.idOrden = idOrden;
    }

    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Timestamp getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Timestamp fechaHora) {
        this.fechaHora = fechaHora;
    }

    public float getImporteTotal() {
        return importeTotal;
    }

    public void setImporteTotal(float importeTotal) {
        this.importeTotal = importeTotal;
    }
    
    
}
