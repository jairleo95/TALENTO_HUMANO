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
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Autorizacion;
import pe.edu.upeu.application.model.V_Autorizar_Dgp;
import pe.edu.upeu.application.model.X_List_De_Autorizacion;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author Admin
 */
public class AutorizacionDAO implements InterfaceAutorizacionDAO {

    CConversion c = new CConversion();
    ConexionBD conn;

    @Override
    public boolean Guardar_Autorizacion(String id_autorizacion, String id_dgp, String id_proceso, String estado, String detalle, String nu_pasos) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Max_Id_Autorizacion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<X_List_De_Autorizacion> List_Detalle_Autorizacion(String iddgp, String idrp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT f.co_pasos, "
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
                + "   "
                + "  ) s ON ( s.ID_DETALLE_REQ_PROCESO=f.ID_DETALLE_REQ_PROCESO "
                + "AND f.id_pasos                     =s.id_pasos ) "
                + "WHERE f.ID_DETALLE_REQ_PROCESO     ='" + idrp.trim() + "' ORDER BY to_number(substr(f.nu_pasos,2,length(f.nu_pasos))) ASC";
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

                list.add(x);
            }

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;
    }

    @Override
    public List<V_Autorizar_Dgp> List_id_Autorizacion(String id, String id_user) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select *  from rhvd_autorizar_dgp where id_puesto='" + id + "'";
        sql += (!"".equals(id_user)) ? " and id_usuario='" + id_user + "'" : "";
        sql += (true) ? " order by fe_creacion " : "" ;
        
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
                list.add(v);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<V_Autorizar_Dgp> List_Autorizacion_Academico(String id, String id_user) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select *  from RHVD_AUTORIZAR_CARGA_ACADEMICA where id_puesto='" + id + "'";
        sql += (!"".equals(id_user)) ? " and id_usuario='" + id_user + "'" : "";

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
        } catch (SQLException e) {
        } finally {
            this.conn.close();
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
            /* list.add(rs.getString("id_proceso"));
             list.add(rs.getString("id_detalle_req_proceso"));
             list.add(rs.getString("id_detalle_pasos"));
             list.add(rs.getString("de_pasos"));
             list.add(rs.getString("nu_pasos"));
             list.add(rs.getString("co_pasos"));
             list.add(rs.getString("no_proceso"));
           
             list.add(rs.getString("id_direccion"));
             list.add(rs.getString("id_departamento"));
             list.add(rs.getString("id_requerimiento"));*/

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

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
            cst.setString(5, IP_USUARIO);
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
    public List<V_Autorizar_Dgp> List_Autorizados(String id_puesto, String id_user) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select *  from rhvd_autorizar_dgp where id_puesto='" + id_puesto + "'";
        sql += (!"".equals(id_user)) ? " and id_usuario='" + id_user + "'" : "";
        sql += (true) ? " order by fe_creacion " : "" ;
        
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
                list.add(v);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

}
