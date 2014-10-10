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
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.DGP;
import pe.edu.upeu.application.model.V_Det_DGP;
import pe.edu.upeu.application.model.V_Es_Requerimiento;
import pe.edu.upeu.application.model.V_Estado_req;
import pe.edu.upeu.application.model.X_List_det_dgp;
import pe.edu.upeu.application.model.X_List_dgp_by;
import pe.edu.upeu.application.model.X_User_dgp;
import pe.edu.upeu.application.model.X_val_tra_dgp;
import pe.edu.upeu.application.model.x_List_Id_Trab_Dgp;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author Jose
 */
public class DgpDAO implements InterfaceDgpDAO {

    ConexionBD conn;
    CConversion c = new CConversion();

    @Override
    public void INSERT_DGP(String ID_DGP, String FE_DESDE, String FE_HASTA, double CA_SUELDO, String DE_DIAS_TRABAJO, String ID_PUESTO, String ID_REQUERIMIENTO, String ID_TRABAJADOR, String CO_RUC, String DE_LUGAR_SERVICIO, String DE_SERVICIO, String DE_PERIODO_PAGO, String DE_DOMICILIO_FISCAL, String DE_SUBVENCION, String DE_HORARIO_CAPACITACION, String DE_HORARIO_REFRIGERIO, String DE_DIAS_CAPACITACION, String ES_DGP, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, double CA_BONO_ALIMENTARIO, double DE_BEV, double CA_CENTRO_COSTOS, String DE_ANTECEDENTES_POLICIALES, String DE_CERTIFICADO_SALUD, String DE_MONTO_HONORARIO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_DGP( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, c.convertFecha(FE_DESDE));
            cst.setString(3, c.convertFecha(FE_HASTA));
            cst.setDouble(4, CA_SUELDO);
            cst.setString(5, DE_DIAS_TRABAJO);
            cst.setString(6, ID_PUESTO);
            cst.setString(7, ID_REQUERIMIENTO);
            cst.setString(8, ID_TRABAJADOR);
            cst.setString(9, CO_RUC);
            cst.setString(10, DE_LUGAR_SERVICIO);
            cst.setString(11, DE_SERVICIO);
            cst.setString(12, DE_PERIODO_PAGO);
            cst.setString(13, DE_DOMICILIO_FISCAL);
            cst.setString(14, DE_SUBVENCION);
            cst.setString(15, DE_HORARIO_CAPACITACION);
            cst.setString(16, DE_HORARIO_REFRIGERIO);
            cst.setString(17, DE_DIAS_CAPACITACION);
            cst.setString(18, ES_DGP);
            cst.setString(19, US_CREACION);
            cst.setString(20, null);
            cst.setString(21, US_MODIF);
            cst.setString(22, null);
            cst.setString(23, IP_USUARIO);
            cst.setDouble(24, CA_BONO_ALIMENTARIO);
            cst.setDouble(25, DE_BEV);
            cst.setDouble(26, CA_CENTRO_COSTOS);
            cst.setString(27, DE_ANTECEDENTES_POLICIALES);
            cst.setString(28, DE_CERTIFICADO_SALUD);
            cst.setString(29, DE_MONTO_HONORARIO);
            cst.execute();

        } catch (Exception ex) {
            //  Logger.getLogger(DgpDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.conn.close();
        }
    }

    @Override
    public List<X_User_dgp> USER_DGP(String id_dgp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select u.*,du.NO_TRABAJADOR ,du.AP_PATERNO,du.AP_MATERNO, p.DE_PASOS as  paso from RHVD_USER_AUT u  ,RHTC_PASOS p ,RHVD_USUARIO du  where u.ID_EMPLEADO=du.ID_EMPLEADO and u.ID_PASOS= p.ID_PASOS  and u.ID_DGP='" + id_dgp + "'  and u.ID_PUESTO IS NOT NULL";
        List<X_User_dgp> Lista = new ArrayList<X_User_dgp>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                X_User_dgp x = new X_User_dgp();
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setId_usuario(rs.getString("id_usuario"));
                x.setId_rol(rs.getString("id_rol"));
                x.setId_empleado(rs.getString("id_empleado"));
                x.setNo_usuario(rs.getString("no_usuario"));
                x.setPw_usuario(rs.getString("pw_usuario"));
                x.setNo_puesto(rs.getString("no_puesto"));
                x.setId_puesto(rs.getString("id_puesto"));
                x.setNo_area(rs.getString("no_area"));
                x.setId_area(rs.getString("id_area"));
                x.setNo_dep(rs.getString("no_dep"));
                x.setId_departamento(rs.getString("id_departamento"));
                x.setId_direccion(rs.getString("id_direccion"));
                x.setId_seccion(rs.getString("id_seccion"));
                x.setNo_seccion(rs.getString("No_seccion"));
                x.setNu_pasos(rs.getString("nu_pasos"));
                x.setCo_pasos(rs.getString("co_pasos"));
                x.setDe_pasos(rs.getString("de_pasos"));
                x.setId_dgp(rs.getString("id_dgp"));
                x.setId_detalle_pasos(rs.getString("id_detalle_pasos"));
                x.setId_detalle_req_proceso(rs.getString("id_detalle_req_proceso"));
                x.setId_pasos(rs.getString("id_pasos"));
                x.setId_proceso(rs.getString("id_proceso"));
                x.setId_requerimiento(rs.getString("id_requerimiento"));
                x.setNo_proceso(rs.getString("no_proceso"));
                x.setNo_trabajador(rs.getString("no_trabajador"));
                x.setAp_paterno(rs.getString("ap_paterno"));
                x.setAp_materno(rs.getString("ap_materno"));
                x.setPaso(rs.getString("paso"));
                Lista.add(x);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public List<x_List_Id_Trab_Dgp> LIST_ID_TRAB_DGP(String id) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHTM_DGP dgp, RHTR_REQUERIMIENTO r ,RHVD_PUESTO_DIRECCION pd where  pd.ID_PUESTO=dgp.ID_PUESTO  and r.ID_REQUERIMIENTO= dgp.ID_REQUERIMIENTO and dgp.ID_TRABAJADOR='" + id + "'";
        List<x_List_Id_Trab_Dgp> Lista = new ArrayList<x_List_Id_Trab_Dgp>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                x_List_Id_Trab_Dgp x = new x_List_Id_Trab_Dgp();
                x.setId_dgp(rs.getString("id_dgp"));
                x.setFe_desde(rs.getString("fe_desde"));
                x.setFe_hasta(rs.getString("fe_hasta"));
                x.setCa_sueldo(rs.getDouble("ca_sueldo"));
                x.setDe_dias_trabajo(rs.getString("de_dias_trabajo"));
                x.setId_puesto(rs.getString("id_puesto"));
                x.setId_requerimiento(rs.getString("id_requerimiento"));
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setCo_ruc(rs.getString("co_ruc"));
                x.setDe_lugar_servicio(rs.getString("de_lugar_servicio"));
                x.setDe_servicio(rs.getString("de_servicio"));
                x.setDe_periodo_pago(rs.getString("de_periodo_pago"));
                x.setDe_domicilio_fiscal(rs.getString("de_domicilio_fiscal"));
                x.setDe_subvencion(rs.getString("de_subvencion"));
                x.setDe_horario_capacitacion(rs.getString("de_horario_capacitacion"));
                x.setDe_horario_refrigerio(rs.getString("de_horario_refrigerio"));
                x.setDe_dias_capacitacion(rs.getString("de_dias_capacitacion"));
                x.setEs_dgp(rs.getString("es_dgp"));
                x.setUs_creacion(rs.getString("us_creacion"));
                x.setFe_creacion(rs.getString("fe_creacion"));
                x.setUs_modif(rs.getString("us_modif"));
                x.setFe_modif(rs.getString("fe_modif"));
                x.setIp_usuario(rs.getString("ip_usuario"));
                x.setCa_bono_alimentario(rs.getDouble("ca_bono_alimentario"));
                x.setDe_bev(rs.getDouble("de_bev"));
                x.setCa_centro_costos(rs.getDouble("ca_centro_costos"));
                x.setDe_antecedentes_policiales(rs.getString("de_antecedentes_policiales"));
                x.setDe_certificado_salud(rs.getString("de_certificado_salud"));
                x.setDe_monto_honorario(rs.getString("de_monto_honorario"));
                x.setNo_req(rs.getString("no_req"));
                x.setId_tipo_planilla(rs.getString("id_tipo_planilla"));
                x.setNo_direccion(rs.getString("no_direccion"));
                x.setId_direccion(rs.getString("id_direccion"));
                x.setNo_dep(rs.getString("No_dep"));
                x.setId_departamento(rs.getString("id_departamento"));
                x.setNo_area(rs.getString("no_area"));
                x.setId_area(rs.getString("id_area"));
                x.setNo_seccion(rs.getString("No_seccion"));
                x.setId_seccion(rs.getString("id_seccion"));
                x.setNo_puesto(rs.getString("no_puesto"));
                Lista.add(x);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public List<X_List_det_dgp> LIST_DET_DGP(String id_dep) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select dgp.id_dgp , dgp.id_trabajador,tr.no_trabajador,tr.ap_paterno,tr.ap_materno, dgp.id_puesto,dgp.fe_desde,dgp.fe_hasta,dgp.ca_sueldo, pd.no_puesto, pd.no_area, r.no_req,dgp.ES_DGP from RHTR_REQUERIMIENTO r,RHTM_DGP dgp , RHTM_TRABAJADOR tr,RHVD_PUESTO_DIRECCION  pd where r.ID_REQUERIMIENTO = dgp.ID_REQUERIMIENTO and dgp.ES_DGP is not null and dgp.ID_PUESTO=pd.ID_PUESTO and tr.ID_TRABAJADOR = dgp.ID_TRABAJADOR";
        sql += (!id_dep.equals("")) ? " and pd.ID_DEPARTAMENTO='" + id_dep.trim() + "'" : "";
        sql += " ORDER BY TO_NUMBER(SUBSTR(dgp.ID_DGP,5,LENGTH(dgp.ID_DGP))) DESC";
        List<X_List_det_dgp> Lista = new ArrayList<X_List_det_dgp>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                X_List_det_dgp x = new X_List_det_dgp();
                x.setId_dgp(rs.getString("id_dgp"));
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setNo_trabajador(rs.getString("no_trabajador"));
                x.setAp_paterno(rs.getString("ap_paterno"));
                x.setAp_materno(rs.getString("ap_materno"));
                x.setId_puesto(rs.getString("id_puesto"));
                x.setFe_desde(rs.getString("fe_desde"));
                x.setFe_hasta(rs.getString("fe_hasta"));
                x.setCa_sueldo(rs.getDouble("ca_sueldo"));
                x.setNo_puesto(rs.getString("no_puesto"));
                x.setNo_area(rs.getString("no_area"));
                x.setNo_req(rs.getString("no_req"));
                x.setEs_dgp(rs.getString("es_dgp"));
                Lista.add(x);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public List<X_List_dgp_by> LIST_DGP_BY(String id_user) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT a.ID_AUTORIZACION,dgp.ID_TRABAJADOR,a.ES_AUTORIZACION, tr.AP_PATERNO,tr.AP_MATERNO\n"
                + ",tr.NO_TRABAJADOR,dd.NO_PUESTO,dp.DE_PASOS,dp.NO_PROCESO,(to_char(a.FE_CREACION,'dd/mm/yy hh:mm:ss')) AS FECHA_CREACION\n"
                + "FROM RHTV_AUTORIZACION a,\n"
                + "  RHTM_DGP dgp ,\n"
                + "  RHVD_REQ_PASO_PU dp ,\n"
                + "  RHVD_PUESTO_DIRECCION dd,\n"
                + "  RHTM_TRABAJADOR tr\n"
                + "WHERE dgp.ID_DGP                 = a.ID_DGP\n"
                + "AND a.ID_DETALLE_REQ_PROCESO             =dp.ID_DETALLE_REQ_PROCESO\n"
                + "AND dp.ID_PUESTO = a.ID_PUESTO\n"
                + "AND dgp.ID_PUESTO                        = dd.ID_PUESTO\n"
                + "AND tr.ID_TRABAJADOR               = dgp.ID_TRABAJADOR\n"
                + "AND dp.ID_PASOS                          = a.ID_PASOS \n"
                + "AND trim(a.US_CREACION)               ='" + id_user + "'";
        List<X_List_dgp_by> Lista = new ArrayList<X_List_dgp_by>();
        try {
            ResultSet rs = this.conn.query(sql);
            X_List_dgp_by x = new X_List_dgp_by();
            while (rs.next()) {
                x.setId_autorizacion(rs.getString("id_autorizacion"));
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setEs_autorizacion(rs.getString("es_autorizacion"));
                x.setAp_paterno(rs.getString("ap_paterno"));
                x.setAp_materno(rs.getString("ap_materno"));
                x.setNo_trabajador(rs.getString("no_trabajador"));
                x.setNo_puesto(rs.getString("no_puesto"));
                x.setDe_pasos(rs.getString("de_pasos"));
                x.setNo_proceso(rs.getString("no_proceso"));
                x.setFecha_creacion(rs.getString("fecha_creacion"));
                Lista.add(x);
            }

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public void VAL_DGP_PASOS() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_dgp from RHTM_DGP where es_dgp='0'";
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_VAL_DGP(?)}");
                cst.setString(1, rs.getString("id_dgp"));
                cst.execute();
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
    }

    @Override
    public List<V_Es_Requerimiento> LIST_DGP_PROCESO(String id_dep) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);

        String sql = "select * from RHVD_ES_REQUERIMIENTO where ID_DEPARTAMENTO='" + id_dep + "' ORDER BY TO_NUMBER(SUBSTR(ID_DGP,5,LENGTH(ID_DGP))) DESC";
        //sql += (!"".equals(id_dep)) ? "where ID_DEPARTAMENTO='" + id_dep + "'" : "";
        //sql += "order by ID_DGP";
        List<V_Es_Requerimiento> Lista = new ArrayList<V_Es_Requerimiento>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Es_Requerimiento v = new V_Es_Requerimiento();
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setId_departamento(rs.getString("id_departamento"));
                Lista.add(v);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public List<X_val_tra_dgp> VAL_TRA_DGP(String id_tr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(*) as TOTAL,ID_DGP from RHTM_DGP where ID_TRABAJADOR='" + id_tr.trim() + "' and ES_DGP='0' group by ID_DGP";
        List<X_val_tra_dgp> Lista = new ArrayList<X_val_tra_dgp>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                X_val_tra_dgp X = new X_val_tra_dgp();
                X.setTotal(rs.getString("total"));
                X.setId_dgp(rs.getString("id_dgp"));
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();

            return Lista;
        }

    }

    @Override
    public int VAL_OPC_DGP(String idtr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(ID_DGP) from RHTM_DGP   where ES_DGP='0' and ID_TRABAJADOR='" + idtr.trim() + "'";
        int TOTAL = 0;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                TOTAL = Integer.parseInt(rs.getString(1));
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return TOTAL;
    }

    @Override
    public List<V_Det_DGP> LIST_ID_DGP(String id) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_DET_DGP WHERE ID_DGP='" + id + "'";
        List<V_Det_DGP> Lista = new ArrayList<V_Det_DGP>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Det_DGP x = new V_Det_DGP();
                x.setId_dgp(rs.getString("id_dgp"));
                x.setFe_desde(rs.getString("fe_desde"));
                x.setFe_hasta(rs.getString("fe_hasta"));
                x.setCa_sueldo(rs.getDouble("ca_sueldo"));
                x.setDe_dias_trabajo(rs.getString("de_dias_trabajo"));
                x.setNo_puesto(rs.getString("no_puesto"));
                x.setId_puesto(rs.getString("id_puesto"));
                x.setId_requerimiento(rs.getString("id_requerimiento"));
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setCo_ruc(rs.getString("co_ruc"));
                x.setDe_lugar_servicio(rs.getString("de_lugar_servicio"));
                x.setDe_servicio(rs.getString("de_servicio"));
                x.setDe_periodo_pago(rs.getString("de_periodo_pago"));
                x.setDe_domicilio_fiscal(rs.getString("de_domicilio_fiscal"));
                x.setDe_subvencion(rs.getString("de_subvencion"));
                x.setDe_horario_capacitacion(rs.getString("de_horario_capacitacion"));
                x.setDe_horario_refrigerio(rs.getString("de_horario_refrigerio"));
                x.setDe_dias_capacitacion(rs.getString("de_dias_capacitacion"));
                x.setEs_dgp(rs.getString("es_dgp"));
                x.setUs_creacion(rs.getString("us_creacion"));
                x.setFe_creacion(rs.getString("fe_creacion"));
                x.setUs_modif(rs.getString("us_modif"));
                x.setFe_modif(rs.getString("fe_modif"));
                x.setIp_usuario(rs.getString("ip_usuario"));
                x.setNo_req(rs.getString("no_req"));
                x.setCa_bono_alimentario(rs.getDouble("ca_bono_alimentario"));
                x.setDe_bev(rs.getDouble("de_bev"));
                x.setCa_centro_costos(rs.getDouble("ca_centro_costos"));
                x.setDe_antecedentes_policiales(rs.getString("de_antecedentes_policiales"));
                x.setDe_certificado_salud(rs.getString("de_certificado_salud"));
                Lista.add(x);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public String MAX_ID_DGP() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT 'DGP-' ||MAX (SUBSTR(ID_DGP,5,8)) FROM RHTM_DGP";
        String Maxdgp = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Maxdgp = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Maxdgp;
    }

    @Override
    public int VALIDAR_DGP_CONTR(String id_dgp, String id_tr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(*) from rhtm_contrato  where id_dgp ='" + id_dgp.trim() + "' and  ES_FIRMO_CONTRATO is not null and id_trabajador='" + id_tr.trim() + "'";
        int val = 0;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                val = Integer.parseInt(rs.getString(1));
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return val;
    }

    @Override
    public void REG_DGP_FINAL(String IDDGP) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "UPDATE RHTM_DGP SET ES_DGP='0' WHERE ID_DGP='" + IDDGP.trim() + "'";
        this.conn.ejecutar(sql);
    }

    @Override
    public void MOD_REQUE(String ID_DGP, String FE_DESDE, String FE_HASTA, double CA_SUELDO, String ID_PUESTO, String ID_REQUERIMIENTO,  double CA_BONO_ALIMENTARIO, double DE_BEV, double CA_CENTRO_COSTOS, String DE_ANTECEDENTES_POLICIALES, String DE_CERTIFICADO_SALUD) {
         try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MOD_REQUERIMIENTO(  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, c.convertFecha(FE_DESDE));
            cst.setString(2, c.convertFecha(FE_HASTA));
            cst.setDouble(3, CA_SUELDO);
            cst.setString(4, ID_PUESTO);
            cst.setString(5, ID_REQUERIMIENTO);
            cst.setDouble(6, CA_BONO_ALIMENTARIO);
            cst.setDouble(7, DE_BEV);
            cst.setDouble(8, CA_CENTRO_COSTOS);
            cst.setString(9, DE_ANTECEDENTES_POLICIALES);
            cst.setString(10, DE_CERTIFICADO_SALUD);
            cst.setString(11, ID_DGP);
            cst.execute();

        } catch (Exception ex) {
            //  Logger.getLogger(DgpDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.conn.close();
        }
    }


    @Override
    public List<V_Es_Requerimiento> List_Incomplet(String iddep) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);

        String sql = "select * from RHVD_ESTADO_REQ where ID_DEPARTAMENTO='" + iddep + "' ORDER BY TO_NUMBER(SUBSTR(ID_DGP,5,LENGTH(ID_DGP))) DESC";
        //sql += (!"".equals(id_dep)) ? "where ID_DEPARTAMENTO='" + id_dep + "'" : "";
        //sql += "order by ID_DGP";
        List<V_Es_Requerimiento> Lista = new ArrayList<V_Es_Requerimiento>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Es_Requerimiento v = new V_Es_Requerimiento();
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setId_departamento(rs.getString("id_departamento"));
                Lista.add(v);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    
}
