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
import pe.edu.upeu.application.model.Privilegio_Rol;
import pe.edu.upeu.application.model.V_Privilegio_Rol;

/**
 *
 * @author Admin
 */
public class PrivilegioDAO implements InterfacePrivilegioDAO{
    ConexionBD conn;
    
    @Override
    public void Insert_Privilegio(String No_Link, String Di_url, String Es_privilegio,String Ic_Link) {
        CallableStatement cst;
        try {
            String id_Priv="";
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_PRIV(?,?,?,?,?)}");
            cst.setString(1, id_Priv);
            cst.setString(2, No_Link);
            cst.setString(3, Di_url);
            cst.setString(4, Es_privilegio);
            cst.setString(5, Ic_Link);
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.conn.close();
        }
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

    @Override
    public void Mod_Priv(String id_Priv,String No_link,String Es_priv,String Di_url,String ic_link) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_PRIV(?,?,?,?,?)}");
            cst.setString(1, id_Priv);
            cst.setString(2, No_link );
            cst.setString(3, Es_priv);
            cst.setString(4, Di_url);
            cst.setString(5, ic_link);
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.conn.close();
        }
    }

    @Override
    public List<Privilegio> List_Pri_Id(String id_Priv) {
         this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from rhtv_privilegio where ID_PRIVILEGIO='"+id_Priv +"' ";
        List<Privilegio> list= new ArrayList<Privilegio>();
        try {
            ResultSet rs = this.conn.query(sql);
            
            while (rs.next()) {   
                Privilegio p = new Privilegio();
                p.setDi_url(rs.getString("di_url"));
                p.setEs_privilegio(rs.getString("es_privilegio"));
                p.setId_privilegio(rs.getString("id_privilegio"));
                p.setNo_link(rs.getString("no_link"));
                p.setIc_link(rs.getString("ic_link"));
                list.add(p);
            }
        } catch (SQLException e) {
        }finally{
        this.conn.close();
        }        
      return list;
    }

    @Override
    public void Eliminar_Privilegio(String id_Priv) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_ELIMINAR_PRIV(?)}");
            cst.setString(1, id_Priv);
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.conn.close();
        }
    }

    @Override
    public List<V_Privilegio_Rol> List_Pr_Rol() {
        this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from RHVD_PRIVILEGIO_ROL order by no_rol";
        List<V_Privilegio_Rol> list= new ArrayList<V_Privilegio_Rol>();
        try {
            ResultSet rs = this.conn.query(sql);
            
            while (rs.next()) {   
                V_Privilegio_Rol p = new V_Privilegio_Rol();
                p.setNo_rol(rs.getString("no_rol"));
                p.setNo_link(rs.getString("no_link"));
                p.setEs_detalle_privilegio(rs.getString("es_detalle_privilegio"));
                p.setId_detalle_privilegio(rs.getString("id_detalle_privilegio"));
                list.add(p);
            }
        } catch (SQLException e) {
        }finally{
        this.conn.close();
        }        
      return list;
    }
    
}
