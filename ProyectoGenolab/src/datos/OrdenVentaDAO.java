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
import entidades.Transaccion;
import java.sql.Statement;

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

//    @Override
//    public boolean insertar(OrdenVenta obj) {
//        respuesta = false;
//        try {
//            String consulta = "insert into orden_de_venta\n"
//                    + "(numero_orden,\n"
//                    + "id_sucursal,\n"
//                    + "id_usuario,\n"
//                    + "fecha_hora,\n"
//                    + "importe_total)\n"
//                    + "values\n"
//                    + "(?,?,?,now(),0)";
//            ps = CON.conectar().prepareStatement(consulta);
//            ps.setInt(1, obj.getNumeroOrden());
//            ps.setInt(2, obj.getIdSucursal());
//            ps.setInt(3, obj.getIdUsuario());
//
//            if (ps.executeUpdate() > 0) {
//                respuesta = true;
////                rs = ps.executeQuery();
//
////                System.out.println(ps.getGeneratedKeys().getInt(1));
//            }
//            ps.close();
//        } catch (SQLException e) {
//            JOptionPane.showMessageDialog(null, e.getMessage());
//        } finally {
//            ps = null;
//            CON.desconectar();
//        }
//        return respuesta;
//    }
    @Override
    public boolean insertar(OrdenVenta obj) {
        respuesta = false;
        int idGenerado = -1; // Variable para almacenar la ID autogenerada

        try {
            String consulta = "INSERT INTO orden_de_venta "
                    + "(numero_orden, id_sucursal, id_usuario, fecha_hora, importe_total) "
                    + "VALUES (?, ?, ?, NOW(), 0)";
            ps = CON.conectar().prepareStatement(consulta, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, obj.getNumeroOrden());
            ps.setInt(2, obj.getIdSucursal());
            ps.setInt(3, obj.getIdUsuario());

            if (ps.executeUpdate() > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();

                if (generatedKeys.next()) {
                    idGenerado = generatedKeys.getInt(1);
                    // Puedes usar idGenerado como la ID autogenerada
                    System.out.println(idGenerado);
                    respuesta = true;
                }
                generatedKeys.close();
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
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

    public boolean insertarTransaccion(Transaccion obj) {
        respuesta = false;
        try {
            ps = CON.conectar().prepareStatement("insert into transaccion\n"
                    + "(id_lote,\n"
                    + "id_orden,\n"
                    + "cantidad,\n"
                    + "fecha\n"
                    + "values(?,?,?,now())");
            ps.setInt(1, obj.getIdLote());
            ps.setInt(2, obj.getIdOrden());
            ps.setInt(3, obj.getCantidad());

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

    public int obtenerIdOrden() {
        int idOrden = 0;
        try {
            ps = CON.conectar().prepareStatement("SELECT LAST_INSERT_ID() as last_id");
            rs = ps.executeQuery();
            while (rs.next()) {
                idOrden = rs.getInt("last_id");
            }
            ps.close();
            rs.close();

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        } finally {
            ps = null;
            rs = null;
            CON.desconectar();
        }
        return idOrden;
    }

    public List<Transaccion> listarTransacciones(int idOrden) {
        List<Transaccion> registros = new ArrayList();
        try {
            ps = CON.conectar().prepareStatement("SELECT \n"
                    + "    a.codigo AS 'Codigo Articulo',\n"
                    + "    a.descripcion AS 'Descripcion Articulo',\n"
                    + "    l.codigo AS 'Codigo Lote',\n"
                    + "    t.cantidad AS 'Cantidad',\n"
                    + "    t.id_orden AS 'ID Orden',\n"
                    + "    (t.cantidad * l.precio_unitario) AS 'Importe'\n"
                    + "FROM\n"
                    + "    bd_genolab.transaccion t\n"
                    + "    JOIN bd_genolab.lote l ON t.id_lote = l.id_lote\n"
                    + "    JOIN bd_genolab.articulo a ON l.id_articulo = a.id_articulo\n"
                    + "    JOIN bd_genolab.orden_de_venta o ON t.id_orden = o.id_orden\n"
                    + "    where t.id_orden= ? ");
            ps.setInt(1, idOrden);
            rs = ps.executeQuery();
            while (rs.next()) {
                registros.add(new Transaccion(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(5),
                        rs.getInt(4),
                        rs.getFloat("Importe"))
                );
            }
            ps.close();
            rs.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        } finally {
            ps = null;
            rs = null;
            CON.desconectar();
        }
        return registros;
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
