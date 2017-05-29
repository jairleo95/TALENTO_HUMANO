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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    public void Insert_Privilegio(String No_Link, String Di_url, String Es_privilegio,String Ic_Link,String Modulo) {
        CallableStatement cst;
        try {
            String id_Priv="";
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_PRIV(?,?,?,?,?,?)}");
            cst.setString(1, id_Priv);
            cst.setString(2, No_Link.trim());
            cst.setString(3, Di_url.trim());
            cst.setString(4, Es_privilegio.trim());
            cst.setString(5, Ic_Link.trim());
            cst.setString(6, Modulo.trim());
            cst.execute();
        } catch (SQLException ex) {
            System.out.println(ex);
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
        String sql = "Select p.ID_PRIVILEGIO , p.NO_LINK , p.IC_LINK, p.ES_PRIVILEGIO, p.DI_URL, m.NO_MODULO from rhtv_privilegio p,RHTV_MODULO m where p.ID_MODULO =m.ID_MODULO order by m.NO_MODULO,p.NO_LINK";
        List<Privilegio> list= new ArrayList<Privilegio>();
        try {
            ResultSet rs = this.conn.query(sql);
            
            while (rs.next()) {   
                Privilegio p = new Privilegio();
                p.setDi_url(rs.getString("DI_URL"));
                p.setEs_privilegio(rs.getString("ES_PRIVILEGIO"));
                p.setId_privilegio(rs.getString("ID_PRIVILEGIO"));
                p.setNo_link(rs.getString("NO_LINK"));
                p.setNo_modulo(rs.getString("NO_MODULO"));
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
        String sql = "Select * from rhtv_privilegio where ID_PRIVILEGIO='"+id_Priv.trim() +"'";
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

    @Override
    public List<Map<String, ?>> List_Priv() {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "Select * from rhtv_privilegio order by NO_LINK";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id_prv", rs.getString("ID_PRIVILEGIO"));
                rec.put("no_prv", rs.getString("NO_LINK"));
                rec.put("di_prv", rs.getString("DI_URL"));
                rec.put("es_prv", rs.getString("ES_PRIVILEGIO"));
                rec.put("ic_prv", rs.getString("IC_LINK"));
                rec.put("id_m_prv", rs.getString("ID_MODULO"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }

    @Override
    public List<Map<String, ?>> List_Priv_Mod() {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT m.ID_MODULO,m.NO_MODULO,m.ES_MODULO,p.ID_PRIVILEGIO,p.NO_LINK,p.ES_PRIVILEGIO FROM RHTV_PRIVILEGIO p, RHTV_MODULO m WHERE p.ID_MODULO = m.ID_MODULO ORDER by m.ID_MODULO, p.NO_LINK ";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id_md", rs.getString("ID_MODULO"));
                rec.put("no_md", rs.getString("NO_MODULO"));
                rec.put("es_md", rs.getString("ES_MODULO"));
                rec.put("id_pr", rs.getString("ID_PRIVILEGIO"));
                rec.put("no_pr", rs.getString("NO_LINK"));
                rec.put("es_pr", rs.getString("ES_PRIVILEGIO"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println("error sql" + e);
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }

    @Override
    public List<Map<String, ?>> List_Priv_Mod_x_id(String id_mod) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT m.ID_MODULO,m.NO_MODULO,m.ES_MODULO,p.ID_PRIVILEGIO,p.NO_LINK,p.ES_PRIVILEGIO FROM RHTV_PRIVILEGIO p,RHTV_MODULO m WHERE m.ID_MODULO=p.ID_MODULO and m.ID_MODULO='"+id_mod.trim()+"' ORDER by p.NO_LINK";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id_md", rs.getString("ID_MODULO"));
                rec.put("no_md", rs.getString("NO_MODULO"));
                rec.put("es_md", rs.getString("ES_MODULO"));
                rec.put("id_pr", rs.getString("ID_PRIVILEGIO"));
                rec.put("no_pr", rs.getString("NO_LINK"));
                rec.put("es_pr", rs.getString("ES_PRIVILEGIO"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }

    @Override
    public List<Map<String, ?>> List_Modulo() {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select ID_MODULO, NO_MODULO from RHTV_MODULO";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id_md", rs.getString("ID_MODULO"));
                rec.put("no_md", rs.getString("NO_MODULO"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }
    
}
