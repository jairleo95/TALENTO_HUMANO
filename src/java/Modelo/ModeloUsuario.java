/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import lib.Conexion;

/**
 *
 * @author Alfa.sistemas
 */
public class ModeloUsuario {
   
    ResultSet rs =null;
    
    public ResultSet ValidarUsuario(String Usuario, String Clave) throws Exception{
        try {
            Connection cx = Conexion.getConex();
        PreparedStatement ps = cx.prepareStatement("select idusuario,usuario,clave,idempleado,idroles from usuario where usuario=? and clave =?");
        ps.setString(1, Usuario);
        ps.setString(2, Clave);
        rs= ps.executeQuery();

        } catch (Exception e) {
        }
        
        
        return null;
    }
}
