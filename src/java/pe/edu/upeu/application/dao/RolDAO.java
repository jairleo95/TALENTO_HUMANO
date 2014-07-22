/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceRolDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Rol;
import pe.edu.upeu.application.model.V_Privilegio;

/**
 *
 * @author Jose
 */
public class RolDAO implements  InterfaceRolDAO{
ConexionBD conn;
    @Override
    public List<Rol> List_Rol() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
         String sql= "select * from rol";
         List<Rol> list = new ArrayList<Rol>();
         try {
             ResultSet rs = this.conn.query(sql);
             Rol r =  new Rol();
             while (rs.next()) {
                 r.setId_rol(rs.getString(1));
                 r.setNo_rol(rs.getString(2));
            list.add(r);
             }
             
        } catch (SQLException e) {
        }finally{
         this.conn.close();
         }
         
         return list;
        
                }
    
}
