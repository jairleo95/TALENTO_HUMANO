/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import pe.edu.upeu.application.factory.Conexion;

/**
 *
 * @author Alfa.sistemas
 */
public class ModeloRol {
    ResultSet rs = null;
    Statement stmt = null;
     Connection cx = null;
    
    public ResultSet ListarURL(String idrol) throws Exception{
    String sql= "select * from det_privilegio where idroles = '"+idrol+"' order by nro_orden";
    cx= Conexion.getConex();
    stmt=cx.createStatement();
    rs= stmt.executeQuery(sql);
    
    return this.rs;
    }
    
    
}
