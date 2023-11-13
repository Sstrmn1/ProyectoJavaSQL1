package datos;

import basedatos.Conexion;
import datos.interfaces.CrudSimpleInterface;
import entidades.Rol;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

//Se debe sobreescribir metodos abstractos de la implementacion
public class RolDAO implements CrudSimpleInterface<Rol> {

    private final Conexion CON;
    private PreparedStatement ps;
    private ResultSet rs;
    private boolean respuesta;

    public RolDAO() {
        CON = Conexion.getInstancia();

    }

    @Override
    public List<Rol> listar(String texto) {
        List<Rol> registros = new ArrayList();
        try {
            ps = CON.conectar().prepareStatement("select * from rol where nombre like ?");
            ps.setString(1, texto + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                registros.add(new Rol(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4)));
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
    public boolean insertar(Rol obj) {
        respuesta = false;
        try {
            ps = CON.conectar().prepareStatement("insert into rol(id_empresa, nombre, activo) values(?,?,1)");
            ps.setInt(1, obj.getId_empresa());
            ps.setString(2, obj.getNombre());
            if (ps.executeUpdate() > 0) {
                /*Para INSERT o UPDATE no se puede utilizar execute query
                se debe utilizar executeUpdate.
                
                Execute query devuelve resultSet. executeUpdate devuelve un entero.
                Si se ha insertado un registro devuelve 1, si no, devuelve 0
                 */
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
    public boolean actualizar(Rol obj) {
        respuesta = false;
        try {
            ps = CON.conectar().prepareStatement("UPDATE rol\n"
                    + "SET nombre = ?, id_empresa = ?\n"
                    + "WHERE id_rol = ?; ");
            ps.setInt(1, obj.getId_empresa());
            ps.setString(2, obj.getNombre());
            ps.setInt(3, obj.getId_rol());
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
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean existe(String texto) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
