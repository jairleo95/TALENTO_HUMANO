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
import pe.edu.upeu.application.dao_imp.InterfaceReporte_HistorialDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author Andres
 */
public class Reporte_HistorialDAO implements InterfaceReporte_HistorialDAO {

    ConexionBD cnn;

    @Override
    public List<Map<String, ?>> Listar_Tra_Fecha(String FE_INICIO, String FE_FIN) {
        String adday = "+0";
        List<Map<String, ?>> Lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            if (FE_INICIO.equals(FE_FIN)) {
                adday = "+1";
            }
            String sql = "SELECT ID_TRABAJADOR, NO_TRABAJADOR, AP_PATERNO, AP_MATERNO, COUNT(*) CANT_M\n"
                    + "FROM RHTH_MODIF_TRABAJADOR\n"
                    + "WHERE FE_MODIF >= TO_DATE('" + FE_INICIO + "') AND FE_MODIF <= TO_DATE('" + FE_FIN + "') " + adday + " \n"
                    + "GROUP BY ID_TRABAJADOR,NO_TRABAJADOR, AP_PATERNO, AP_MATERNO";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<>();
                rec.put("id_tra", rs.getString("ID_TRABAJADOR"));
                rec.put("no_tra", rs.getString("NO_TRABAJADOR"));
                rec.put("ap_pat", rs.getString("AP_PATERNO"));
                rec.put("ap_mat", rs.getString("AP_MATERNO"));
                rec.put("cant_mod", rs.getString("CANT_M"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }

    public List<Map<String, ?>> List_historial_modf_hijo(String FE_INICIO, String FE_FIN, String tipo) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * FROM RHVD_HISTORIAL_MOD_HIJO WHERE FE_FILTRO_TODO BETWEEN TO_DATE('" + FE_INICIO.trim() + "') AND TO_DATE('" + FE_FIN.trim() + "') ORDER BY FE_FILTRO_TODO";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_datos_hijos_trabajador"));
                rec.put("idtr", rs.getString("id_trabajador"));
                rec.put("no_tra", rs.getString("NO_TRABAJADOR_T"));
                rec.put("ap_pat_t", rs.getString("AP_PATERNO_T"));
                rec.put("ap_mat_t", rs.getString("AP_MATERNO_T"));
                rec.put("no_hijo", rs.getString("NO_HIJO_TRABAJADOR"));
                rec.put("ap_pat_h", rs.getString("AP_PATERNO"));
                rec.put("ap_mat_h", rs.getString("AP_MATERNO"));
                rec.put("estado_filtro", rs.getString("ESTADO_REGISTRO"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }

}
