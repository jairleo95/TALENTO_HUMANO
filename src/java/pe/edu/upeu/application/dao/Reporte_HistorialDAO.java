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

    @Override
    public List<Map<String, ?>> Listar_His_Estado_Civil(String FE_INICIO, String FE_FIN) {
        String adday = "+0";
        List<Map<String, ?>> Lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            if (FE_INICIO.equals(FE_FIN)) {
                adday = "+1";
            }
            String sql = "select  tr.ID_TRABAJADOR ID_TRABAJADOR, tr.NO_TRABAJADOR NO_TRABAJADOR, tr.AP_MATERNO AP_MATERNO, tr.AP_PATERNO AP_PATERNO ,tr.ES_CIVIL ES_CIVIL , ec.LI_ESTADO_CIVIL LI_ESTADO_CIVIL , u.NO_USUARIO NO_USUARIO, ec.FE_MODIFICACION FE_MODIFICACION   \n"
                    + " from RHTM_TRABAJADOR tr , RHTH_ESTADO_CIVIL ec , RHTC_USUARIO u \n"
                    + " where tr.ID_TRABAJADOR = ec.ID_TRABAJADOR \n"
                    + "and ec.US_MODIFICACION = u.ID_USUARIO \n"
                    + " and ec.FE_MODIFICACION >= TO_DATE('" + FE_INICIO + "') AND ec.FE_MODIFICACION <= TO_DATE('" + FE_FIN + "')  " + adday + " ";

            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<>();
                rec.put("id_tra", rs.getString("ID_TRABAJADOR"));
                rec.put("no_tra", rs.getString("NO_TRABAJADOR"));
                rec.put("ap_pat", rs.getString("AP_PATERNO"));
                rec.put("ap_mat", rs.getString("AP_MATERNO"));
                rec.put("es_civil_a", rs.getString("ES_CIVIL"));
                rec.put("es_civil_p", rs.getString("LI_ESTADO_CIVIL"));
                rec.put("no_usuario", rs.getString("NO_USUARIO"));
                rec.put("fe_modi", rs.getString("FE_MODIFICACION"));
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

    @Override
    public List<Map<String, ?>> Listar_Mod_Tra(String ID_TRABAJADOR) {
        List<Map<String, ?>> Lista = new ArrayList<>();
        List<Map<String, ?>> ip = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT ID_TRABAJADOR, FE_MODIF,TO_CHAR(FE_MODIF,'HH:MM:SS')HORA_MODIF, US_MODIF, IP_USUARIO\n"
                    + "FROM RHTH_MODIF_TRABAJADOR\n"
                    + "WHERE ID_TRABAJADOR='" + ID_TRABAJADOR + "'\n"
                    + "ORDER BY FE_MODIF DESC";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<>();
                rec.put("id_tra", rs.getString("ID_TRABAJADOR"));
                rec.put("fe_mod", rs.getString("FE_MODIF"));
                rec.put("hora_mod", rs.getString("HORA_MODIF"));
                rec.put("us_mod", rs.getString("US_MODIF"));
                ip = ip_usuario(rs.getString("ID_TRABAJADOR"));
                rec.put("ip_user", ip.get(0).get("IP0"));
                rec.put("host_name", ip.get(0).get("IP1"));
                rec.put("mac_address", ip.get(0).get("IP2"));
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

    @Override
    public List<Map<String, ?>> ip_usuario(String IP_USUARIO) {
        List<Map<String, ?>> Lista = new ArrayList<>();
        int cont = 0;
        for (int i = 0; i < IP_USUARIO.length(); i++) {
            Map<String, Object> rec = new HashMap<>();
            if (IP_USUARIO.charAt(i) == '*' && IP_USUARIO.charAt(i + 1) == '*') {
                rec.put("IP" + cont, IP_USUARIO.substring(0, i));
                IP_USUARIO = IP_USUARIO.substring(0, i + 2);
                Lista.add(rec);
                cont++;
            }

        }

        return Lista;
    }

    public List<Map<String, ?>> List_historial_modf_hijo(String FE_INICIO, String FE_FIN, String tipo) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * FROM RHVD_HISTORIAL_MOD_HIJO WHERE  us_creacion is not null ";
            if (tipo.equals("2")) {
                sql += " and  ESTADO_REGISTRO ='0' and fe_creacion BETWEEN TO_DATE('" + FE_INICIO.trim() + "') AND TO_DATE('" + FE_FIN.trim() + "')  ";
            } else if (tipo.equals("3")) {
                sql += " and  ESTADO_REGISTRO ='1'  and fe_modif BETWEEN TO_DATE('" + FE_INICIO.trim() + "') AND TO_DATE('" + FE_FIN.trim() + "') ";
            } else if (tipo.equals("1")) {
                sql += " and FE_FILTRO_TODO BETWEEN TO_DATE('" + FE_INICIO.trim() + "') AND TO_DATE('" + FE_FIN.trim() + "') ";
            } 
            sql += " ORDER BY FE_FILTRO_TODO";
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
                rec.put("fecha", rs.getString("FE_FILTRO_TODO"));
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
