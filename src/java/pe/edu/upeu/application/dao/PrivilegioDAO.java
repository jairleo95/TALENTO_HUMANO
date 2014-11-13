/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfacePrivilegioDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Privilegio;

/**
 *
 * @author Admin
 */
public class PrivilegioDAO implements InterfacePrivilegioDAO{
    ConexionBD conn;
    
    @Override
    public boolean Insert_Privilegio() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Insert_Proceso() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Insert_Detalle_Privilegio() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Privilegio> List_Privilegio() {
        this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from rhtv_privilegio order by id_privilegio ";
        List<Privilegio> list= new ArrayList<Privilegio>();
        try {
            ResultSet rs = this.conn.query(sql);
            
            while (rs.next()) {   
                Privilegio p = new Privilegio();
                p.setDi_url(rs.getString("di_url"));
                p.setEs_privilegio(rs.getString("es_privilegio"));
                p.setId_privilegio(rs.getString("id_privilegio"));
                p.setNo_link(rs.getString("no_link"));
                list.add(p);
            }
        } catch (SQLException e) {
        }finally{
        this.conn.close();
        }        
      return list;
    }

    @Override
    public void Desactivar_Privilegio(String id_Priv) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_DESACTIVAR_PRIV(?)}");
            cst.setString(1, id_Priv);
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.conn.close();
        }
    }

    @Override
    public void Activar_Privilegio(String id_Priv) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_ACTIVAR_PRIV(?)}");
            cst.setString(1, id_Priv);
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.conn.close();
        }
        
    }
    
}
