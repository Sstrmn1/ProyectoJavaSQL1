package entidades;

public class Articulo {
    private int idArticulo;
    private int idFfarmaceutica;
    private String descripcion;
    private String ffDescripcion;
    private String concentracion;
    private String codigo;
    private boolean activo;

    public Articulo() {
    }

    public Articulo(int idArticulo, int idFfarmaceutica, String descripcion, String ffDescripcion, String concentracion, String codigo, boolean activo) {
        this.idArticulo = idArticulo;
        this.idFfarmaceutica = idFfarmaceutica;
        this.descripcion = descripcion;
        this.ffDescripcion = ffDescripcion;
        this.concentracion = concentracion;
        this.codigo = codigo;
        this.activo = activo;
    }

    public int getIdArticulo() {
        return idArticulo;
    }

    public void setIdArticulo(int idArticulo) {
        this.idArticulo = idArticulo;
    }

    public int getIdFfarmaceutica() {
        return idFfarmaceutica;
    }

    public void setIdFfarmaceutica(int idFfarmaceutica) {
        this.idFfarmaceutica = idFfarmaceutica;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFfDescripcion() {
        return ffDescripcion;
    }

    public void setFfDescripcion(String ffDescripcion) {
        this.ffDescripcion = ffDescripcion;
    }

    public String getConcentracion() {
        return concentracion;
    }

    public void setConcentracion(String concentracion) {
        this.concentracion = concentracion;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    @Override
    public String toString() {
        return "Articulo{" + "idArticulo=" + idArticulo + ", idFfarmaceutica=" + idFfarmaceutica + ", descripcion=" + descripcion + ", ffDescripcion=" + ffDescripcion + ", concentracion=" + concentracion + ", codigo=" + codigo + ", activo=" + activo + '}';
    }
    
    
}
