/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfaceSeccionDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Seccion;

/**
 *
 * @author Jose
 */
public class SeccionDAO implements InterfaceSeccionDAO{
    ConexionBD conn;
    @Override
    public List<Seccion> LISTA_RH_SECCION() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHTR_SECCION ORDER BY ID_SECCION ASC";
        List<Seccion> list = new ArrayList<Seccion>();
        try {
            ResultSet rs = this.conn.query(sql);
          
            while (rs.next()) {
                  Seccion n = new Seccion();
                n.setId_seccion(rs.getString("id_seccion"));
                n.setId_area(rs.getString("id_area"));
                n.setEs_seccion(rs.getString("es_seccion"));
                n.setNo_seccion(rs.getString("no_seccion"));
                n.setNo_corto_sec(rs.getString("No_corto_sec"));
                list.add(n);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public String ID_SECCION(String id_puesto) {
        this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql="select ID_SECCION from   RHTR_PUESTO  where ID_PUESTO='"+ id_puesto.trim() +"'";
        String id_sec = null;
        try {
            ResultSet rs=this.conn.query(sql);
            while(rs.next()){
                id_sec=rs.getString("ID_SECCION");
            }
        } catch (SQLException e) {
        }finally{
            this.conn.close();
        }
        return id_sec;
    }

    @Override
    public List<Map<String, ?>> List_sec_id(String id_are) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select * from RHTR_SECCION where ID_AREA='"+id_are.trim()+"' order by no_seccion ";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_seccion"));
                rec.put("nom", rs.getString("no_seccion"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }

    @Override
    public List<Map<String, ?>> List_pu_id(String id_pu) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * from RHTR_PUESTO where ID_PUESTO='"+ id_pu.trim() +"'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_seccion"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }

    @Override
    public List<Map<String, ?>> selec_sec(String id_pu) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT ID_SECCION from RHTR_PUESTO where ID_PUESTO='"+id_pu.trim()+"'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_seccion"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }

    @Override
    public List<Map<String, ?>> List_sec_ida(String id_are) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select * from RHTR_SECCION where ID_AREA='"+id_are.trim()+"' order by no_seccion ";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_seccion"));
                rec.put("nombre", rs.getString("no_seccion"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }
    
}
