package entidades;


public class FormaFarmaceutica {
    
    private int idFFarmaceutica;
    private String descripcion;
    private boolean activo;

    public FormaFarmaceutica() {
    }

    public FormaFarmaceutica(int idFFarmaceutica, String descripcion, boolean activo) {
        this.idFFarmaceutica = idFFarmaceutica;
        this.descripcion = descripcion;
        this.activo = activo;
    }

    public int getIdFFarmaceutica() {
        return idFFarmaceutica;
    }

    public void setIdFFarmaceutica(int idFFarmaceutica) {
        this.idFFarmaceutica = idFFarmaceutica;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    @Override
    public String toString() {
        return "FormaFarmaceutica{" + "idFFarmaceutica=" + idFFarmaceutica + ", descripcion=" + descripcion + ", activo=" + activo + '}';
    }
    
    
}
