package negocio;

import datos.KardexDAO;
import datos.LoteDAO;
import datos.LaboratorioDAO;
import entidades.Kardex;
import entidades.Lote;
import entidades.Laboratorio;
import java.sql.Timestamp;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.swing.DefaultComboBoxModel;
import javax.swing.table.DefaultTableModel;

public class KardexControl {

    private final KardexDAO DATOSLOTE;
    private final LoteDAO DATOSARTICULO;
    private final LaboratorioDAO DATOSLABORATORIO;
    private Kardex obj;
    private DefaultTableModel modeloTabla;
    public int registrosMostrados;

    public KardexControl() {
        this.DATOSLOTE = new KardexDAO();
        this.DATOSARTICULO = new LoteDAO();
        this.DATOSLABORATORIO = new LaboratorioDAO();
        this.obj = new Kardex();
        this.registrosMostrados = 0;
    }

    public DefaultTableModel listar(int idLote) {
        List<Kardex> lista = new ArrayList();
        lista.addAll(DATOSLOTE.listar(idLote));
        String[] titulos = {"Fecha hora",
            "Operacion",
            "Cliente",
            "Usuario",
            "Cantidad",
            "Saldo stock"};
        this.modeloTabla = new DefaultTableModel(null, titulos);

        String[] registro = new String[6];
        this.registrosMostrados = 0;

        for (Kardex item : lista) {
            registro[0] = String.valueOf(item.getFechaHora());
            registro[1] = Integer.toString(item.getIdTransaccion());
            registro[2] = item.getCliente();
            registro[3] = item.getRol();
            registro[4] = Integer.toString(item.getCantidad());
            registro[5] = Integer.toString(item.getSaldoStock());

            this.modeloTabla.addRow(registro);
            registrosMostrados++;
        }
        return this.modeloTabla;
    }

  

}
