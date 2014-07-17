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
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
            this.conex = DriverManager.getConnection("jdbc:oracle:oci:@ORACLEBD"+this.parametro[0],this.parametro[1],this.parametro[2]);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.conex;
    }
    
}
