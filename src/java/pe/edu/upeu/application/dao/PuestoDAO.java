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
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Puesto;

/**
 *
 * @author Admin
 */
public class PuestoDAO implements InterfacePuestoDAO{
    ConexionBD conn;
    
    @Override
    public boolean Guardar_Puesto() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Eliminar_Puesto() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    @Override
    public List<Puesto> List_Puesto(){
       this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtr_puesto ";
        List<Puesto> list= new ArrayList<Puesto>();
        try {
            ResultSet rs = this.conn.query(sql);
            
            while (rs.next()) {    
                Puesto p = new Puesto();
                p.setCo_grupo(rs.getString("co_grupo"));
                p.setEs_puesto(rs.getString("es_puesto"));
                p.setId_puesto(rs.getString("id_puesto"));
                p.setId_seccion(rs.getString("id_seccion"));
                p.setNo_corto_pu(rs.getString("no_corto_pu"));
                p.setNo_puesto(rs.getString("no_puesto"));
                list.add(p);
            }
        } catch (SQLException e) {
        }finally{
        this.conn.close();
        }        
      return list; 
    }

    @Override
    public List<Puesto> List_Id_Puesto(String id_puesto) {
       this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from rhtr_puesto where id_puesto = '"+id_puesto+"' ";
        List<Puesto> list= new ArrayList<Puesto>();
        try {
            ResultSet rs = this.conn.query(sql);
            Puesto p = new Puesto();
            while (rs.next()) {                
                p.setCo_grupo(rs.getString("co_grupo"));
                p.setEs_puesto(rs.getString("es_puesto"));
                p.setId_puesto(rs.getString("id_puesto"));
                p.setId_seccion(rs.getString("id_seccion"));
                p.setNo_corto_pu(rs.getString("no_corto_pu"));
                p.setNo_puesto(rs.getString("no_puesto"));
                list.add(p);
            }
        } catch (SQLException e) {
        }finally{
        this.conn.close();
        }        
      return list;
    }

    @Override
    public boolean Modif_Puesto(String id_puesto,String no_puesto, String no_corto_pu,String es_puesto,String id_seccion,String co_grupo) {
        this.conn= FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "update rhtr_puesto set no_puesto = '"+no_puesto+", no_corto_pu'= '"+no_corto_pu+",es_puesto = '"+es_puesto+",id_seccion = '"+id_seccion+" where id_puesto == '"+id_puesto+" ";
        try {
            ResultSet rs = this.conn.query("sql");
            rs.next();
            boolean modif = false;
        } catch (SQLException e) {
        }finally{
         this.conn.close();
        }
        return true;
    }

    
    
    
}
