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

            String sql = " select * from RHVD_HISTORIAL_ES_CIVIL  h1 where h1.FE_MODIFICACION = (select  max(h2.FE_MODIFICACION) from RHVD_HISTORIAL_ES_CIVIL h2 where h1.ID_TRABAJADOR = h2.ID_TRABAJADOR )  and h1.FE_MODIFICACION >= TO_DATE('" + FE_INICIO + "') AND h1.FE_MODIFICACION <= TO_DATE('" + FE_FIN + "') " + adday + " ";

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
            String sql = "SELECT ID_TRABAJADOR,TO_CHAR(FE_MODIF,'DD/MM/YYYY HH:MI:SS')FE_MODIFI, US_MODIF, IP_USUARIO\n"
                    + "FROM RHTH_MODIF_TRABAJADOR\n"
                    + "WHERE ID_TRABAJADOR='" + ID_TRABAJADOR + "' AND FE_MODIF IS NOT NULL\n"
                    + "ORDER BY FE_MODIFi desc";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<>();
                rec.put("id_tra", rs.getString(1));
                rec.put("fe_mod", rs.getString(2));
                rec.put("us_mod", rs.getString(3));
                /*ip = ip_usuario(rs.getString("ID_TRABAJADOR"));
                 rec.put("ip_user", ip.get(0).get("IP0"));
                 rec.put("host_name", ip.get(0).get("IP1"));
                 rec.put("mac_address", ip.get(0).get("IP2"));*/
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

    @Override
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

    @Override
    public List<Map<String, ?>> list_fecha_modif(String Hijo) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  to_char(FE_FILTRO_TODO,'dd/mm/yyyy hh:mm:ss') as FE_FILTRO_TODO  from RHVD_HISTORIAL_MOD_HIJO where ID_DATOS_HIJOS_TRABAJADOR='" + Hijo + "'";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
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

    @Override
    public List<Map<String, ?>> Lista_campos_modif(String fecha1, String fecha2, String id) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * FROM RHVD_HISTORIAL_MOD_HIJO where ID_DATOS_HIJOS_TRABAJADOR='" + id + "' and to_char(FE_FILTRO_TODO,'dd/mm/yyyy hh:mm:ss') ='" + fecha1.trim() + "' or to_char(FE_FILTRO_TODO,'dd/mm/yyyy hh:mm:ss') ='" + fecha2.trim() + "' ";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("ap_p", rs.getString("ap_paterno"));
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

    @Override
    public List<Map<String, ?>> Listar_hist_fecha(String FE_MODIF) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT *\n"
                    + "FROM RHTH_MODIF_TRABAJADOR\n"
                    + "WHERE ID_TRABAJADOR='TRB-002529'\n"
                    + "AND (TO_CHAR(FE_MODIF,'DD/MM/YYYY HH:MI:SS')\n"
                    + "=TO_CHAR(TO_DATE('" + FE_MODIF + "','DD/MM/YYYY HH:MI:SS'),'DD/MM/YYYY HH:MI:SS') )";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                for (int i = 1; i < 73; i++) {
                    rec.put("col" + i, rs.getString(i));
                }
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

    @Override
    public List<Map<String, ?>> Listar_dat_actual(String ID_TRABAJADOR) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
