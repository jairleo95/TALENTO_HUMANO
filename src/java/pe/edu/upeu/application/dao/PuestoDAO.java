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
import pe.edu.upeu.application.model.V_Puesto_Direccion;

/**
 *
 * @author Admin
 */
public class PuestoDAO implements InterfacePuestoDAO {

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
    public List<Puesto> List_Puesto() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_puesto,no_puesto,no_corto_pu,es_puesto,id_seccion,co_grupo from rhtr_puesto ORDER BY no_puesto ASC";
        List<Puesto> list = new ArrayList<Puesto>();
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
        } finally {
            this.conn.close();
        }
        return list;
    }
 @Override
    public List<V_Puesto_Direccion> List_Puesto_Dep(String id_departamento) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select  * from RHVD_PUESTO_DIRECCION where id_departamento='"+id_departamento.trim()+"' ORDER BY no_puesto,no_seccion,no_area ASC";
        List<V_Puesto_Direccion> list = new ArrayList<V_Puesto_Direccion>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Puesto_Direccion  p = new V_Puesto_Direccion();
                p.setNo_direccion(rs.getString("no_direccion"));
                p.setId_direccion(rs.getString("id_direccion"));
                p.setNo_dep(rs.getString("no_dep"));
                p.setId_departamento(rs.getString("id_departamento"));
                p.setNo_area(rs.getString("no_area"));
                p.setId_area(rs.getString("id_area"));
                p.setNo_seccion(rs.getString("no_seccion"));
                p.setId_seccion(rs.getString("id_seccion"));
                p.setNo_puesto(rs.getString("no_puesto"));
                p.setId_puesto(rs.getString("id_puesto"));
                list.add(p);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }
 @Override
    public List<V_Puesto_Direccion> List_Det_Puesto() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select  * from RHVD_PUESTO_DIRECCION ";
        List<V_Puesto_Direccion> list = new ArrayList<V_Puesto_Direccion>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Puesto_Direccion  p = new V_Puesto_Direccion();
                p.setId_area(rs.getString("id_area"));
                p.setId_departamento(rs.getString("id_departamento"));
                p.setId_direccion(rs.getString("id_direccion"));
                p.setId_puesto(rs.getString("id_puesto"));
                p.setId_seccion(rs.getString("id_seccion"));
                p.setNo_area(rs.getString("no_area"));
                p.setNo_dep(rs.getString("no_dep"));
                p.setNo_direccion(rs.getString("no_direccion"));
                p.setNo_puesto(rs.getString("no_puesto"));
                p.setNo_seccion(rs.getString("no_seccion"));
                
                list.add(p);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }
    @Override
    public List<Puesto> List_Id_Puesto(String id_puesto) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from rhtr_puesto where id_puesto = '" + id_puesto + "' ";
        List<Puesto> list = new ArrayList<Puesto>();
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
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public boolean Modif_Puesto(String id_puesto, String no_puesto, String no_corto_pu, String es_puesto, String id_seccion, String co_grupo) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "update rhtr_puesto set no_puesto = '" + no_puesto + ", no_corto_pu'= '" + no_corto_pu + ",es_puesto = '" + es_puesto + ",id_seccion = '" + id_seccion + " where id_puesto == '" + id_puesto + " ";
        try {
            ResultSet rs = this.conn.query("sql");
            rs.next();
            boolean modif = false;
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return true;
    }

}
