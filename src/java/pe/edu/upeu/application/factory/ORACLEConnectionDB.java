/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Docente
 */
public final class ORACLEConnectionDB extends ConexionBD{

   ORACLEConnectionDB(String[] parametro) {
        this.parametro = parametro;
        this.open();
    }

    
    @Override
    Connection open() {
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:" + this.parametro[0] + "/" + this.parametro[1] + "@" + this.parametro[2] + ":" + this.parametro[3] + ":" + this.parametro[4];
        try {
            Class.forName(driver).newInstance();
            this.conex = DriverManager.getConnection(url);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
       } catch (InstantiationException e) {
           e.printStackTrace();
       } catch (SQLException e) {
           e.printStackTrace();
       }
       
        return this.conex;
    }
    
}
