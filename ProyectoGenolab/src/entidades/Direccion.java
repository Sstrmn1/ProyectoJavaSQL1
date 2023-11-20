package entidades;

public class Direccion {

    private int idDireccion;
    private int idDistrito;
    private int idCliente;
    private String nombreDistrito;
    private String nombreCliente;
    private String calle;
    private String numeroCalle;
    private String oficina;
    private boolean activo;
    


    public Direccion() {
    }

    public Direccion(int idDireccion, int idDistrito, int idCliente, String nombreDistrito,
            String nombreCliente, String calle, String numeroCalle, String oficina, boolean activo) {
        this.idDireccion = idDireccion;
        this.idDistrito = idDistrito;
        this.idCliente = idCliente;
        this.nombreDistrito = nombreDistrito;
        this.nombreCliente = nombreCliente;
        this.calle = calle;
        this.numeroCalle = numeroCalle;
        this.oficina = oficina;
        this.activo = activo;
    }

    public int getIdDireccion() {
        return idDireccion;
    }

    public void setIdDireccion(int idDireccion) {
        this.idDireccion = idDireccion;
    }

    public int getIdDistrito() {
        return idDistrito;
    }

    public void setIdDistrito(int idDistrito) {
        this.idDistrito = idDistrito;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombreDistrito() {
        return nombreDistrito;
    }

    public void setNombreDistrito(String nombreDistrito) {
        this.nombreDistrito = nombreDistrito;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getNumeroCalle() {
        return numeroCalle;
    }

    public void setNumeroCalle(String numeroCalle) {
        this.numeroCalle = numeroCalle;
    }

    public String getOficina() {
        return oficina;
    }

    public void setOficina(String oficina) {
        this.oficina = oficina;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    @Override
    public String toString() {
        return "Direccion{" + "idDireccion=" + idDireccion + ", idDistrito=" + idDistrito + ", idCliente=" + idCliente + ", nombreDistrito=" + nombreDistrito + ", nombreCliente=" + nombreCliente + ", calle=" + calle + ", numeroCalle=" + numeroCalle + ", oficina=" + oficina + ", activo=" + activo + '}';
    }
    
    

}
