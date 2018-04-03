/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Cuenta_Sueldo;
import pe.edu.upeu.application.model.V_Det_DGP;
import pe.edu.upeu.application.model.V_Es_Req_Incompleto;
import pe.edu.upeu.application.model.V_Es_Requerimiento;
import pe.edu.upeu.application.model.X_List_det_dgp;
import pe.edu.upeu.application.model.X_List_dgp_by;
import pe.edu.upeu.application.model.X_User_dgp;
import pe.edu.upeu.application.model.X_val_tra_dgp;
import pe.edu.upeu.application.model.x_List_Id_Trab_Dgp;
import pe.edu.upeu.application.properties.UserMachineProperties;
import pe.edu.upeu.application.util.DateFormat;

/**
 *
 * @author Jose
 */
public class DgpDAO implements InterfaceDgpDAO {

    ConexionBD conn;

    @Override
    public void INSERT_DGP(String ID_DGP, String FE_DESDE, String FE_HASTA, double CA_SUELDO, String DE_DIAS_TRABAJO, String ID_PUESTO, String ID_REQUERIMIENTO,
            String ID_TRABAJADOR, String CO_RUC, String DE_LUGAR_SERVICIO, String DE_SERVICIO, String DE_PERIODO_PAGO, String DE_DOMICILIO_FISCAL, String DE_SUBVENCION,
            String DE_HORARIO_CAPACITACION, String DE_HORARIO_REFRIGERIO, String DE_DIAS_CAPACITACION, String ES_DGP, String US_CREACION, String FE_CREACION,
            String US_MODIF, String FE_MODIF, String IP_USUARIO, double CA_BONO_ALIMENTARIO, double DE_BEV, String DE_ANTECEDENTES_POLICIALES,
            String ES_CERTIFICADO_SALUD, String DE_MONTO_HONORARIO, String LI_MOTIVO, String ES_MFL, double BONO_PUESTO, double ASIGNACION_FAMILIAR, String ES_PRESUPUESTADO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_DGP( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?)}");
            cst.setString(1, null);
            cst.setString(2, DateFormat.toFormat1(FE_DESDE));
            cst.setString(3, DateFormat.toFormat1(FE_HASTA));
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
            cst.setString(23, UserMachineProperties.getAll());
            cst.setDouble(24, CA_BONO_ALIMENTARIO);
            cst.setDouble(25, DE_BEV);
            cst.setString(26, DE_ANTECEDENTES_POLICIALES);
            cst.setString(27, ES_CERTIFICADO_SALUD);
            cst.setString(28, DE_MONTO_HONORARIO);
            cst.setString(29, LI_MOTIVO);
            cst.setString(30, ES_MFL);
            cst.setDouble(31, BONO_PUESTO);
            cst.setDouble(32, ASIGNACION_FAMILIAR);
            cst.setString(33, ES_PRESUPUESTADO);
            cst.execute();

        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<X_User_dgp> USER_DGP(String id_dgp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select u.*,du.NO_TRABAJADOR ,du.AP_PATERNO,du.AP_MATERNO, p.DE_PASOS as  paso from RHVD_USER_AUT u  ,RHTC_PASOS p ,RHVD_USUARIO du  where u.ID_EMPLEADO=du.ID_EMPLEADO and u.ID_PASOS= p.ID_PASOS  and u.ID_DGP='" + id_dgp + "'  AND TRIM(u.ID_PUESTO)<>'0'";
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
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;
    }

