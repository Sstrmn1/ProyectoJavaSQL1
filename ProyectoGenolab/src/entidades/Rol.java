package entidades;

public class Rol {
    private int id_rol;
    private int id_empresa;
    private String nombre;
    private boolean activo;

    public Rol() {
    }

    public Rol(int id_rol, int id_empresa, String nombre, boolean activo) {
        this.id_rol = id_rol;
        this.id_empresa = id_empresa;
        this.nombre = nombre;
        this.activo = activo;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public int getId_empresa() {
        return id_empresa;
    }

    public void setId_empresa(int id_empresa) {
        this.id_empresa = id_empresa;
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
        return "Rol{" + "id_rol=" + id_rol + ", id_empresa=" + id_empresa + ", nombre=" + nombre + ", activo=" + activo + '}';
    }
    
    
}