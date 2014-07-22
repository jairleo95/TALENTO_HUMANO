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
import pe.edu.upeu.application.model.Detalle_Privilegio;
import pe.edu.upeu.application.model.Rol;

/**
 *
 * @author Jose
 */
public class RolDAO implements  InterfaceRolDAO{
ConexionBD conn;
    @Override
    public List<Rol> List_Rol() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
         String sql= "select * from RHTR_ROL";
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

@Override
        public List<Detalle_Privilegio> listarURL(String idrol) {
         this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
         String sql= "select * from RHTD_DETALLE_PRIVILEGIO where ID_ROL='"+idrol+"'";
         List<Detalle_Privilegio> list = new ArrayList<Detalle_Privilegio>();
         try {
             ResultSet rs = this.conn.query(sql);
             Detalle_Privilegio d =  new Detalle_Privilegio();
             while (rs.next()) {
                 d.setId_detalle_privilegio(rs.getString(1));
                 d.setId_rol(rs.getString(2));
                 d.setNu_orden(rs.getInt(3));
                 d.setId_privilegio(rs.getString(4));
                 d.setEs_detalle_privilegio(rs.getString(5));
            list.add(d);
             }
             
        } catch (SQLException e) {
        }finally{
         this.conn.close();
         }
         
         return list;
    }

    @Override
    public boolean INSERT_ROLES(String idrol) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}