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
import pe.edu.upeu.application.dao_imp.InterfaceProcesoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author ALFA 3
 */
public class ProcesoDAO implements InterfaceProcesoDAO {

    ConexionBD conn;
    CConversion c = new CConversion();

    @Override
    public List<Map<String, ?>> List_Proceso() {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select * from rhtv_proceso where es_proceso='1'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {

                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_proceso"));
                rec.put("nombre", rs.getString("no_proceso"));
                rec.put("desc", rs.getString("de_proceso"));
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
    public List<Map<String, ?>> List_Pro_Paso_Id(String id_req, String id_pro, String id_dir, String id_dep, String id_area,String id_ti_planilla) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  *  from rhvd_requerimiento_proceso where ES_REQ_PROCESO is not null ";
            if (id_req != null) {
                sql += (!"".equals(id_req)) ? " and  ID_REQUERIMIENTO = '" + id_req + "'" : "";
            }
            if (id_pro != null) {
                sql += (!"".equals(id_pro)) ? " and  ID_PROCESO = '" + id_pro + "'" : "";
            }
            if (id_dir != null) {
                sql += (!"".equals(id_dir)) ? " and  ID_DIRECCION = '" + id_dir + "'" : "";
            }
            if (id_dep != null) {
                sql += (!"".equals(id_dep)) ? " and  ID_DEPARTAMENTO = '" + id_dep + "'" : "";
            }
            if (id_area != null) {
               sql += (!"".equals(id_area)) ? " and  ID_AREA = '" + id_area + "'" : "";
            }
            if (id_ti_planilla != null) {
               sql += (!"".equals(id_ti_planilla)) ? " and  ID_TIPO_PLANILLA = '" + id_ti_planilla + "'" : "";
            }

            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_DETALLE_REQ_PROCESO"));
                rec.put("id_req", rs.getString("ID_REQUERIMIENTO"));
                rec.put("id_pro", rs.getString("ID_PROCESO"));
                rec.put("id_dir", rs.getString("ID_DIRECCION"));
                rec.put("id_dep", rs.getString("ID_DEPARTAMENTO"));
                rec.put("id_area", rs.getString("ID_AREA"));
                rec.put("id_ti_planilla", rs.getString("ID_TIPO_PLANILLA"));
                rec.put("ti_planilla", rs.getString("TI_PLANILLA"));
                rec.put("req", rs.getString("NO_REQ"));
                rec.put("proceso", rs.getString("NO_PROCESO"));
                rec.put("dep", rs.getString("NO_DEP"));
                rec.put("dir", rs.getString("NO_DIRECCION"));
                rec.put("area", rs.getString("NO_AREA"));
                rec.put("estado", rs.getString("ES_REQ_PROCESO"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;

    }

}
