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
import pe.edu.upeu.application.dao_imp.InterfaceUbigeoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Ub_Departamento;
import pe.edu.upeu.application.model.Ub_Distrito;
import pe.edu.upeu.application.model.Ub_Provincia;
import pe.edu.upeu.application.model.V_Ubigeo;

/**
 *
 * @author Admin
 */
public class UbigeoDAO implements InterfaceUbigeoDAO {

    ConexionBD conn;

    @Override
    public List<V_Ubigeo> List_Distrito() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhvd_Ubigeo ";
        List<V_Ubigeo> list = new ArrayList<V_Ubigeo>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Ubigeo vp = new V_Ubigeo();
                vp.setId_distrito(rs.getString("id_distrito"));
                vp.setNo_departamento(rs.getString("no_departamento"));
                vp.setNo_distrito(rs.getString("no_distrito"));
                vp.setNo_provincia(rs.getString("no_provincia"));
                list.add(vp);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Ub_Provincia> List_Provincia() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtx_ub_provincia order by no_provincia";
        List<Ub_Provincia> list = new ArrayList<Ub_Provincia>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Ub_Provincia p = new Ub_Provincia();

                p.setId_provincia(rs.getString("id_provincia"));
                p.setNo_provincia(rs.getString("no_provincia"));
                p.setId_departamento(rs.getString("id_departamento"));
                p.setCo_provincia(rs.getString("co_provincia"));
                list.add(p);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Ub_Departamento> List_Departamento() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtx_ub_departamento order by no_departamento";
        List<Ub_Departamento> list = new ArrayList<Ub_Departamento>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Ub_Departamento d = new Ub_Departamento();
                d.setId_departamento(rs.getString("id_departamento"));
                d.setNo_departamento(rs.getString("no_departamento"));
                list.add(d);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Map<String, ?>> Provincia(String id) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select id_provincia,no_provincia from rhtx_ub_provincia";
            sql += (!id.equals("")) ? " where id_departamento='" + id.trim() + "'" : "";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> l = new HashMap<String, Object>();
                l.put("id", rs.getString("id_provincia"));
                l.put("descripcion", rs.getString("no_provincia"));
                lista.add(l);
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
        return lista;
    }

    @Override
    public List<Map<String, ?>> Distrito(String id) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select id_distrito,no_distrito from rhtx_ub_distrito ";

            sql += (!id.equals("")) ? " where id_provincia='" + id.trim() + "'" : "";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> l = new HashMap<String, Object>();
                l.put("id", rs.getString("id_distrito"));
                l.put("descripcion", rs.getString("no_distrito"));
                lista.add(l);
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
        return lista;
    }

    @Override
    public List<Ub_Distrito> List_DistritoTra() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtx_ub_distrito order by no_distrito";
        List<Ub_Distrito> list = new ArrayList<Ub_Distrito>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Ub_Distrito d = new Ub_Distrito();
                d.setId_distrito(rs.getString("id_distrito"));
                d.setNo_distrito(rs.getString("no_distrito"));
                d.setId_provincia(rs.getString("id_provincia"));
                list.add(d);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

}
