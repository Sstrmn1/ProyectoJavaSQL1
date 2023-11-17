package negocio;

import datos.FormaFarmaceuticaDAO;
import entidades.FormaFarmaceutica;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;

public class FormaFarmaceuticaControl {

    private final FormaFarmaceuticaDAO DATOS;
    private FormaFarmaceutica obj;
    private DefaultTableModel modeloTabla;
    public int registrosMostrados;

    public FormaFarmaceuticaControl() {
        this.DATOS = new FormaFarmaceuticaDAO();
        this.obj = new FormaFarmaceutica();
        this.registrosMostrados = 0;
    }

    public DefaultTableModel listar(String texto) {
        List<FormaFarmaceutica> lista = new ArrayList();
        lista.addAll(DATOS.listar(texto));
        String[] titulos = {"ID", "Descripcion", "Estado"};
        this.modeloTabla = new DefaultTableModel(null, titulos);

        String estado;
        String[] registro = new String[4];
        this.registrosMostrados = 0;

        for (FormaFarmaceutica item : lista) {
            if (item.isActivo()) {
                estado = "Activo";
            } else {
                estado = "Inactivo";
            }

            registro[0] = Integer.toString(item.getIdFFarmaceutica());
            registro[1] = item.getDescripcion();
            registro[2] = estado;

            this.modeloTabla.addRow(registro);
            registrosMostrados++;
        }
        return this.modeloTabla;
    }

    public String insertar(String descripcion) {
        if (DATOS.existe(descripcion)) {
            return "El registro ya existe";
        } else {
            obj.setDescripcion(descripcion);

            if (DATOS.insertar(obj)) {
                return "OK";
            } else {
                return "Error en la insercion.";
            }
        }

    }

    public String actualizar(int idFFarmaceutica, String descripcion, boolean estado) {
        obj.setIdFFarmaceutica(idFFarmaceutica);
        obj.setDescripcion(descripcion);
        obj.setActivo(estado);

        return "OK";
    }
    
    public int total ()
    {
        return DATOS.total();
    }
    
    public int totalMostrados()
    {
        return this.registrosMostrados;
    }

}
