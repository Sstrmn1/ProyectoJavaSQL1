package entidades;

public class Laboratorio {

    private int idLaboratorio;
    private String nombre;
    private String procedencia;
    private boolean activo;

    public Laboratorio() {
    }

    public Laboratorio(int idLaboratorio, String nombre) {
        this.idLaboratorio = idLaboratorio;
        this.nombre = nombre;
    }

    public Laboratorio(int idLaboratorio, String nombre, String procedencia, boolean activo) {
        this.idLaboratorio = idLaboratorio;
        this.nombre = nombre;
        this.procedencia = procedencia;
        this.activo = activo;
    }

    public int getIdLaboratorio() {
        return idLaboratorio;
    }

    public void setIdLaboratorio(int idLaboratorio) {
        this.idLaboratorio = idLaboratorio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getProcedencia() {
        return procedencia;
    }

    public void setProcedencia(String procedencia) {
        this.procedencia = procedencia;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    @Override
    public String toString() {
        return "Laboratorio{" + "idLaboratorio=" + idLaboratorio + ", nombre=" + nombre + ", procedencia=" + procedencia + ", activo=" + activo + '}';
    }

}
