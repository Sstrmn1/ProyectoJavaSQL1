package datos;

import datos.interfaces.CrudSimpleInterface;
import entidades.OrdenVenta;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import basedatos.Conexion;
import entidades.OrdenVenta;

public class OrdenVentaDAO implements CrudSimpleInterface<OrdenVenta> {

    private final Conexion CON;
    private PreparedStatement ps;
    private ResultSet rs;
    private boolean respuesta;

    public OrdenVentaDAO() {
        CON = Conexion.getInstancia();
    }

    @Override
    public List<OrdenVenta> listar(String texto) {
        List<OrdenVenta> registros = new ArrayList();
//        try {
//            ps = CON.conectar().prepareStatement("SELECT l.id_lote,\n"
//                    + "l.id_articulo,\n"
//                    + "l.id_laboratorio,\n"
//                    + "a.codigo AS codigo,\n"
//                    + "a.descripcion AS articulo,\n"
//                    + "l.codigo AS lote,\n"
//                    + "l.fecha_fabricacion,\n"
//                    + "l.fecha_expiracion,\n"
//                    + "l.stock,\n"
//                    + "l.precio_unitario,\n"
//                    + "lab.nombre as laboratorio,\n"
//                    + "l.activo\n"
//                    + "FROM lote l \n"
//                    + "INNER JOIN articulo a\n"
//                    + "ON l.id_articulo = a.id_articulo\n"
//                    + "INNER JOIN laboratorio lab\n"
//                    + "ON l.id_laboratorio = lab.id_laboratorio\n"
//                    + "WHERE a.codigo LIKE ?");
//            ps.setString(1, "%" + texto + "%");
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                registros.add(new OrdenVenta(
//                        rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getInt(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getDate(7),
//                        rs.getDate(8),
//                        rs.getInt(9),
//                        rs.getFloat(10),
//                        rs.getString(11),
//                        rs.getBoolean(12)
//                ));
//            }
//            ps.close();
//            rs.close();
//        } catch (SQLException e) {
//            JOptionPane.showMessageDialog(null, e.getMessage());
//        } finally {
//            ps = null;
//            rs = null;
//            CON.desconectar();
//        }
        return registros;
    }

    @Override
    public boolean insertar(OrdenVenta obj) {
        respuesta = false;
        try {
            ps = CON.conectar().prepareStatement("insert into orden_de_venta\n"
                    + "(numero_orden,\n"
                    + "id_sucursal,\n"
                    + "id_usuario,\n"
                    + "fecha_hora,\n"
                    + "importe_total)\n"
                    + "values\n"
                    + "(?,?,?,now(),0)");
            ps.setInt(1, obj.getNumeroOrden());
            ps.setInt(2, obj.getIdSucursal());
            ps.setInt(3, obj.getIdUsuario());

            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
            ps.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        } finally {
            ps = null;
            CON.desconectar();
        }
        return respuesta;
    }

    @Override
    public boolean actualizar(OrdenVenta obj) {
        respuesta = false;
        try {
            ps = CON.conectar().prepareStatement("UPDATE orden_de_venta SET\n"
                    + "fecha_hora = NOW(),\n"
                    + "importe_total = ?\n"
                    + "WHERE id_orden = ?;");
            ps.setFloat(1, obj.getImporteTotal());

            ps.setInt(2, obj.getIdOrden());
            if (ps.executeUpdate() > 0) {
                respuesta = true;
            }
            ps.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        } finally {
            ps = null;
            CON.desconectar();
        }
        return respuesta;
    }

    @Override
    public boolean desactivar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean activar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int total() {
        int totalRegistros = 0;
//        try {
//            ps = CON.conectar().prepareStatement("SELECT COUNT(id_lote) from lote");
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                totalRegistros = rs.getInt("COUNT(id_lote)");
//            }
//            ps.close();
//            rs.close();
//        } catch (SQLException e) {
//            JOptionPane.showMessageDialog(null, e.getMessage());
//        } finally {
//            ps = null;
//            rs = null;
//            CON.desconectar();
//        }
        return totalRegistros;
    }

    @Override
    public boolean existe(String texto) {
        respuesta = false;
        return respuesta;
    }

}