    @Override
    public List<x_List_Id_Trab_Dgp> LIST_ID_TRAB_DGP(String id) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select TO_CHAR(dgp.FE_DESDE,'dd-mm-yyyy') AS FE_DESDE,TO_CHAR(dgp.FE_HASTA,'dd-mm-yyyy') AS FE_HASTA ,dgp.*,r.*,pd.* from RHTM_DGP dgp, RHTR_REQUERIMIENTO r ,RHVD_PUESTO_DIRECCION pd where  pd.ID_PUESTO=dgp.ID_PUESTO  and r.ID_REQUERIMIENTO= dgp.ID_REQUERIMIENTO and dgp.ID_TRABAJADOR='" + id + "'";
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
                //  x.setCa_centro_costos(rs.getDouble("ca_centro_costos"));
                x.setDe_antecedentes_policiales(rs.getString("de_antecedentes_policiales"));
                x.setDe_certificado_salud(rs.getString("es_certificado_salud"));
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
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;
    }

    @Override
    public List<X_List_det_dgp> LIST_DET_DGP(String id_dep) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select  rhfu_get_cd_aps_trabajador(tr.id_trabajador) as cod_aps,tr.NU_DOC, trim(rhfu_anno_procesamiento_dgp(dgp.ID_DGP))   AS anno_procesamiento,"
                + "    trim(rhfu_mes_procesamiento_dgp(dgp.ID_DGP))                 AS mes_procesamiento, dgp.id_dgp , dgp.id_trabajador,tr.no_trabajador,"
                + "tr.ap_paterno,tr.ap_materno, dgp.id_puesto,to_char(dgp.fe_desde,'dd/mm/yyyy') as fe_desde,"
                + "to_char(dgp.fe_hasta,'dd/mm/yyyy') as fe_hasta,dgp.ca_sueldo, pd.no_puesto, pd.no_area, r.no_req,dgp.ES_DGP ,dgp.LI_MOTIVO,dgp.CA_BONO_ALIMENTARIO,dgp.CA_BONIFICACION_P,dgp.CA_ASIG_FAMILIAR "
                + " from RHTR_REQUERIMIENTO r,RHTM_DGP dgp , RHTM_TRABAJADOR tr,RHVD_PUESTO_DIRECCION  pd where r.ID_REQUERIMIENTO = dgp.ID_REQUERIMIENTO and dgp.ES_DGP is not null and dgp.ID_PUESTO=pd.ID_PUESTO and tr.ID_TRABAJADOR = dgp.ID_TRABAJADOR";
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
                x.setLi_motivo(rs.getString("LI_MOTIVO"));
                x.setCa_bono_alimentario(rs.getDouble("CA_BONO_ALIMENTARIO"));
                x.setCa_bonificacion_p(rs.getDouble("CA_BONIFICACION_P"));
                x.setCa_asig_familiar(rs.getDouble("CA_ASIG_FAMILIAR"));
                x.setAnno_procesamiento(rs.getString("anno_procesamiento"));
                x.setMes_procesamiento(rs.getString("mes_procesamiento"));
                x.setCod_aps(rs.getInt("cod_aps"));
                x.setNu_doc(rs.getString("nu_doc"));
                Lista.add(x);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
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

        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;
    }

    @Override
    public void VAL_DGP_PASOS() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        try {
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_VAL_DGP }");
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<V_Es_Requerimiento> LIST_DGP_PROCESO(String id_dep, String id_dir,String idPuesto, Boolean procAcad, boolean admin) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHVD_ES_REQUERIMIENTO where  ES_PORCENT IS NOT NULL  ";
        sql += (id_dep.trim().equals("")) ? "" : " and ID_DEPARTAMENTO='" + id_dep.trim() + "' ";
        sql += (id_dir.trim().equals("")) ? "" : " and ID_DIRECCION='" + id_dir.trim() + "' ";
        
        
        sql += (idPuesto.trim().equals("")) ? "" : " and ID_DETALLE_REQ_PROCESO in (select ID_DETALLE_REQ_PROCESO from RHVD_REQ_PASO_PU where id_puesto='" + idPuesto.trim() + "') ";
        
        /*departamento de recursos humanos*/
        if (id_dep.equals("DPT-0019")||id_dep.equals("DPT-0033")||admin) {
            sql = "select * from RHVD_ES_REQUERIMIENTO where ES_PORCENT IS NOT NULL  ";
        }
        sql += (procAcad) ? " and es_proc_acad>0" : " and es_proc_acad=0 ";
        sql += " ORDER BY TO_NUMBER(SUBSTR(ID_DGP,5,LENGTH(ID_DGP))) DESC";

        Logger.getLogger(getClass().getName()).log(Level.INFO, id_dir);
        List<V_Es_Requerimiento> Lista = new ArrayList<V_Es_Requerimiento>();
        System.out.println(sql);
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
                v.setAr_foto(rs.getString("ar_foto"));
                v.setDe_foto(rs.getString("de_foto"));
                v.setId_foto(rs.getString("id_foto"));
                v.setNo_ar_foto(rs.getString("no_ar_foto"));
                v.setTa_ar_foto(rs.getString("ta_ar_foto"));
                v.setEs_porcent(rs.getString("ES_PORCENT"));
                v.setEs_dgp(rs.getString("ES_DGP"));
                v.setEs_proceso_aut(rs.getString("es_proceso_aut"));
                v.setId_detalle_req_proceso(rs.getString("id_detalle_req_proceso"));
                v.setAut_actual(rs.getString("aut_actual"));
                v.setMes_creacion(rs.getString("mes_creacion"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setAnno_procesamiento(rs.getString("anno_procesamiento"));
                v.setMes_procesamiento(rs.getString("mes_procesamiento"));
                v.setEs_proc_acad(rs.getInt("es_proc_acad"));
                Lista.add(v);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
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
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;
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
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
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
                x.setDe_antecedentes_policiales(rs.getString("de_antecedentes_policiales"));
                x.setEs_certificado_salud(rs.getString("es_certificado_salud"));
                x.setId_departamento(rs.getString("id_departamento"));
                x.setId_direccion(rs.getString("id_direccion"));
                x.setId_seccion(rs.getString("id_seccion"));
                x.setId_area(rs.getString("id_area"));
                x.setId_tipo_planilla(rs.getString("id_tipo_planilla"));
                x.setTi_planilla(rs.getString("ti_planilla"));
                x.setNo_dep(rs.getString("no_dep"));
                x.setId_detalle_horario(rs.getString("id_detalle_horario"));
                x.setNo_usuario_crea(rs.getString("no_usuario_crea"));
                x.setNo_usuario_mod(rs.getString("no_usuario_mod"));
                x.setLi_motivo(rs.getString("li_motivo"));
                x.setEs_mfl(rs.getString("es_mfl"));
                x.setCa_bonificacion_p(rs.getDouble("ca_bonificacion_p"));
                x.setNo_area(rs.getString("NO_AREA"));
                x.setNo_seccion(rs.getString("NO_SECCION"));
                x.setNo_trab_us_cr(rs.getString("no_trab_us_cr"));
                x.setNo_trab_us_mod(rs.getString("no_trab_us_mod"));
                x.setCa_asig_familiar(rs.getDouble("ca_asig_familiar"));
                x.setNombre_trabajador(rs.getString("nombre_trabajador"));
                x.setCa_horas_horario(rs.getDouble("ca_horas_horario"));
                x.setEs_presupuestado(rs.getString("es_presupuestado"));
                Lista.add(x);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
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
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return Maxdgp;
    }

    @Override
    public int VALIDAR_DGP_CONTR(String id_dgp, String id_tr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(*) from rhtm_contrato  where id_dgp ='" + id_dgp + "' and  ES_FIRMO_CONTRATO is not null and id_trabajador='" + id_tr + "'";
        int val = 0;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                val = Integer.parseInt(rs.getString(1));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
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
    public void MOD_REQUE(String ID_DGP, String FE_DESDE, String FE_HASTA, double CA_SUELDO, String ID_PUESTO, String ID_REQUERIMIENTO, double CA_BONO_ALIMENTARIO, double DE_BEV, double CA_CENTRO_COSTOS, String DE_ANTECEDENTES_POLICIALES, String DE_CERTIFICADO_SALUD) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MOD_REQUERIMIENTO(  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, DateFormat.toFormat1(FE_DESDE));
            cst.setString(2, DateFormat.toFormat1(FE_HASTA));
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

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<V_Es_Req_Incompleto> List_Incomplet(String iddep, boolean permisoAdmin) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_ES_REQ_INCOMPLETO ";
        if (!permisoAdmin) {
            sql += (!"".equals(iddep)) ? " where ID_DEPARTAMENTO='" + iddep + "'" : "";
        }

        sql += "order by ID_DGP";
        List<V_Es_Req_Incompleto> Lista = new ArrayList<V_Es_Req_Incompleto>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Es_Req_Incompleto v = new V_Es_Req_Incompleto();
                v.setNo_req(rs.getString("no_req"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setEs_dgp(rs.getString("es_dgp"));
                v.setAr_foto(rs.getString("ar_foto"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setNo_area(rs.getString("no_area"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setId_requerimiento(rs.getString("id_requerimiento"));
                Lista.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;
    }

    @Override
    public void RECHAZAR_DGP(String IDDGP) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_RECHAZAR_DGP(?)}");
            cst.setString(1, IDDGP);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void HABILITAR_DGP(String IDDGP) {

        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_HABILITAR_DGP(?)}");
            cst.setString(1, IDDGP);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }
    @Override
    public void eliminarDGP(String IDDGP) {

        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_ELIMINAR_DGP(?)}");
            cst.setString(1, IDDGP);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<Map<String, ?>> list_Req(String id) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select   id_contrato,id_dgp,fe_desde ||' - ' || fe_hasta ||' | '|| NO_PUESTO as descripcion from RHVD_LIST_CONTRATO where id_trabajador='" + id + "'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_contrato"));
                rec.put("desc", rs.getString("descripcion"));
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
                throw new RuntimeException(e.getMessage());
            }
        }
        return lista;
    }

    @Override
    public List<Map<String, ?>> Cargar_Datos_Dgp(String id) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = " select   c.id_contrato,c.id_dgp,c.CA_SUELDO,c.CA_BONO_ALIMENTO,c.CA_BEV ,c.CA_SUELDO_TOTAL ,d.DE_ANTECEDENTES_POLICIALES,d.ES_CERTIFICADO_SALUD ,d.NO_BANCO,d.NO_BANCO_OTROS,d.ES_GEN_NU_CUENTA,d.NU_CUENTA,d.NU_CUENTA_BANC from RHVD_LIST_CONTRATO c  left outer join RHVD_DET_DGP d on (d.ID_DGP = c.ID_DGP) where c.id_contrato='" + id + "'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_dgp"));
                rec.put("id_c", rs.getString("id_contrato"));
                rec.put("sueldo", rs.getString("ca_sueldo"));
                rec.put("bono_alimentario", rs.getString("ca_bono_alimento"));
                rec.put("bev", rs.getString("ca_bev"));
                rec.put("ant_pol", rs.getString("DE_ANTECEDENTES_POLICIALES"));
                rec.put("essalud", rs.getString("ES_CERTIFICADO_SALUD"));
                rec.put("banco", rs.getString("NO_BANCO"));
                rec.put("banco_otros", rs.getString("NO_BANCO_OTROS"));
                rec.put("gen_cuenta", rs.getString("ES_GEN_NU_CUENTA"));
                rec.put("cuenta", rs.getString("NU_CUENTA"));
                rec.put("cuenta_bancaria", rs.getString("NU_CUENTA_BANC"));
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
    public String Imprimir_det_proceso(String iddgp, String idrp, String iddep) {

        String cadena = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT f.de_pasos, "
                    + "  f.nu_pasos ,s.es_autorizacion, rhfu_count_aut_dgp ('" + iddgp + "') as count_aut,rhfu_detalle_puesto_aut ('" + idrp + "',f.id_pasos,'" + iddep.trim() + "') as puesto_aut  "
                    + "FROM "
                    + "  (SELECT p.id_pasos, "
                    + "    p.id_proceso, "
                    + "    rp.id_detalle_req_proceso, "
                    + "    p.de_pasos, "
                    + "    p.nu_pasos, "
                    + "    p.co_pasos, "
                    + "    pro.no_proceso, "
                    + "    rp.id_direccion, "
                    + "    rp.id_departamento, "
                    + "    rp.id_requerimiento "
                    + "  FROM rhtc_pasos p , "
                    + "    rhtv_proceso pro, "
                    + "    rhtr_detalle_req_proceso rp "
                    + "  WHERE pro.id_proceso = p.id_proceso "
                    + "  AND rp.id_proceso    = pro.id_proceso "
                    + "  AND rp.ES_REQ_PROCESO='1' "
                    + "  AND p.ES_PASOS       ='1' "
                    + "  ) f "
                    + "LEFT OUTER JOIN "
                    + "  (SELECT pu.NO_PUESTO, "
                    + "    du.NO_USUARIO, "
                    + "    a.co_pasos, "
                    + "    a.DE_PASOS, "
                    + "    a.es_autorizacion, "
                    + "    a.fe_creacion, "
                    + "    a.id_autorizacion, "
                    + "    a.id_departamento, "
                    + "    a.id_detalle_pasos, "
                    + "    a.id_detalle_req_proceso, "
                    + "    a.id_dgp, "
                    + "    a.id_direccion, "
                    + "    a.id_pasos, "
                    + "    a.id_proceso, "
                    + "    a.id_puesto, "
                    + "    a.id_requerimiento, "
                    + "    a.no_proceso, "
                    + "    a.nu_pasos, "
                    + "    a.us_creacion , "
                    + "    dt.AP_PATERNO, "
                    + "    dt.AP_MATERNO, "
                    + "    dt.NO_TRABAJADOR, "
                    + "    dgp.CA_SUELDO, "
                    + "    du.AP_PATERNO    AS us_ap_p, "
                    + "    du.AP_MATERNO    AS us_ap_mat , "
                    + "    du.NO_TRABAJADOR AS us_no_tr, "
                    + "    du.NO_PUESTO     AS us_no_puesto, "
                    + "    du.NO_AREA       AS us_no_area, "
                    + "    du.NO_DEP        AS us_no_dep "
                    + "  FROM "
                    + "    (SELECT a.id_detalle_req_proceso, "
                    + "      a.id_dgp, "
                    + "      a.id_pasos, "
                    + "      d.id_proceso, "
                    + "      d.id_detalle_pasos , "
                    + "      d.DE_PASOS, "
                    + "      d.NU_PASOS, "
                    + "      d.CO_PASOS , "
                    + "      d.no_proceso , "
                    + "      d.id_puesto, "
                    + "      d.id_direccion, "
                    + "      d.id_departamento , "
                    + "      d.id_requerimiento , "
                    + "      a.id_autorizacion, "
                    + "      a.fe_creacion, "
                    + "      a.es_autorizacion, "
                    + "      a.us_creacion "
                    + "    FROM "
                    + "      (SELECT * FROM rhvd_req_paso_pu "
                    + "      ) d "
                    + "    LEFT OUTER JOIN rhtv_autorizacion a "
                    + "    ON ( a.id_pasos             =d.id_pasos "
                    + "    AND d.id_pasos              =a.id_pasos "
                    + "    AND d.id_puesto             =a.id_puesto "
                    + "    AND d.id_detalle_req_proceso=a.id_detalle_req_proceso) "
                    + "    ) a , "
                    + "    rhtm_dgp dgp , "
                    + "    rhtm_trabajador dt , "
                    + "    rhvd_usuario du , "
                    + "    rhvd_puesto_direccion pu "
                    + "  WHERE dgp.id_dgp                 =a.id_dgp "
                    + "  AND dt.id_trabajador             = dgp.id_trabajador "
                    + "  AND du.id_usuario                =a.us_creacion "
                    + "  AND dgp.id_puesto                =pu.id_puesto "
                    + "  AND dgp.id_dgp                   ='" + iddgp + "' "
                    + "  ) s ON ( s.ID_DETALLE_REQ_PROCESO=f.ID_DETALLE_REQ_PROCESO "
                    + "AND f.id_pasos                     =s.id_pasos ) "
                    + "WHERE f.ID_DETALLE_REQ_PROCESO     ='" + idrp + "' "
                    + "ORDER BY to_number(SUBSTR(f.nu_pasos,2,LENGTH(f.nu_pasos))) ASC";
            ResultSet rs = this.conn.query(sql);
            int i = 0;
            while (rs.next()) {
                i++;

                if (rs.getString("es_autorizacion") != null) {
                    if (rs.getString("es_autorizacion").equals("1")) {

                        if (i == 1) {
                            cadena = cadena
                                    + " <div class=\"new-circle done\" rel=\"popover-hover\" data-placement=\"top\" data-original-title=\"" + rs.getString("de_pasos") + "\" data-content=\""
                                    + rs.getString("puesto_aut") + "\" data-html=\"true\">"
                                    + "<span class=\"new-label\">&#10004;</span>"
                                    + "<span class=\"new-title\">" + rs.getString("nu_pasos") + "</span> "
                                    + "</div>";
                        } else {
                            cadena = cadena
                                    + " <span class=\"new-bar done\"></span> "
                                    + "<div class=\"new-circle done\" rel=\"popover-hover\" data-placement=\"top\" data-original-title=\"" + rs.getString("de_pasos") + "\" data-content=\"" + rs.getString("puesto_aut") + " \" data-html=\"true\">"
                                    + "<span class=\"new-label\">&#10004;</span>"
                                    + "<span class=\"new-title\">" + rs.getString("nu_pasos") + "</span>"
                                    + " </div>";

                        }

                    }
                    if (rs.getString("es_autorizacion").equals("2")) {
                        cadena = cadena
                                + " <span class=\"new-bar done\"></span> "
                                + "<div  class=\"new-circle rechazo\" rel=\"popover-hover\" data-placement=\"top\" data-original-title=\"" + rs.getString("de_pasos") + "\" data-content=\" " + rs.getString("puesto_aut") + " \" data-html=\"true\">"
                                + "<span style='color:white; font:bold;' class=\"new-label fa fa-warning\"></span>"
                                + "<span class=\"new-title\">" + rs.getString("nu_pasos") + "</span>"
                                + " </div>";

                    }
                } else if (rs.getInt("count_aut") + 1 == i) {
                    //if (false) {
                    cadena = cadena
                            + " <span class=\"new-bar active\"></span> "
                            + "<div class=\"new-circle active\" rel=\"popover-hover\" data-placement=\"top\" data-original-title=\"" + rs.getString("de_pasos") + "\" data-content=\"" + rs.getString("puesto_aut") + " \" data-html=\"true\">"
                            + "<span class=\"new-label fa fa-inbox\"></span>"
                            + "<span class=\"new-title\">" + rs.getString("nu_pasos") + "</span>"
                            + " </div>";

                } else {
                    cadena = cadena
                            + " <span class=\"new-bar \"></span> "
                            + "<div class=\"new-circle\" rel=\"popover-hover\" data-placement=\"top\" data-original-title=\"" + rs.getString("de_pasos") + "\" data-content=\"" + rs.getString("puesto_aut") + " \" data-html=\"true\">"
                            + "<span class=\"new-label fa fa-lock\"></span>"
                            + "<span class=\"new-title\">" + rs.getString("nu_pasos") + "</span>"
                            + " </div>";

                }

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
                throw new RuntimeException(e.getMessage());
            }
        }
        return cadena;

    }

    @Override
    public int VALIDAR_DGP_CONTRATO(String id) {

        int num_c = 0;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select count (*) from rhtm_contrato where id_dgp='" + id + "'";
            ResultSet rs = this.conn.query(sql);
            rs.next();
            num_c = rs.getInt(1);
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al valdiar contratos por requerimientos");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return num_c;

    }

    @Override
    public List<Cuenta_Sueldo> LIST_CUEN_SUEL(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHTD_CUENTA_SUELDO WHERE ID_TRABAJADOR = '" + id_trabajador + "' ";
        List<Cuenta_Sueldo> list = new ArrayList<Cuenta_Sueldo>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Cuenta_Sueldo cs = new Cuenta_Sueldo();

                cs.setId_cuenta_sueldo(rs.getString("id_cuenta_sueldo"));
                cs.setNo_banco(rs.getString("no_banco"));
                cs.setNu_cuenta(rs.getString("nu_cuenta"));
                cs.setNu_cuenta_banc(rs.getString("nu_cuenta_banc"));
                cs.setEs_gem_nu_cuenta(rs.getString("es_gem_nu_cuenta"));
                cs.setNo_banco_otros(rs.getString("no_banco_otros"));
                cs.setId_trabajador(rs.getString("id_trabajador"));
                cs.setEs_cuenta_sueldo(rs.getString("es_cuenta_sueldo"));
                list.add(cs);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public String obt_idtr_x_dgp(String id_dgp) {
        String valor = null;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT ID_TRABAJADOR FROM  RHTM_DGP WHERE ID_DGP='" + id_dgp.trim() + "'";
            ResultSet rs = this.conn.query(sql);
            rs.next();
            valor = rs.getString(1);
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al valdiar contratos por requerimientos");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return valor;
    }

    @Override
    public int Can_cc_iddgp(String id_dgp) {
        int num_c = 0;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT COUNT(*) FROM RHTD_DETALLE_CENTRO_COSTO WHERE ID_DGP='" + id_dgp.trim() + "'";
            ResultSet rs = this.conn.query(sql);
            rs.next();
            num_c = rs.getInt(1);
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al valdiar contratos por requerimientos");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return num_c;
    }

    @Override
    public void MODIFICAR_DGP(String ID_DGP, String FE_DESDE, String FE_HASTA, double CA_SUELDO, String DE_DIAS_TRABAJO, String ID_PUESTO, String ID_REQUERIMIENTO, String ID_TRABAJADOR, String CO_RUC, String DE_LUGAR_SERVICIO, String DE_SERVICIO, String DE_PERIODO_PAGO, String DE_DOMICILIO_FISCAL, String DE_SUBVENCION, String DE_HORARIO_CAPACITACION, String DE_HORARIO_REFRIGERIO, String DE_DIAS_CAPACITACION, String ES_DGP, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, double CA_BONO_ALIMENTARIO, double DE_BEV, String DE_ANTECEDENTES_POLICIALES, String ES_CERTIFICADO_SALUD, String DE_MONTO_HONORARIO, String LI_MOTIVO, String ES_MFL, double BONO_PUESTO, String ES_PRESUPUESTADO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MODIFICAR_DGP( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)}");
            cst.setString(1, ID_DGP);
            cst.setString(2, DateFormat.toFormat1(FE_DESDE));
            cst.setString(3, DateFormat.toFormat1(FE_HASTA));
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
            cst.setString(19, null);
            cst.setString(20, null);
            cst.setString(21, US_MODIF);
            cst.setString(22, null);
            cst.setString(23, IP_USUARIO);
            cst.setDouble(24, CA_BONO_ALIMENTARIO);
            cst.setDouble(25, DE_BEV);
            cst.setString(26, DE_ANTECEDENTES_POLICIALES);
            cst.setString(27, ES_CERTIFICADO_SALUD);
            cst.setString(28, DE_MONTO_HONORARIO);
            cst.setString(29, LI_MOTIVO);
            cst.setString(30, ES_MFL);
            cst.setDouble(31, BONO_PUESTO);
            cst.setString(32, ES_PRESUPUESTADO);
            cst.execute();

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public boolean val_fe_inicio_dgp(String fecha) {
        boolean estado = false;
        try {
            System.out.println("fecha in DAO" + fecha);
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cs = this.conn.conex.prepareCall("begin   ? :=rhfu_val_fe_desde_dgp(?);end;");
            cs.registerOutParameter(1, Types.INTEGER);
            cs.setString(2, DateFormat.toFormat1(fecha));
            cs.execute();
            if (cs.getInt(1) == 0) {
                estado = true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return estado;
    }

}
