/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfaceCarrera_UniversidadDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author JAIR
 */
public class Carrera_UniversidadDAO implements InterfaceCarrera_UniversidadDAO {

    ConexionBD conn;

    @Override
    public List<Map<String, ?>> Tipo_Institucion(String id_reg) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select id_tipo_institucion,no_tipo_institucion,co_regimen  from rhtr_tipo_institucion where trim(co_regimen)='" + id_reg.trim() + "'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                String cuenta = rs.getString("no_tipo_institucion");
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_tipo_institucion"));
                rec.put("descripcion", cuenta);
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
    public List<Map<String, ?>> Istitucion(String id) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select id_universidad,no_universidad  from rhtx_universidad where trim(id_tipo_institucion)='" + id.trim() + "' ORDER BY no_universidad asc ";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                String cuenta = rs.getString("no_universidad");
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_universidad"));
                rec.put("descripcion", cuenta);
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR: ...");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }

    @Override
    public List<Map<String, ?>> Carrera(String id) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select uc.id_universidad_carrera,trim(c.no_carrera) as no_carrera  from rhtx_carrera c , rhtx_universidad_carrera uc where trim(uc.id_carrera) = trim(c.id_carrera) and trim(uc.id_universidad)='" + id.trim() + "' order by no_carrera asc";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                String cuenta = rs.getString("no_carrera");
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_universidad_carrera"));
                rec.put("descripcion", cuenta);
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR: ...");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }
}
