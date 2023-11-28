package entidades;

import java.util.Objects;

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

    public Articulo(int idArticulo, String descripcion, String codigo) {
        this.idArticulo = idArticulo;
        this.descripcion = descripcion;
        this.codigo = codigo;
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
        return descripcion;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + this.idArticulo;
        hash = 59 * hash + this.idFfarmaceutica;
        hash = 59 * hash + Objects.hashCode(this.descripcion);
        hash = 59 * hash + Objects.hashCode(this.ffDescripcion);
        hash = 59 * hash + Objects.hashCode(this.concentracion);
        hash = 59 * hash + Objects.hashCode(this.codigo);
        hash = 59 * hash + (this.activo ? 1 : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Articulo other = (Articulo) obj;
        if (this.idArticulo != other.idArticulo) {
            return false;
        }
        if (this.idFfarmaceutica != other.idFfarmaceutica) {
            return false;
        }
        if (this.activo != other.activo) {
            return false;
        }
        if (!Objects.equals(this.descripcion, other.descripcion)) {
            return false;
        }
        if (!Objects.equals(this.ffDescripcion, other.ffDescripcion)) {
            return false;
        }
        if (!Objects.equals(this.concentracion, other.concentracion)) {
            return false;
        }
        return Objects.equals(this.codigo, other.codigo);
    }
    
    
}
