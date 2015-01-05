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

import pe.edu.upeu.application.dao_imp.InterfaceAreaDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Area;

/**
 *
 * @author Admin
 */
public class AreaDAO implements InterfaceAreaDAO {

    ConexionBD conn;

    @Override
    public List<Area> List_Area() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from rhtd_area ";
        List<Area> list = new ArrayList<Area>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Area a = new Area();
                a.setId_area(rs.getString("id_area"));
                a.setEs_area(rs.getString("es_area"));
                a.setId_departamento(rs.getString("id_departamento"));
                a.setNo_area(rs.getString("no_area"));
                a.setNo_corto_area(rs.getString("no_corto_area"));
                list.add(a);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Area> List_Area_ID(String id_departamento) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from rhtd_area ";
        sql += (id_departamento != "") ? "where id_departamento='" + id_departamento + "'" : "";
        List<Area> list = new ArrayList<Area>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Area a = new Area();
                a.setId_area(rs.getString("id_area"));
                a.setEs_area(rs.getString("es_area"));
                a.setId_departamento(rs.getString("id_departamento"));
                a.setNo_area(rs.getString("no_area"));
                a.setNo_corto_area(rs.getString("no_corto_area"));
                list.add(a);
            }

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Map<String, ?>> List_area_id_json(String id_dep) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "Select * from rhtd_area where id_departamento='"+id_dep.trim()+"' order by no_area";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_area"));
                rec.put("nom", rs.getString("no_area"));
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
    public List<Map<String, ?>> selec_area(String id_pu) {
       List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT ID_AREA FROM RHTR_SECCION where ID_SECCION=(SELECT ID_SECCION from RHTR_PUESTO where ID_PUESTO='"+id_pu.trim()+"')";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_area"));
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
