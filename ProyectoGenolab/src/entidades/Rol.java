package entidades;

public class Rol {
    private int idRol;
    private int idEmpresa;
    private String nombre;
    private boolean activo;

    public Rol() {
    }

    public Rol(int idRol, int idEmpresa, String nombre, boolean activo) {
        this.idRol = idRol;
        this.idEmpresa = idEmpresa;
        this.nombre = nombre;
        this.activo = activo;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
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
        return "Rol{" + "idRol=" + idRol + ", idEmpresa=" + idEmpresa + ", nombre=" + nombre + ", activo=" + activo + '}';
    }
    
    
}