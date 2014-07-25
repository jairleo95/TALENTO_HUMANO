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

import pe.edu.upeu.application.dao_imp.InterfaceAreaDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Area;



/**
 *
 * @author Admin
 */
public class AreaDAO implements InterfaceAreaDAO{
    ConexionBD conn;

    @Override
    public List<Area> List_Area() {
        this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from rhtd_area ";
        List<Area> list= new ArrayList<Area>();
        try {
            ResultSet rs = this.conn.query(sql);
            Area a = new Area();
            while (rs.next()) {                
                a.setId_area(rs.getString("id_area"));
                a.setEs_area(rs.getString("es_area"));
                a.setId_departamento(rs.getString("id_departamento"));
                a.setNo_area(rs.getString("no_area"));
                a.setNo_corto_area(rs.getString("no_corto_area"));
                list.add(a);
            }
        } catch (SQLException e) {
        }finally{
        this.conn.close();
        }        
      return list;
    }

    @Override
    public List<Area> List_Area_ID(String id_departamento) {
        this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql ="Select * from rhtd_area ";
        sql += (id_departamento != "")? "where id_departamento='"+id_departamento+"'":"";
        List<Area> list = new ArrayList<Area>();
         try {
             ResultSet rs = this.conn.query(sql);
             Area a = new Area();
             while (rs.next()) {
                a.setId_area(rs.getString(1));
                a.setEs_area(rs.getString(2));
                a.setId_departamento(rs.getString(3));
                a.setNo_area(rs.getString(4));
                a.setNo_corto_area(rs.getString(5));
                list.add(a);
             }
            
        } catch (SQLException e) {
        }finally {
         this.conn.close();
         }
        return list;
    }
  
}
