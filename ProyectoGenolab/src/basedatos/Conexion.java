/*
MySQL Connection
*/
package basedatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Conexion {
    //atributos

    private final String DRIVER = "org.gjt.mm.mysql.Driver";
    private final String URL = "jdbc:mysql://localhost:3306/";
    private final String BD = "bd_genolab";
    private final String USUARIO = "root";
    private final String PASSWORD = "altocard";

    public Connection cadena;
    public static Conexion instancia;

    //metodos
    public Conexion() {
        this.cadena = null;
    }

    public Connection conectar() {
        try {
            Class.forName(DRIVER);
            this.cadena = DriverManager.getConnection(URL + BD, USUARIO, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
            System.exit(0);
        }
        return this.cadena;

    }

    public void desconectar() {
        try {
            this.cadena.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
        }
    }

    public synchronized static Conexion getInstancia() {
        if (instancia == null) {
            instancia = new Conexion();
        }
        return instancia;
    }

}

/*
SQL Connection
*/
//package basedatos;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//import javax.swing.JOptionPane;
//
//
//public class Conexion {
//    //atributos
//
//    private final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//    private final String URL = "jdbc:sqlserver://localhost:1433;databaseName=bd_genolab;user=root;password=altocard;trustServerCertificate=true";
//    private final String BD = "bd_genolab";
//    private final String USUARIO = "root";
//    private final String PASSWORD = "altocard";
//
//    public Connection cadena;
//    public static Conexion instancia;
//
//    //metodos
//    public Conexion() {
//        this.cadena = null;
//    }
//
//    public Connection conectar() {
//        try {
//            Class.forName(DRIVER);
//            this.cadena = DriverManager.getConnection(URL);
//        } catch (ClassNotFoundException | SQLException e) {
//            JOptionPane.showMessageDialog(null, e.getMessage());
//            System.out.println(e.getMessage());
//            System.exit(0);
//        }
//        return this.cadena;
//
//    }
//
//    public void desconectar() {
//        try {
//            this.cadena.close();
//        } catch (SQLException e) {
//            JOptionPane.showMessageDialog(null, e.getMessage());
//        }
//    }
//
//    public synchronized static Conexion getInstancia() {
//        if (instancia == null) {
//            instancia = new Conexion();
//        }
//        return instancia;
//    }
//
//}

