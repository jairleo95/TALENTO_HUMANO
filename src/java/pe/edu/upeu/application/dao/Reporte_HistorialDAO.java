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

            String sql = " select * from RHVD_HISTORIAL_ES_CIVIL  h1 where h1.FE_MODIFICACION = (select  max(h2.FE_MODIFICACION) from RHVD_HISTORIAL_ES_CIVIL h2 where h1.ID_TRABAJADOR = h2.ID_TRABAJADOR )  and h1.FE_MODIFICACION >= TO_CHAR('" + FE_INICIO + "') AND h1.FE_MODIFICACION <= TO_CHAR('" + FE_FIN + "')";

            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<>();
                rec.put("id_ec", rs.getString("ID_ESTADO_CIVIL"));
                rec.put("id_tra", rs.getString("ID_TRABAJADOR"));
                rec.put("no_tra", rs.getString("NO_TRABAJADOR"));
                rec.put("ap_pat", rs.getString("AP_PATERNO"));
                rec.put("ap_mat", rs.getString("AP_MATERNO"));
                rec.put("es_civil_a", rs.getString("ES_CIVIL"));
                rec.put("es_civil_p", rs.getString("LI_ESTADO_CIVIL"));
                rec.put("no_usuario", rs.getString("NO_USUARIO"));
                rec.put("fe_modi", rs.getString("FE_MODIFICACION"));
                rec.put("es_reg", rs.getString("ES_REGISTRO"));
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
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT ID_TRABAJADOR,TO_CHAR(FE_MODIF,'DD/MM/YYYY HH:MI:SS')FE_MODIFI\n"
                    + "FROM RHTH_MODIF_TRABAJADOR\n"
                    + "WHERE ID_TRABAJADOR='" + ID_TRABAJADOR + "'AND FE_MODIF IS NOT NULL\n"
                    + "ORDER BY FE_MODIFi desc";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<>();
                rec.put("id_tra", rs.getString(1));
                rec.put("fe_mod", rs.getString(2));
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
    public List<Map<String, ?>> List_historial_modf_hijo(String FE_INICIO, String FE_FIN, String tipo) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT AP_MATERNO_T, AP_PATERNO_T, NO_TRABAJADOR_T, ID_DATOS_HIJOS_TRABAJADOR, ID_TRABAJADOR, AP_PATERNO, AP_MATERNO, NO_HIJO_TRABAJADOR, FE_NACIMIENTO, NO_ES_SEXO, ES_SEXO, ES_TIPO_DOC, NU_DOC, ES_PRESENTA_DOCUMENTO, ES_INSCRIPCION_VIG_ESSALUD, NO_ESSALUD, ES_ESTUDIO_NIV_SUPERIOR, NO_ESTUDIO_SUPERIOR, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, ES_DATOS_HIJO_TRABAJADOR, SEMESTRE, ESTADO_REGISTRO, to_char(FE_FILTRO_TODO,'dd/mm/yyyy hh:mi:ss') as FE_FILTRO_TODO, NO_USUARIO_CREACION, NO_USUARIO_MODIF, DE_TIP_DOC,ES_PROCESADO FROM RHVD_HISTORIAL_MOD_HIJO WHERE  us_creacion is not null ";
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
                rec.put("procesado", rs.getString("ES_PROCESADO"));
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
            String sql = "select  to_char(FE_FILTRO_TODO,'dd/mm/yyyy hh:mi:ss') as FE_FILTRO_TODO  from RHVD_HISTORIAL_MOD_HIJO where ID_DATOS_HIJOS_TRABAJADOR='" + Hijo + "'";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("FE_FILTRO_TODO"));
                rec.put("fecha", rs.getString("FE_FILTRO_TODO"));
                rec.put("nombre", rs.getString("FE_FILTRO_TODO"));
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
    public List<Map<String, ?>> list_fecha_modif2(String Hijo, String fecha) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  to_char(FE_FILTRO_TODO,'dd/mm/yyyy hh:mi:ss') as FE_FILTRO_TODO  from RHVD_HISTORIAL_MOD_HIJO where ID_DATOS_HIJOS_TRABAJADOR='" + Hijo + "' and to_char(FE_FILTRO_TODO,'dd/mm/yyyy hh:mi:ss') <>'" + fecha.trim() + "'";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("FE_FILTRO_TODO"));
                rec.put("fecha", rs.getString("FE_FILTRO_TODO"));
                rec.put("nombre", rs.getString("FE_FILTRO_TODO"));
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
    public List<Map<String, ?>> list_hijo_trabajdor(String id_tr) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "  SELECT * FROM RHTD_DATOS_HIJO_TRABAJADOR WHERE ID_TRABAJADOR='" + id_tr.trim() + "'";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_datos_hijos_trabajador"));
                rec.put("nombre", rs.getString("ap_paterno") + " " + rs.getString("ap_materno") + " " + rs.getString("no_hijo_trabajador"));
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
            String sql = "SELECT * FROM RHVD_HISTORIAL_MOD_HIJO where ID_DATOS_HIJOS_TRABAJADOR='" + id + "' and to_char(FE_FILTRO_TODO,'dd/mm/yyyy hh:mi:ss') ='" + fecha1.trim() + "' or to_char(FE_FILTRO_TODO,'dd/mm/yyyy hh:mi:ss') ='" + fecha2.trim() + "' ";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("ap_p", rs.getString("ap_paterno"));
                rec.put("ap_m", rs.getString("ap_materno"));
                rec.put("no_hijo", rs.getString("no_hijo_trabajador"));
                rec.put("fe_nac", rs.getString("fe_nacimiento"));
                rec.put("sexo", rs.getString("ES_SEXO"));
                rec.put("ti_doc", rs.getString("ES_TIPO_DOC"));
                rec.put("nu_doc", rs.getString("NU_DOC"));
                rec.put("essalud", rs.getString("ES_INSCRIPCION_VIG_ESSALUD"));

                rec.put("no_essalud", rs.getString("NO_ESSALUD"));
                rec.put("no_niv_sup", rs.getString("NO_ESTUDIO_SUPERIOR"));
                rec.put("no_sexo", rs.getString("NO_ES_SEXO"));
                rec.put("de_tip_doc", rs.getString("DE_TIP_DOC"));

                rec.put("estudios", rs.getString("ES_ESTUDIO_NIV_SUPERIOR"));
                rec.put("us_creacion", rs.getString("NO_USUARIO_CREACION"));
                rec.put("creacion", rs.getString("FE_CREACION"));
                rec.put("us_modif", rs.getString("no_usuario_modif"));
                rec.put("modif", rs.getString("FE_MODIF"));
                rec.put("ip_usuario", rs.getString("IP_USUARIO"));
                rec.put("es_procesado", rs.getString("es_procesado"));
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
    public List<Map<String, ?>> Listar_hist_fecha(String FE_MODIF, String idtra) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * FROM RHVD_MOD_TRABAJADOR \n"
                    + "WHERE ID_TRABAJADOR='" + idtra + "' AND\n"
                    + "      fe_modif= '" + FE_MODIF + "'\n"
                    + "      and rownum=1";
            ResultSet rs = this.cnn.query(sql);
            if (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                for (int i = 1; i < 74; i++) {
                    if (rs.getString(i) == null) {
                        rec.put("col" + i, "SIN DATOS");
                    } else {
                        rec.put("col" + i, rs.getString(i));
                    }

                }
                lista.add(rec);
            }
            /*while (rs.next()) {
             Map<String, Object> rec = new HashMap<String, Object>();
             rec.put("col", rs.getString("columna"));
             rec.put("det", rs.getString("detalle"));
             lista.add(rec);
             }*/
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
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * FROM RHVD_NEW_TRABAJADOR \n"
                    + "WHERE ID_TRABAJADOR='" + ID_TRABAJADOR + "' \n"
                    + "      and rownum=1";
            ResultSet rs = this.cnn.query(sql);
            if (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                for (int i = 1; i < 74; i++) {
                    if (rs.getString(i) == null) {
                        rec.put("col" + i, "SIN DATOS");
                    } else {
                        rec.put("col" + i, rs.getString(i));
                    }
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
    public String[] decode(String t) {
        String x[] = new String[3];
        int cont = 0;
        String b[] = t.split("\\*");
        for (String a : b) {
            if (!a.equals("")) {
                x[cont] = a;
                cont++;
            }
        }
        return x;
    }

    @Override
    public void Procesar_historial_hijo(String id_hijo, String es_fecha, String fecha) {
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.cnn.conex.prepareCall("{CALL rhsp_procesar_historial_hijo(?,?,?)}");
            cst.setString(1, id_hijo);
            cst.setString(2, es_fecha);
            cst.setString(3, fecha);
            cst.execute();
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
    }

    @Override
    public void Procesar_Est_Civil(String id_ec) {
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "UPDATE RHTH_ESTADO_CIVIL SET ES_REGISTRO = '1' WHERE ID_ESTADO_CIVIL = '" + id_ec + "'";
            ResultSet rs = this.cnn.query(sql);
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
    }

    @Override
    public List<Map<String, ?>> Listar_Det_EC(String idtr) {
        List<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select ec.ID_ESTADO_CIVIL, ec.LI_ESTADO_CIVIL , TO_CHAR (ec.FE_MODIFICACION , 'dd/mm/yy HH:MI:SS' ) as FE_MODIFICACION, us.NO_USUARIO , ec.ID_TRABAJADOR , ec.ES_REGISTRO from RHTH_ESTADO_CIVIL ec , RHTC_USUARIO us where us.ID_USUARIO = ec.US_MODIFICACION and ID_TRABAJADOR = '"+idtr+"' order by FE_MODIFICACION desc";

            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<>();
                rec.put("id_ec", rs.getString("ID_ESTADO_CIVIL"));
                rec.put("es_civil_p", rs.getString("LI_ESTADO_CIVIL"));
                rec.put("no_usuario", rs.getString("NO_USUARIO"));
                rec.put("fe_modi", rs.getString("FE_MODIFICACION"));
                rec.put("es_reg", rs.getString("ES_REGISTRO"));
                lista.add(rec);

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
        return lista;

    }
}
