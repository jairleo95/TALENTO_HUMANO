/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Alfa.sistemas
 */
public class Conexion {

    public static Connection getConex() throws Exception {
        String usuario = "RH_UPEU";
        String password = "alfa";
        String host = "localhost";
        String puerto = "1521";
        String sid = "orcl";
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:" + usuario + "/" + password + "@" + host + ":" + puerto + ":" + sid;

        Connection connection = null;

        try {
            Class.forName(driver).newInstance();
            connection = DriverManager.getConnection(url);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

}
