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
            registro[0] = Integer.toString(item.getId_rol());
            registro[1] = Integer.toString(item.getId_empresa());
            registro[2] = item.getNombre();
            registro[3] = estado;
            this.modeloTabla.addRow(registro);
            this.registrosMostrados++;
        }
        return this.modeloTabla;
    }

}
