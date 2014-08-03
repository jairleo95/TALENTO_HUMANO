/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.factory;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Docente
 */
public final class ORACLEConnectionDB extends ConexionBD{

     public ORACLEConnectionDB(String[] parametro) {
        this.parametro = parametro;
        this.open();
    }

    
    @Override
    Connection open() {
     
     String usuario = "RH_UPEU";
        String password = "alfa";
        String host = "localhost";
        String puerto = "1521";
        String sid = "ORCL";
        String driver = "oracle.jdbc.driver.OracleDriver";
        //String url = "jdbc:oracle:thin:" + this.parametro[0] + "/" + this.parametro[1] + "@" + host + ":" + puerto + ":" + this.parametro[2];
        String url = "jdbc:oracle:thin:" + usuario + "/" + password + "@" + host + ":" + puerto + ":" + sid;
        try {
            Class.forName(driver).newInstance();
            this.conex = DriverManager.getConnection(url);
        } catch (Exception e) {
            e.printStackTrace();
        }
       
        return this.conex;
    }
    
}
