/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import pe.edu.upeu.application.factory.Conexion;

/**
 *
 * @author Alfa.sistemas
 */
public class ModeloUsuario {

    ResultSet rs = null;
    Statement stmt = null;
     Connection cx = null;
     
    public ResultSet ValidarUsuario(String User, String pwd) throws Exception {
        
        cx=Conexion.getConex();
        stmt = cx.createStatement();
        rs = stmt.executeQuery("select * from rhvd_usuario where no_usuario='" + User + "' and pw_usuario='" + pwd + "'");
        return this.rs;
    }
}
