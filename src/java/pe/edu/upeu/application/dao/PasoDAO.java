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
import pe.edu.upeu.application.dao_imp.InterfacePasoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author JAIR
 */
public class PasoDAO implements InterfacePasoDAO {

    ConexionBD conn;
    CConversion c = new CConversion();

    @Override
    public List<Map<String, ?>> List_Paso_Habilitado(String Proceso) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select * from rhtc_pasos where  es_pasos='1' ";
            sql += (Proceso != null) ? " and   id_proceso='" + Proceso + "'" : "";
            sql += " order by  to_number(substr( nu_pasos,2,length(nu_pasos))) ";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {

                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_pasos"));
                rec.put("proceso_id", rs.getString("id_proceso"));
                rec.put("det", rs.getString("de_pasos"));
                rec.put("num", rs.getString("nu_pasos"));
                rec.put("co", rs.getString("co_pasos"));

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
    public List<Map<String, ?>> List_Paso_x_Puesto(String id) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select d.*,u.no_usuario  from (\n"
                    + "select  pd.* ,p.ID_PASOS from RHTD_DETALLE_PASOS p , RHVD_PUESTO_DIRECCION pd where pd.ID_PUESTO = p.ID_PUESTO and p.ES_DETALLE_PASOS='1') d  left outer join  rhvd_usuario u on( u.ID_PUESTO = d.ID_PUESTO) where d.ID_PASOS='"+id+"' ";

            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {

                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_puesto"));
                rec.put("dep", rs.getString("no_dep"));
                rec.put("puesto", rs.getString("no_puesto"));
                rec.put("area", rs.getString("no_area"));
                rec.put("direccion", rs.getString("no_direccion"));
                rec.put("usuario", rs.getString("no_usuario"));

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
    public void INSERT_PASOS(String ID_PASOS, String ID_PROCESO, String DE_PASOS, String NU_PASOS, String CO_PASOS) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PASOS( ?, ?, ?, ?, ? )} ");
            cst.setString(1, null);
            cst.setString(2, ID_PROCESO);
            cst.setString(3, DE_PASOS);
            cst.setString(4, NU_PASOS);
            cst.setString(5, CO_PASOS);
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.conn.close();
        }
    }

    @Override
    public void DELETE_PASOS(String ID_PASOS) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = " DELETE FROM RHTC_PASOS WHERE ID_PASOS='" + ID_PASOS.trim() + "'";
            this.conn.ejecutar(sql);
        } catch (Exception e) {
            this.conn.close();
        }

    }

    @Override
    public void UPDATE_NU_PASO(String ID_PASO, String NU_PASO) {

        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = " UPDATE RHTC_PASOS SET NU_PASOS='" + NU_PASO.trim() + "' WHERE ID_PASOS='" + ID_PASO.trim() + "'";
            this.conn.ejecutar(sql);
        } catch (Exception e) {
            this.conn.close();
        }
    }

}
