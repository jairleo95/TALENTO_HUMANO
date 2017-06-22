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
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Autorizacion;
import pe.edu.upeu.application.model.V_Autorizar_Dgp;
import pe.edu.upeu.application.model.X_List_De_Autorizacion;
import pe.edu.upeu.application.properties.UserMachineProperties;
import pe.edu.upeu.application.util.DateFormat;
import pe.edu.upeu.application.util.Sql;

/**
 *
 * @author Admin
 */
public class AutorizacionDAO implements InterfaceAutorizacionDAO {

    DateFormat c = new DateFormat();
    ConexionBD conn;

    @Override
    public void Insert_Autorizacion(String ID_AUTORIZACION, String ID_DGP, String ES_AUTORIZACION, String NU_PASOS, String IP_USUARIO, String US_CREACION, String US_MODIF, String FE_MODIF, String CO_PUESTO, String ID_PUESTO, String ID_DETALLE_REQ_PROCESO, String ID_PASOS) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_AUTORIZACION( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, ID_DGP);
            cst.setString(3, ES_AUTORIZACION);
            cst.setString(4, NU_PASOS);
            cst.setString(5, UserMachineProperties.getAll());
            cst.setString(6, US_CREACION);
            cst.setString(7, US_MODIF);
            cst.setString(8, FE_MODIF);
            cst.setString(9, CO_PUESTO);
            cst.setString(10, ID_PUESTO);
            cst.setString(11, ID_DETALLE_REQ_PROCESO);
            cst.setString(12, ID_PASOS);
            cst.execute();

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<X_List_De_Autorizacion> List_Detalle_Autorizacion(String iddgp, String idrp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT rec.co_pasos,"
                + "rec.de_pasos, "
                + "rec.es_autorizacion, "
                + "rec.fe_creacion, "
                + "rec.id_autorizacion,"
                + "rec.id_departamento,"
                + "rec.id_detalle_pasos,"
                + "rec.id_detalle_req_proceso,"
                + "rec.id_dgp,"
                + "rec.id_direccion,"
                + "rec.id_pasos, "
                + "rec.id_proceso, "
                + "rec.id_puesto, "
                + "rec.id_requerimiento, "
                + "rec.no_proceso, "
                + "rec.nu_pasos, "
                + "rec.us_creacion, "
                + "rec.ap_paterno, "
                + "rec.ap_materno, "
                + "rec.no_trabajador, "
                + "rec.ca_sueldo, "
                + "rec.us_ap_p, "
                + "rec.us_ap_mat, "
                + "rec.us_no_tr, "
                + "rec.us_no_area, "
                + "rec.us_no_puesto, "
                + "rec.us_no_dep, "
                + "rec.no_puesto,"
                + "rec.no_usuario ,"
                + "com.CM_COMENTARIO,rhfu_aut_complete_time(rec.id_dgp, rec.id_autorizacion) as taskNum "
                + "FROM("
                + "SELECT f.co_pasos,"
                + "  f.de_pasos, "
                + "  s.es_autorizacion, "
                + "  s.fe_creacion, "
                + "  s.id_autorizacion, "
                + "  s.id_departamento, "
                + "  s.id_detalle_pasos, "
                + "  s.id_detalle_req_proceso, "
                + "  s.id_dgp, "
                + "  s.id_direccion, "
                + "  s.id_pasos, "
                + "  s.id_proceso, "
                + "  s.id_puesto, "
                + "  s.id_requerimiento, "
                + "  s.no_proceso, "
                + "  f.nu_pasos, "
                + "  s.us_creacion, "
                + "  s.ap_paterno, "
                + "  s.ap_materno, "
                + "  s.no_trabajador, "
                + "  s.ca_sueldo, "
                + "  s.us_ap_p, "
                + "  s.us_ap_mat, "
                + "  s.us_no_tr, "
                + "  s.us_no_area, "
                + "  s.us_no_puesto, "
                + "  s.us_no_dep, "
                + "  s.no_puesto, "
                + "  s.no_usuario "
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
                + "  WHERE dgp.id_dgp     =a.id_dgp "
                + "  AND dt.id_trabajador = dgp.id_trabajador "
                + "  AND du.id_usuario    =a.us_creacion "
                + "  AND dgp.id_puesto    =pu.id_puesto "
                + "  AND dgp.id_dgp       ='" + iddgp.trim() + "' "
                + "  ) s ON ( s.ID_DETALLE_REQ_PROCESO=f.ID_DETALLE_REQ_PROCESO "
                + "AND f.id_pasos                     =s.id_pasos ) "
                + "WHERE f.ID_DETALLE_REQ_PROCESO     ='" + idrp.trim() + "' ORDER BY to_number(substr(f.nu_pasos,2,length(f.nu_pasos))) ASC) rec LEFT OUTER join RHTR_COMENTARIO_DGP com ON (rec.ID_DGP=com.ID_DGP and rec.ID_AUTORIZACION=com.ID_AUTORIZACION)";
        List<X_List_De_Autorizacion> list = new ArrayList<X_List_De_Autorizacion>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                X_List_De_Autorizacion x = new X_List_De_Autorizacion();
                x.setCo_pasos(rs.getString("co_pasos"));
                x.setDe_pasos(rs.getString("de_pasos"));
                x.setEs_autorizacion(rs.getString("es_autorizacion"));
                x.setFe_creacion(rs.getString("fe_creacion"));
                x.setId_autorizacion(rs.getString("id_autorizacion"));
                x.setId_departamento(rs.getString("id_departamento"));
                x.setId_detalle_pasos(rs.getString("id_detalle_pasos"));
                x.setId_detalle_req_proceso(rs.getString("id_detalle_req_proceso"));
                x.setId_dgp(rs.getString("id_dgp"));
                x.setId_direccion(rs.getString("id_direccion"));
                x.setId_pasos(rs.getString("id_pasos"));
                x.setId_proceso(rs.getString("id_proceso"));
                x.setId_puesto(rs.getString("id_puesto"));
                x.setId_requerimiento(rs.getString("id_requerimiento"));
                x.setNo_proceso(rs.getString("no_proceso"));
                x.setNu_pasos(rs.getString("nu_pasos"));
                x.setUs_creacion(rs.getString("us_creacion"));
                x.setAP_PATERNO(rs.getString("ap_paterno"));
                x.setAP_MATERNO(rs.getString("ap_materno"));
                x.setNO_TRABAJADOR(rs.getString("no_trabajador"));
                x.setCA_SUELDO(rs.getString("ca_sueldo"));
                x.setUs_ap_p(rs.getString("us_ap_p"));
                x.setUs_ap_mat(rs.getString("us_ap_mat"));
                x.setUs_no_tr(rs.getString("us_no_tr"));
                x.setUs_no_puesto(rs.getString("us_no_puesto"));
                x.setUs_no_area(rs.getString("us_no_area"));
                x.setUs_no_dep(rs.getString("us_no_dep"));
                x.setNo_puesto(rs.getString("no_puesto"));
                x.setNo_usuario(rs.getString("NO_USUARIO"));
                x.setCm_comentario(rs.getString("CM_COMENTARIO"));
                x.setTaskNum(rs.getDouble("taskNum"));
                list.add(x);
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
    public List<V_Autorizar_Dgp> List_id_Autorizacion(String id_aurotizacion, String id_user, String iddgp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select ID_TRABAJADOR, NO_TRABAJADOR, AP_PATERNO, AP_MATERNO, NO_PUESTO, NU_PASOS, ID_DGP, CO_PASOS, ID_DETALLE_REQ_PROCESO, DE_PASOS, ID_DEPARTAMENTO, "
                + "ID_PUESTO, ID_REQUERIMIENTO, ID_TIPO_PLANILLA, NO_REQ, ID_PASOS, NO_USUARIO, ID_USUARIO, NO_SECCION,"
                + " NO_AREA, FE_CREACION, VAL_PLAZO, AR_FOTO, DE_FOTO, ID_FOTO, NO_AR_FOTO, TA_AR_FOTO, TI_AR_FOTO, VER_LIST_PLAZO, "
                + "ELAB_CONTRATO, VAL_FIRM_CONTRATO, NO_DEP, MES_CREACION, VAL_COD_APS_EMPLEADO, VAL_COD_HUELLA_EMP, CO_APS, CO_HUELLA_DIGITAL, LI_MOTIVO,"
                + " ES_MFL, DI_CORREO_PERSONAL, DI_CORREO_INST, VAL_CONTRATO_ADJUNTO ,val_dgp_contrato,mes_plazo  from rhvd_autorizar_dgp where id_puesto='" + id_aurotizacion + "'";
        sql += (!"".equals(id_user)) ? " and id_usuario='" + id_user + "'" : "";
        sql += (!"".equals(iddgp)) ? " and id_dgp='" + iddgp + "'" : "";
        sql += (true) ? " order by fe_creacion " : "";

        List<V_Autorizar_Dgp> list = new ArrayList<V_Autorizar_Dgp>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Autorizar_Dgp v = new V_Autorizar_Dgp();
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNu_pasos(rs.getString("nu_pasos"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setCo_pasos(rs.getString("co_pasos"));
                v.setId_detalle_req_proceso(rs.getString("id_detalle_req_proceso"));
                v.setDe_pasos(rs.getString("de_pasos"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setId_requerimiento(rs.getString("id_requerimiento"));
                v.setId_tipo_planilla(rs.getString("id_tipo_planilla"));
                v.setNo_req(rs.getString("no_req"));
                v.setId_pasos(rs.getString("id_pasos"));
                v.setNo_usuario(rs.getString("no_usuario"));
                v.setId_usuario(rs.getString("id_usuario"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setNo_area(rs.getString("no_area"));
                v.setAr_foto(rs.getString("ar_foto"));
                v.setDe_foto(rs.getString("de_foto"));
                v.setId_foto(rs.getString("id_foto"));
                v.setNo_ar_foto(rs.getString("no_ar_foto"));
                v.setTa_ar_foto(rs.getString("ta_ar_foto"));
                v.setTi_ar_foto(rs.getString("ti_ar_foto"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setVal_plazo(rs.getInt("val_plazo"));
                v.setVer_list_plazo(rs.getString("ver_list_plazo"));
                v.setElab_contrato(rs.getString("elab_contrato"));
                v.setVal_firm_contrato(rs.getString("val_firm_contrato"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setMes_creacion(rs.getString("mes_creacion"));
                v.setVal_cod_aps_empleado(rs.getInt("VAL_COD_APS_EMPLEADO"));
                v.setVal_cod_huella(rs.getInt("VAL_COD_HUELLA_EMP"));
                v.setCo_aps(rs.getInt("CO_APS"));
                v.setCo_huella_digital(rs.getInt("CO_HUELLA_DIGITAL"));
                v.setLi_motivo(rs.getString("LI_MOTIVO"));
                v.setEs_mfl(rs.getString("ES_MFL"));
                v.setDi_correo_personal(rs.getString("DI_CORREO_PERSONAL"));
                v.setDi_correo_inst(rs.getString("DI_CORREO_INST"));
                v.setVal_contrato_adjunto(rs.getInt("val_contrato_adjunto"));
                v.setVal_dgp_cotrato(rs.getInt("val_dgp_contrato"));
                v.setMes_plazo(rs.getString("mes_plazo"));
                list.add(v);
            }
            Logger.getLogger(getClass().getName()).log(Level.INFO, sql);
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
    public List<V_Autorizar_Dgp> List_Autorizacion_Academico(String id, String id_user, String iddgp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select *  from RHVD_AUTORIZAR_CARGA_ACADEMICA where id_puesto='" + id + "'";
        sql += (!"".equals(id_user)) ? " and id_usuario='" + id_user + "'" : "";
        sql += (!"".equals(iddgp)) ? " and id_dgp='" + iddgp + "'" : "";

        List<V_Autorizar_Dgp> list = new ArrayList<V_Autorizar_Dgp>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Autorizar_Dgp v = new V_Autorizar_Dgp();
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNu_pasos(rs.getString("nu_pasos"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setCo_pasos(rs.getString("co_pasos"));
                v.setId_detalle_req_proceso(rs.getString("id_detalle_req_proceso"));
                v.setDe_pasos(rs.getString("de_pasos"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setId_requerimiento(rs.getString("id_requerimiento"));
                v.setId_tipo_planilla(rs.getString("id_tipo_planilla"));
                v.setNo_req(rs.getString("no_req"));
                v.setId_pasos(rs.getString("id_pasos"));
                v.setNo_usuario(rs.getString("no_usuario"));
                v.setId_usuario(rs.getString("id_usuario"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setNo_area(rs.getString("no_area"));
                v.setAr_foto(rs.getString("ar_foto"));
                v.setDe_foto(rs.getString("de_foto"));
                v.setId_foto(rs.getString("id_foto"));
                v.setNo_ar_foto(rs.getString("no_ar_foto"));
                v.setTa_ar_foto(rs.getString("ta_ar_foto"));
                v.setTi_ar_foto(rs.getString("ti_ar_foto"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setVal_plazo(rs.getInt("val_plazo"));
                v.setVer_list_plazo(rs.getString("ver_list_plazo"));
                v.setElab_contrato(rs.getString("elab_contrato"));
                v.setVal_firm_contrato(rs.getString("val_firm_contrato"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setMes_creacion(rs.getString("mes_creacion"));
                v.setVal_cod_aps_empleado(rs.getInt("VAL_COD_APS_EMPLEADO"));
                v.setVal_cod_huella(rs.getInt("VAL_COD_HUELLA_EMP"));
                v.setCo_aps(rs.getInt("CO_APS"));
                v.setCo_huella_digital(rs.getInt("CO_HUELLA_DIGITAL"));
                list.add(v);
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
    public List<Autorizacion> NO_List_DGP() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void Elim_Aut(String id_Autorizacion) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "DELETE FROM RHTV_AUTORIZACION WHERE ID_AUTORIZACION='" + id_Autorizacion.trim() + "'";
        this.conn.ejecutar(sql);
        this.conn.close();

    }

    @Override
    public int Val_Aut_DGP_M(String id_dgp) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<String> Det_Autorizacion(String id_rpp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhvd_req_paso_pu where id_detalle_req_proceso ='" + id_rpp.trim() + "' and trim(nu_pasos)='P1'";
        List<String> list = new ArrayList<String>();
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            list.add(rs.getString("id_pasos"));
            list.add(rs.getString("id_puesto"));
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
    public List<V_Autorizar_Dgp> List_Autorizados(String id_puesto) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_DGP_AUTORIZADOS where ID_PUESTO = '" + id_puesto + "'";
        //sql += (true) ? " order by fe_creacion " : "" ;

        List<V_Autorizar_Dgp> list = new ArrayList<V_Autorizar_Dgp>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Autorizar_Dgp v = new V_Autorizar_Dgp();
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNo_req(rs.getString("no_req"));
                v.setNo_area(rs.getString("no_area"));
                // v.setAr_foto(rs.getString("ar_foto"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setFe_autorizacion(rs.getString("fe_autorizacion"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setMes_creacion(rs.getString("mes_creacion"));
                v.setLi_motivo(rs.getString("LI_MOTIVO"));
                v.setEs_mfl(rs.getString("ES_MFL"));
                list.add(v);
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
    public String Insert_Autorizacion_dev(String ID_AUTORIZACION, String ID_DGP, String ES_AUTORIZACION, String NU_PASOS, String IP_USUARIO, String US_CREACION, String US_MODIF, String FE_MODIF, String CO_PUESTO, String ID_PUESTO, String ID_DETALLE_REQ_PROCESO, String ID_PASOS) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_AUTORIZACION_DEV( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )}");
            cst.setString(1, null);
            cst.setString(2, ID_DGP);
            cst.setString(3, ES_AUTORIZACION);
            cst.setString(4, NU_PASOS);
            cst.setString(5, IP_USUARIO);
            cst.setString(6, US_CREACION);
            cst.setString(7, US_MODIF);
            cst.setString(8, FE_MODIF);
            cst.setString(9, CO_PUESTO);
            cst.setString(10, ID_PUESTO);
            cst.setString(11, ID_DETALLE_REQ_PROCESO);
            cst.setString(12, ID_PASOS);
            cst.registerOutParameter(13, Types.CHAR);
            cst.execute();
            id = cst.getString(13);
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
        return id;
    }

    @Override
    public void Insert_comentario_Aut(String ID_COMENTARIO_DGP_SP, String id_autorizacion, String id_dgp, String us_creacion, String es_comentario, String fe_creacion, String comentario) {
        CallableStatement cst;

        try {

            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_COMENTARIO_AUTOR( ?, ?, ?, ?, ?, ?,?)}");
            cst.setString(1, null);
            cst.setString(2, id_autorizacion.trim());
            cst.setString(3, id_dgp.trim());
            cst.setString(4, us_creacion.trim());
            cst.setString(5, es_comentario.trim());
            cst.setString(6, fe_creacion);
            cst.setString(7, comentario);
            cst.execute();

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public String Mes_plazo(String id_dgp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT TO_CHAR(pl.FE_HASTA,'MONTH','nls_date_language=spanish') as mes_hasta FROM RHTR_CUMPLIMIENTO_PLAZO cp,RHTR_PLAZO pl WHERE  pl.ID_PLAZO = cp.ID_PLAZO and pl.TI_PLAZO='2'  and cp.ID_DGP='" + id_dgp.trim() + "'";
        String validar = "";
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                validar = rs.getString("mes_hasta");
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
        return validar;
    }

    @Override
    public List<Map<String, ?>> List_Dgp_Autorizados(String id_usuario, int pageNumber, int pageSize, int mes, String año) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String queryAuthorizeRequeriments = "SELECT "
                    + "        dgp.id_dgp,\n"
                    + "        trim(rhfu_mes_procesamiento_dgp(dgp.id_dgp) )\n"
                    + "         || ' - '\n"
                    + "         || trim(rhfu_anno_procesamiento_dgp(dgp.id_dgp) ) AS mes_anno_aut,\n"
                    + "        trim(rhfu_anno_procesamiento_dgp(dgp.id_dgp) ) AS anno_procesamiento,\n"
                    + "        trim(rhfu_mes_procesamiento_dgp(dgp.id_dgp) ) AS mes_procesamiento,\n"
                    + "        TO_CHAR(\n"
                    + "            dgp.fe_creacion,\n"
                    + "            'MONTH',\n"
                    + "            'nls_date_language=spanish'\n"
                    + "        ) AS mes_creacion,\n"
                    + "        trb.no_trabajador,\n"
                    + "        trb.ap_paterno,\n"
                    + "        trb.ap_materno,\n"
                    + "        pu.no_puesto,\n"
                    + "        au.id_puesto,\n"
                    + "        pu.no_area,\n"
                    + "        pu.no_dep,\n"
                    + "        req.no_req,\n"
                    + "        p.de_pasos,\n"
                    + "        TO_CHAR(\n"
                    + "            dgp.fe_creacion,\n"
                    + "            'dd/mm/yy HH:MI:SS'\n"
                    + "        ) AS fe_creacion,\n"
                    + "        TO_CHAR(\n"
                    + "            au.fe_creacion,\n"
                    + "            'dd/mm/yy HH:MI:SS'\n"
                    + "        ) AS fe_autorizacion,\n"
                    + "        dgp.li_motivo,\n"
                    + "        dgp.es_mfl,\n"
                    + "        au.us_creacion,\n"
                    + "        dgp.es_activ_sis_estado,\n"
                    + "        dgp.es_proc_asignacion_f,\n"
                    + "        dgp.id_trabajador, %s  \n"
                    + "    FROM\n"
                    + "        (select * from rhtv_autorizacion order by fe_creacion desc )  au, "
                    + "        rhtm_dgp dgp, "
                    + "        rhtm_trabajador trb, "
                    + "        rhvd_puesto_direccion pu, "
                    + "        rhtr_requerimiento req, "
                    + "        rhtc_pasos p "
                    + "    WHERE "
                    + "            au.id_dgp = dgp.id_dgp\n"
                    + "        AND\n"
                    + "            dgp.id_trabajador = trb.id_trabajador\n"
                    + "        AND\n"
                    + "            dgp.id_puesto = pu.id_puesto\n"
                    + "        AND\n"
                    + "            dgp.id_requerimiento = req.id_requerimiento\n"
                    + "        AND\n"
                    + "            p.id_pasos = au.id_pasos\n"
                    + "        AND\n"
                    + "            dgp.es_dgp IS NOT NULL and au.US_CREACION='" + id_usuario + "'"
                    + "    %s "
                    //  + " ORDER BY au.fe_creacion DESC";
                    //  String sql = "SELECT * FROM RHVD_DGP_AUTORIZADOS WHERE US_CREACION='" + id_usuario + "'  and mes_procesamiento is not null";
                    /* sql += (!año.equals("")) ? " AND to_number(TRIM(to_char(to_date(mes_procesamiento,'MONTH','nls_date_language=spanish'),'mm')))='"
             + (mes + 1) + "' AND TRIM(año_procesamiento)='" + año
             + "' " : "  AND to_number(TRIM(to_char(to_date(mes_procesamiento,'MONTH','nls_date_language=spanish'),'mm')))=to_number(to_char(sysdate,'mm')) AND TRIM(año_procesamiento)=to_char(sysdate,'YYYY') "*/;
            ResultSet rs = this.conn.query(Sql.queryWithPagination(queryAuthorizeRequeriments, pageNumber, pageSize, "au.fe_creacion"));
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("nombre", rs.getString("no_trabajador"));
                rec.put("ap_p", rs.getString("ap_paterno"));
                rec.put("ap_m", rs.getString("ap_materno"));
                rec.put("puesto", rs.getString("no_puesto"));
                rec.put("req", rs.getString("no_req"));
                rec.put("area", rs.getString("no_area"));
                rec.put("fecha_c", rs.getString("fe_creacion"));
                rec.put("fecha_aut", rs.getString("fe_autorizacion"));
                rec.put("mes_anno_aut", rs.getString("mes_anno_aut"));
                rec.put("dep", rs.getString("no_dep"));
                rec.put("mes_c", rs.getString("mes_creacion"));
                rec.put("motivo", rs.getString("LI_MOTIVO"));
                rec.put("mfl", rs.getString("ES_MFL"));
                rec.put("id_dgp", rs.getString("id_dgp"));
                rec.put("paso", rs.getString("DE_PASOS"));
                rec.put("row_number", rs.getString("row_number"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al cargar la lista de autorizaciones..." + e.getMessage());
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
    public Integer getListAuthorizeRequirementsSize(String id_usuario, int mes, String año) {
        int size = 0;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String queryAuthorizeRequeriments = "SELECT count(1)"
                    + "    FROM\n"
                    + "        rhtv_autorizacion au,\n"
                    + "        rhtm_dgp dgp,\n"
                    + "        rhtm_trabajador trb,\n"
                    + "        rhvd_puesto_direccion pu,\n"
                    + "        rhtr_requerimiento req,\n"
                    + "        rhtc_pasos p\n"
                    + "    WHERE\n"
                    + "            au.id_dgp = dgp.id_dgp\n"
                    + "        AND\n"
                    + "            dgp.id_trabajador = trb.id_trabajador\n"
                    + "        AND\n"
                    + "            dgp.id_puesto = pu.id_puesto\n"
                    + "        AND\n"
                    + "            dgp.id_requerimiento = req.id_requerimiento\n"
                    + "        AND\n"
                    + "            p.id_pasos = au.id_pasos\n"
                    + "        AND\n"
                    + "            dgp.es_dgp IS NOT NULL and au.US_CREACION='" + id_usuario + "'"
                    + "    ORDER BY au.fe_creacion DESC";
            //  String sql = "SELECT * FROM RHVD_DGP_AUTORIZADOS WHERE US_CREACION='" + id_usuario + "'  and mes_procesamiento is not null";
            /* sql += (!año.equals("")) ? " AND to_number(TRIM(to_char(to_date(mes_procesamiento,'MONTH','nls_date_language=spanish'),'mm')))='"
             + (mes + 1) + "' AND TRIM(año_procesamiento)='" + año
             + "' " : "  AND to_number(TRIM(to_char(to_date(mes_procesamiento,'MONTH','nls_date_language=spanish'),'mm')))=to_number(to_char(sysdate,'mm')) AND TRIM(año_procesamiento)=to_char(sysdate,'YYYY') "*/;
            ResultSet rs = this.conn.query(queryAuthorizeRequeriments);
            while (rs.next()) {
                size = rs.getInt(1);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al obtener el tamaño de la lista de autorizaciones" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return size;
    }

    @Override
    public List<Map<String, ?>> List_procesar_req(boolean tipo_list, boolean permisoAsigFam, boolean permisoEsSistema) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select ID_DGP, NO_TRABAJADOR, AP_PATERNO, AP_MATERNO, NO_PUESTO, NO_SECCION, NO_AREA, NO_DEP, "
                    + "NO_REQ, ES_ACTIV_SIS_ESTADO, ES_PROC_ASIGNACION_F, "
                    + "ID_TRABAJADOR ,MES_PROCESAMIENTO_DGP,ANNO_PROCESAMIENTO_DGP from rhvd_req_proc_area_rem  ";
            if (!tipo_list) {
                if (permisoAsigFam & permisoEsSistema) {
                    sql += " where ES_ACTIV_SIS_ESTADO =1 and ES_PROC_ASIGNACION_F=1";
                } else if (permisoAsigFam) {
                    sql += " where ES_PROC_ASIGNACION_F=1";
                } else if (permisoEsSistema) {
                    sql += " where ES_ACTIV_SIS_ESTADO =1";
                }
            } else if (tipo_list) {
                if (permisoAsigFam & permisoEsSistema) {
                    sql += " where ES_ACTIV_SIS_ESTADO =0 or ES_PROC_ASIGNACION_F=0";
                } else if (permisoAsigFam) {
                    sql += " where ES_PROC_ASIGNACION_F=0";
                } else if (permisoEsSistema) {
                    sql += " where ES_ACTIV_SIS_ESTADO =0";
                }
            }

            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("iddgp", rs.getString("ID_DGP"));
                rec.put("nombre", rs.getString("NO_TRABAJADOR"));
                rec.put("ap_p", rs.getString("ap_paterno"));
                rec.put("ap_m", rs.getString("AP_MATERNO"));
                rec.put("puesto", rs.getString("NO_PUESTO"));
                rec.put("seccion", rs.getString("NO_SECCION"));
                rec.put("area", rs.getString("NO_AREA"));
                rec.put("dep", rs.getString("NO_DEP"));
                rec.put("req", rs.getString("NO_REQ"));
                rec.put("es_activ_sis", rs.getString("ES_ACTIV_SIS_ESTADO"));
                rec.put("es_asignacion_f", rs.getString("ES_PROC_ASIGNACION_F"));
                rec.put("idtr", rs.getString("ID_TRABAJADOR"));
                rec.put("mes", rs.getString("MES_PROCESAMIENTO_DGP"));
                rec.put("anno", rs.getString("ANNO_PROCESAMIENTO_DGP"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al cargar la lista de requerimientos..." + e.getMessage());
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
    public List<Map<String, ?>> ShowCkbEstado_procesarIndiviual(String iddgp) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select ID_DGP,ES_ACTIV_SIS_ESTADO, ES_PROC_ASIGNACION_F  from rhvd_req_proc_area_rem where id_dgp='" + iddgp + "' ";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("iddgp", rs.getString("ID_DGP"));
                rec.put("es_sis_estado", rs.getString("ES_ACTIV_SIS_ESTADO"));
                rec.put("es_asig_fam", rs.getString("ES_PROC_ASIGNACION_F"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al cargar componentes..." + e.getMessage());
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
    public boolean UpdateDgp_EstadoProcesar(String[] iddgp, int tipo, boolean estado) {
        boolean x = false;

        try {
            int e = (estado) ? 1 : 0;
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ArrayDescriptor des = ArrayDescriptor.createDescriptor("ARRAY_ID_DGP", conn.conex);
            ARRAY array_to_pass = new ARRAY(des, conn.conex, iddgp);
            CallableStatement st = conn.conex.prepareCall("call actualizar_dgps(?,?,?)");
            st.setArray(1, array_to_pass);
            st.setInt(2, tipo);
            st.setInt(3, e);
            st.execute();
            x = true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error procesar estados..." + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;

    }

}
