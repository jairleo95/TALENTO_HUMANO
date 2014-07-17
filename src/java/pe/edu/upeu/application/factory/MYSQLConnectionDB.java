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
public final class MYSQLConnectionDB extends ConexionBD{

    public MYSQLConnectionDB(String[] parametro) {
        this.parametro = parametro;
        this.open();
    }
   
    @Override
    public Connection open() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.conex = DriverManager.getConnection("jdbc:mysql://localhost/"+this.parametro[0],this.parametro[1],this.parametro[2]);
        } catch (ClassNotFoundException e) {
        } catch (SQLException e) {
        }
        return this.conex;
    }
    
}
