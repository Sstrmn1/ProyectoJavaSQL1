package negocio;

import datos.RolDAO;
import entidades.Rol;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;

public class RolControl {

    private final RolDAO DATOS;
    private Rol obj;
    private DefaultTableModel modeloTabla;

    public int registrosMostrados;

    public RolControl() {
        this.DATOS = new RolDAO();
        this.obj = new Rol();
        this.registrosMostrados = 0;

    }

    public DefaultTableModel listar(String texto) {
        List<Rol> lista = new ArrayList();
        lista.addAll(DATOS.listar(texto));
        String[] titulos = {"ID", "id_empresa", "Nombre", "Estado"};
        this.modeloTabla = new DefaultTableModel(null, titulos);

        String estado;
        String[] registro = new String[4];
        this.registrosMostrados = 0;

        for (Rol item : lista) {
            if (item.isActivo()) {
                estado = "Activo";
            } else {
                estado = "Inactivo";
            }
            registro[0] = Integer.toString(item.getIdRol());
            registro[1] = Integer.toString(item.getIdEmpresa());
            registro[2] = item.getNombre();
            registro[3] = estado;
            this.modeloTabla.addRow(registro);
            this.registrosMostrados++;
        }
        return this.modeloTabla;
    }

    public String insertar(String nombre, int idEmpresa) {
        //Analizar procedimiento almacenado para determinar parametros de metodos similares a este
        //Por ejemplo en insertar, el procedimiento es insert into rol(id_empresa, nombre, activo) values(?,?,1)
        //Y como no se necesita un campo activo por defecto no es necesario pasar un valor de activo como parametro
        if (DATOS.existe(nombre)) {
            return "El registro ya existe";

        } else {
            obj.setNombre(nombre);
            obj.setIdEmpresa(idEmpresa);

            if (DATOS.insertar(obj)) {
                return "OK";
            } else {
                return "Error en la insercion.";
            }

        }

    }

    public String actualizar(int idRol, int idEmpresa, String nombre, String nombreAnterior) {

        if (nombre.equals(nombreAnterior)) {
            obj.setIdRol(idRol);
            obj.setIdEmpresa(idEmpresa);
            obj.setNombre(nombre);
            if (DATOS.actualizar(obj)) {
                return "OK";
            } else {
                return "Error en la actualizacion";
            }

        } else {
            if (DATOS.existe(nombre)) {
                return "El registro ya existe";
            } else {
                obj.setIdRol(idRol);
                obj.setIdEmpresa(idEmpresa);
                obj.setNombre(nombre);
                if (DATOS.actualizar(obj)) {
                    return "OK";
                } else {
                    return "Error en la actualizacion";
                }
            }

        }

    }
    
    public String activar(int id){
        if (DATOS.activar(id)) {
            return "OK";
        } else {
            return "No se puede activar el registro.";
        }
    }
    
    public String desactivar(int id){
        if (DATOS.desactivar(id)) {
            return "OK";
        } else {
            return "No se puede activar el registro.";
        }
    }
    
    public int total(){
        return DATOS.total();
    }
    
    public int totalMostrados(){
        return this.registrosMostrados;
    }

}
