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
import pe.edu.upeu.application.dao_imp.InterfaceDepartamentoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Departamento;

/**
 *
 * @author Admin
 */
public class DepartamentoDao implements InterfaceDepartamentoDAO{
    ConexionBD conn;
    
    @Override
    public List<Departamento> List_Departamento() {
        this.conn= FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtx_departamento";
        List<Departamento> list = new ArrayList<Departamento>();
        try {
            ResultSet rs = this.conn.query(sql);
            Departamento d = new Departamento();
            while (rs.next()) {                
                d.setEs_departamento(rs.getString("es_departamento"));
                d.setId_departamento(rs.getString("id_departamento"));
                d.setId_direccion(rs.getString("id_direccion"));
                d.setNo_corto_dep(rs.getString("no_corto_dep"));
                d.setNo_dep(rs.getString("no_dep"));
            }
        } catch (SQLException e) {
        }finally{
        this.conn.close();
        }
        return list;
    }

    @Override
    public List<Map<String, ?>> List_departamento_2() {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select * from rhtx_departamento order by no_dep";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_departamento"));
                rec.put("nom", rs.getString("no_dep"));
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
    public List<Map<String, ?>> dep_id(String id_pu) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT ID_DEPARTAMENTO FROM RHTD_AREA WHERE ID_AREA=(SELECT ID_AREA FROM RHTR_SECCION where ID_SECCION=(SELECT ID_SECCION from RHTR_PUESTO where ID_PUESTO='"+id_pu.trim()+"'))";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_departamento"));
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
