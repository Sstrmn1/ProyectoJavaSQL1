package entidades;

public class Distrito {
    private int idDistrito;
    private String nombre;
    private boolean activo;

    public Distrito() {
    }

    public Distrito(int idDistrito, String nombre, boolean activo) {
        this.idDistrito = idDistrito;
        this.nombre = nombre;
        this.activo = activo;
    }

    public int getIdDistrito() {
        return idDistrito;
    }

    public void setIdDistrito(int idDistrito) {
        this.idDistrito = idDistrito;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    @Override
    public String toString() {
        return "Distrito{" + "idDistrito=" + idDistrito + ", nombre=" + nombre + ", activo=" + activo + '}';
    }
    
    
}
