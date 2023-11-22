package entidades;

public class Rol {

    private int idRol;
    private String nombre;
    private boolean activo;

    public Rol() {
    }

    public Rol(int idRol, String nombre, boolean activo) {
        this.idRol = idRol;
        this.nombre = nombre;
        this.activo = activo;
    }

    public Rol(int idRol, String nombre) {
        this.idRol = idRol;
        this.nombre = nombre;
    }   
    

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
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
        return "Rol{" + "idRol=" + idRol + ", nombre=" + nombre + ", activo=" + activo + '}';
    }

}
