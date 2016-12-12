/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Cuenta_Sueldo;
import pe.edu.upeu.application.model.Trabajador;
import pe.edu.upeu.application.model.Universidad_Carrera;
import pe.edu.upeu.application.model.V_Ficha_Trab_Num_C;
import pe.edu.upeu.application.model.X_List_dat_tr_plantilla;
import pe.edu.upeu.application.util.DateFormat;

/**
 *
 * @author Jose
 */
public class TrabajadorDAO implements InterfaceTrabajadorDAO {

    DateFormat c = new DateFormat();
    ConexionBD conn;

    @Override
    public void INSERT_TRABAJADOR(String ID_TRABAJADOR, String AP_PATERNO, String AP_MATERNO, String NO_TRABAJADOR, String TI_DOC,
            String NU_DOC, String ES_CIVIL, String FE_NAC, String ID_NACIONALIDAD, String ID_DEPARTAMENTO, String ID_PROVINCIA,
            String ID_DISTRITO, String TE_TRABAJADOR, String CL_TRA, String DI_CORREO_PERSONAL, String DI_CORREO_INST,
            String CO_SISTEMA_PENSIONARIO, String ID_SITUACION_EDUCATIVA, String LI_REG_INST_EDUCATIVA, String ES_INST_EDUC_PERU,
            String ID_UNIVERSIDAD_CARRERA, String DE_ANNO_EGRESO, String CM_OTROS_ESTUDIOS, String ES_SEXO, String LI_GRUPO_SANGUINEO,
            String DE_REFERENCIA, String LI_RELIGION, String NO_IGLESIA, String DE_CARGO, String LI_AUTORIDAD, String NO_AP_AUTORIDAD,
            String CL_AUTORIDAD, String ID_NO_AFP, String ES_AFILIADO_ESSALUD, String LI_TIPO_TRABAJADOR, String CA_TIPO_HORA_PAGO_REFEERENCIAL,
            String ES_FACTOR_RH, String LI_DI_DOM_A_D1, String DI_DOM_A_D2, String LI_DI_DOM_A_D3, String DI_DOM_A_D4, String LI_DI_DOM_A_D5,
            String DI_DOM_A_D6, String DI_DOM_A_REF, String ID_DI_DOM_A_DISTRITO, String LI_DI_DOM_LEG_D1, String DI_DOM_LEG_D2,
            String LI_DI_DOM_LEG_D3, String DI_DOM_LEG_D4, String LI_DI_DOM_LEG_D5, String DI_DOM_LEG_D6, String ID_DI_DOM_LEG_DISTRITO,
            String CA_ING_QTA_CAT_EMPRESA, String CA_ING_QTA_CAT_RUC, String CA_ING_QTA_CAT_OTRAS_EMPRESAS, String CM_OBSERVACIONES,
            String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String AP_NOMBRES_PADRE,
            String AP_NOMBRES_MADRE, String ES_TRABAJA_UPEU_C, String AP_NOMBRES_C, String FE_NAC_C,
            String ID_TIPO_DOC_C, String NU_DOC_C, String LI_INSCRIPCION_VIG_ESSALUD_C, String ID_CONYUGUE, String CO_UNIVERSITARIO, String diezmo) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_TRABAJADOR( ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )} ");
            cst.setString(1, null);
            cst.setString(2, AP_PATERNO);
            cst.setString(3, AP_MATERNO);
            cst.setString(4, NO_TRABAJADOR);
            cst.setString(5, TI_DOC);
            cst.setString(6, NU_DOC);
            cst.setString(7, ES_CIVIL);
            cst.setString(8, DateFormat.toFormat1(FE_NAC));
            cst.setString(9, ID_NACIONALIDAD);
            cst.setString(10, ID_DEPARTAMENTO);
            cst.setString(11, ID_PROVINCIA);
            cst.setString(12, ID_DISTRITO);
            cst.setString(13, TE_TRABAJADOR);
            cst.setString(14, CL_TRA);
            cst.setString(15, DI_CORREO_PERSONAL);
            cst.setString(16, DI_CORREO_INST);
            cst.setString(17, CO_SISTEMA_PENSIONARIO);
            cst.setString(18, ID_SITUACION_EDUCATIVA);
            cst.setString(19, LI_REG_INST_EDUCATIVA);
            cst.setString(20, ES_INST_EDUC_PERU);
            cst.setString(21, ID_UNIVERSIDAD_CARRERA);
            cst.setString(22, DE_ANNO_EGRESO);
            cst.setString(23, CM_OTROS_ESTUDIOS);
            cst.setString(24, ES_SEXO);
            cst.setString(25, LI_GRUPO_SANGUINEO);
            cst.setString(26, DE_REFERENCIA);
            cst.setString(27, LI_RELIGION);
            cst.setString(28, NO_IGLESIA);
            cst.setString(29, DE_CARGO);
            cst.setString(30, LI_AUTORIDAD);
            cst.setString(31, NO_AP_AUTORIDAD);
            cst.setString(32, CL_AUTORIDAD);
            cst.setString(33, ID_NO_AFP);
            cst.setString(34, ES_AFILIADO_ESSALUD);
            cst.setString(35, LI_TIPO_TRABAJADOR);
            cst.setString(36, CA_TIPO_HORA_PAGO_REFEERENCIAL);
            cst.setString(37, ES_FACTOR_RH);
            cst.setString(38, LI_DI_DOM_A_D1);
            cst.setString(39, DI_DOM_A_D2);
            cst.setString(40, LI_DI_DOM_A_D3);
            cst.setString(41, DI_DOM_A_D4);
            cst.setString(42, LI_DI_DOM_A_D5);
            cst.setString(43, DI_DOM_A_D6);
            cst.setString(44, DI_DOM_A_REF);
            cst.setString(45, ID_DI_DOM_A_DISTRITO);
            cst.setString(46, LI_DI_DOM_LEG_D1);
            cst.setString(47, DI_DOM_LEG_D2);
            cst.setString(48, LI_DI_DOM_LEG_D3);
            cst.setString(49, DI_DOM_LEG_D4);
            cst.setString(50, LI_DI_DOM_LEG_D5);
            cst.setString(51, DI_DOM_LEG_D6);
            cst.setString(52, ID_DI_DOM_LEG_DISTRITO);
            cst.setString(53, CA_ING_QTA_CAT_EMPRESA);
            cst.setString(54, CA_ING_QTA_CAT_RUC);
            cst.setString(55, CA_ING_QTA_CAT_OTRAS_EMPRESAS);
            cst.setString(56, CM_OBSERVACIONES);
            cst.setString(57, US_CREACION);
            cst.setString(58, FE_CREACION);
            cst.setString(59, US_MODIF);
            cst.setString(60, FE_MODIF);
            cst.setString(61, IP_USUARIO);
            cst.setString(62, AP_NOMBRES_PADRE);
            cst.setString(63, AP_NOMBRES_MADRE);
            cst.setString(64, ES_TRABAJA_UPEU_C);
            cst.setString(65, AP_NOMBRES_C);
            if (FE_NAC_C != null) {
                cst.setString(66, DateFormat.toFormat1(FE_NAC_C));
            } else {
                cst.setString(66, FE_NAC_C);
            }
            cst.setString(67, ID_TIPO_DOC_C);
            cst.setString(68, NU_DOC_C);
            cst.setString(69, LI_INSCRIPCION_VIG_ESSALUD_C);
            cst.setString(70, ID_CONYUGUE);
            cst.setString(71, CO_UNIVERSITARIO);
            cst.setString(72, diezmo);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public boolean EliminarTrabajador(String id, String idc) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<V_Ficha_Trab_Num_C> Buscar_Ficha_Trabajador(String iddep, String dni, String nom, String ape_p, String ape_m) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select d.*,RHFU_VIG_CON (d.id_trabajador) as VI_CONTRATO from (select * from RHVD_TRABAJADOR) d, RHVD_USUARIO u where u.id_usuario= d.id_usuario_creacion ";
        nom = nom.toUpperCase();
        ape_p = ape_p.toUpperCase();
        ape_m = ape_m.toUpperCase();
        sql += (!"".equals(dni)) ? " and trim(d.NU_DOC)='" + dni.trim() + "'" : "";
        sql += (!"".equals(nom)) ? " and upper(d.NO_TRABAJADOR)like '%" + nom.trim() + "%'" : "";
        sql += (!"".equals(ape_p)) ? " and upper(d.AP_PATERNO)like '%" + ape_p.trim() + "%'" : "";
        sql += (!"".equals(ape_m)) ? " and upper(d.AP_MATERNO)like '%" + ape_m.trim() + "%'" : "";
        sql += " order by d.ID_TRABAJADOR desc";

        List<V_Ficha_Trab_Num_C> list = new ArrayList<V_Ficha_Trab_Num_C>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Ficha_Trab_Num_C v = new V_Ficha_Trab_Num_C();
                v.setNo_s_educativa(rs.getString("no_s_educativa"));
                v.setAp_nombres_madre(rs.getString("ap_nombres_madre"));
                v.setAp_nombres_padre(rs.getString("ap_nombres_padre"));
                v.setEs_trabaja_upeu_c(rs.getString("es_trabaja_upeu_c"));
                v.setAp_nombres_c(rs.getString("ap_nombres_c"));
                v.setFe_nac_c(rs.getString("fe_nac_c"));
                v.setId_tipo_doc_c(rs.getString("id_tipo_doc_c"));
                v.setNu_doc_c(rs.getString("nu_doc_c"));
                v.setLi_inscripcion_vig_essalud_c(rs.getString("li_inscripcion_vig_essalud_c"));
                v.setId_conyugue(rs.getString("id_conyugue"));
                v.setNo_carrera(rs.getString("no_carrera"));
                v.setNo_universidad(rs.getString("no_universidad"));
                v.setAr_foto(rs.getString("ar_foto"));
                v.setDe_foto(rs.getString("de_foto"));
                v.setId_foto(rs.getString("id_foto"));
                v.setNo_ar_foto(rs.getString("no_ar_foto"));
                v.setTa_ar_foto(rs.getString("ta_ar_foto"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setTi_doc(rs.getString("ti_doc"));
                v.setNu_doc(rs.getString("nu_doc"));
                v.setEs_civil(rs.getString("es_civil"));
                v.setFe_nac(rs.getString("fe_nac"));
                v.setNo_nacionalidad(rs.getString("no_nacionalidad"));
                v.setNo_departamento(rs.getString("no_departamento"));
                v.setNo_provincia(rs.getString("no_provincia"));
                v.setNo_distrito(rs.getString("no_distrito"));
                v.setTe_trabajador(rs.getString("te_trabajador"));
                v.setCl_tra(rs.getString("cl_tra"));
                v.setDi_correo_personal(rs.getString("di_correo_personal"));
                v.setDi_correo_inst(rs.getString("di_correo_inst"));
                v.setCo_sistema_pensionario(rs.getString("co_sistema_pensionario"));
                v.setId_situacion_educativa(rs.getString("id_situacion_educativa"));
                v.setLi_reg_inst_educativa(rs.getString("li_reg_inst_educativa"));
                v.setEs_inst_educ_peru(rs.getString("es_inst_educ_peru"));
                v.setCm_otros_estudios(rs.getString("cm_otros_estudios"));
                v.setEs_sexo(rs.getString("es_sexo"));
                v.setLi_grupo_sanguineo(rs.getString("li_grupo_sanguineo"));
                v.setDe_referencia(rs.getString("de_referencia"));
                v.setLi_religion(rs.getString("li_religion"));
                v.setNo_iglesia(rs.getString("no_iglesia"));
                v.setDe_cargo(rs.getString("de_cargo"));
                v.setLi_autoridad(rs.getString("li_autoridad"));
                v.setNo_ap_autoridad(rs.getString("no_ap_autoridad"));
                v.setCl_autoridad(rs.getString("cl_autoridad"));
                v.setId_no_afp(rs.getString("id_no_afp"));
                v.setEs_afiliado_essalud(rs.getString("es_afiliado_essalud"));
                v.setLi_tipo_trabajador(rs.getString("li_tipo_trabajador"));
                v.setCa_tipo_hora_pago_refeerencial(rs.getString("ca_tipo_hora_pago_refeerencial"));
                v.setEs_factor_rh(rs.getString("es_factor_rh"));
                v.setLi_di_dom_a_d1(rs.getString("li_di_dom_a_d1"));
                v.setDi_dom_a_d2(rs.getString("di_dom_a_d2"));
                v.setLi_di_dom_a_d3(rs.getString("li_di_dom_a_d3"));
                v.setDi_dom_a_d4(rs.getString("di_dom_a_d4"));
                v.setLi_di_dom_a_d5(rs.getString("li_di_dom_a_d5"));
                v.setDi_dom_a_d6(rs.getString("di_dom_a_d6"));
                v.setDi_dom_a_ref(rs.getString("di_dom_a_ref"));
                v.setDi_dom_a_distrito(rs.getString("di_dom_a_distrito"));
                v.setLi_di_dom_leg_d1(rs.getString("li_di_dom_leg_d1"));
                v.setDi_dom_leg_d2(rs.getString("di_dom_leg_d2"));
                v.setLi_di_dom_leg_d3(rs.getString("li_di_dom_leg_d3"));
                v.setDi_dom_leg_d4(rs.getString("di_dom_leg_d4"));
                v.setLi_di_dom_leg_d5(rs.getString("li_di_dom_leg_d5"));
                v.setDi_dom_leg_d6(rs.getString("di_dom_leg_d6"));
                v.setDi_dom_leg_distrito(rs.getString("di_dom_leg_distrito"));
                v.setCa_ing_qta_cat_empresa(rs.getString("ca_ing_qta_cat_empresa"));
                v.setCa_ing_qta_cat_ruc(rs.getString("ca_ing_qta_cat_ruc"));
                v.setCa_ing_qta_cat_otras_empresas(rs.getString("ca_ing_qta_cat_otras_empresas"));
                v.setCm_observaciones(rs.getString("cm_observaciones"));
                v.setUs_creacion(rs.getString("us_creacion"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setFe_modif(rs.getString("fe_modif"));
                v.setIp_usuario(rs.getString("ip_usuario"));
                v.setId_usuario_creacion(rs.getString("id_usuario_creacion"));
                v.setId_universidad_carrera(rs.getString("id_universidad_carrera"));
                v.setId_nacionalidad(rs.getString("id_nacionalidad"));
                v.setDistrito_nac(rs.getString("distrito_nac"));
                v.setVi_contrato(rs.getString("vi_contrato"));
                //v.setEs_proceso(rs.getInt("es_proceso"));
                list.add(v);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public List<V_Ficha_Trab_Num_C> Buscar_Trabajador_Requerimiento(String iddep, String dni, String nom, String ape_p, String ape_m, String id_req) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select d.*, ES_PROCESO_TRABAJADOR(d.id_trabajador,'" + id_req + "') as es_proceso from (select * from RHVD_TRABAJADOR) d, RHVD_USUARIO u where u.id_usuario= d.id_usuario_creacion ";
        nom = nom.toUpperCase();
        ape_p = ape_p.toUpperCase();
        ape_m = ape_m.toUpperCase();
        sql += (!"".equals(dni)) ? " and d.NU_DOC='" + dni + "'" : "";
        sql += (!"".equals(nom)) ? " and upper(d.NO_TRABAJADOR)like '%" + nom.trim() + "%'" : "";
        sql += (!"".equals(ape_p)) ? " and upper(d.AP_PATERNO)like '%" + ape_p.trim() + "%'" : "";
        sql += (!"".equals(ape_m)) ? " and upper(d.AP_MATERNO)like '%" + ape_m.trim() + "%'" : "";
        sql += " order by d.ID_TRABAJADOR desc";
        List<V_Ficha_Trab_Num_C> list = new ArrayList<V_Ficha_Trab_Num_C>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Ficha_Trab_Num_C v = new V_Ficha_Trab_Num_C();
                v.setNo_s_educativa(rs.getString("no_s_educativa"));
                v.setAp_nombres_madre(rs.getString("ap_nombres_madre"));
                v.setAp_nombres_padre(rs.getString("ap_nombres_padre"));
                v.setEs_trabaja_upeu_c(rs.getString("es_trabaja_upeu_c"));
                v.setAp_nombres_c(rs.getString("ap_nombres_c"));
                v.setFe_nac_c(rs.getString("fe_nac_c"));
                v.setId_tipo_doc_c(rs.getString("id_tipo_doc_c"));
                v.setNu_doc_c(rs.getString("nu_doc_c"));
                v.setLi_inscripcion_vig_essalud_c(rs.getString("li_inscripcion_vig_essalud_c"));
                v.setId_conyugue(rs.getString("id_conyugue"));
                v.setNo_carrera(rs.getString("no_carrera"));
                v.setNo_universidad(rs.getString("no_universidad"));
                v.setAr_foto(rs.getString("ar_foto"));
                v.setDe_foto(rs.getString("de_foto"));
                v.setId_foto(rs.getString("id_foto"));
                v.setNo_ar_foto(rs.getString("no_ar_foto"));
                v.setTa_ar_foto(rs.getString("ta_ar_foto"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setTi_doc(rs.getString("ti_doc"));
                v.setNu_doc(rs.getString("nu_doc"));
                v.setEs_civil(rs.getString("es_civil"));
                v.setFe_nac(rs.getString("fe_nac"));
                v.setNo_nacionalidad(rs.getString("no_nacionalidad"));
                v.setNo_departamento(rs.getString("no_departamento"));
                v.setNo_provincia(rs.getString("no_provincia"));
                v.setNo_distrito(rs.getString("no_distrito"));
                v.setTe_trabajador(rs.getString("te_trabajador"));
                v.setCl_tra(rs.getString("cl_tra"));
                v.setDi_correo_personal(rs.getString("di_correo_personal"));
                v.setDi_correo_inst(rs.getString("di_correo_inst"));
                v.setCo_sistema_pensionario(rs.getString("co_sistema_pensionario"));
                v.setId_situacion_educativa(rs.getString("id_situacion_educativa"));
                v.setLi_reg_inst_educativa(rs.getString("li_reg_inst_educativa"));
                v.setEs_inst_educ_peru(rs.getString("es_inst_educ_peru"));
                v.setCm_otros_estudios(rs.getString("cm_otros_estudios"));
                v.setEs_sexo(rs.getString("es_sexo"));
                v.setLi_grupo_sanguineo(rs.getString("li_grupo_sanguineo"));
                v.setDe_referencia(rs.getString("de_referencia"));
                v.setLi_religion(rs.getString("li_religion"));
                v.setNo_iglesia(rs.getString("no_iglesia"));
                v.setDe_cargo(rs.getString("de_cargo"));
                v.setLi_autoridad(rs.getString("li_autoridad"));
                v.setNo_ap_autoridad(rs.getString("no_ap_autoridad"));
                v.setCl_autoridad(rs.getString("cl_autoridad"));
                v.setId_no_afp(rs.getString("id_no_afp"));
                v.setEs_afiliado_essalud(rs.getString("es_afiliado_essalud"));
                v.setLi_tipo_trabajador(rs.getString("li_tipo_trabajador"));
                v.setCa_tipo_hora_pago_refeerencial(rs.getString("ca_tipo_hora_pago_refeerencial"));
                v.setEs_factor_rh(rs.getString("es_factor_rh"));
                v.setLi_di_dom_a_d1(rs.getString("li_di_dom_a_d1"));
                v.setDi_dom_a_d2(rs.getString("di_dom_a_d2"));
                v.setLi_di_dom_a_d3(rs.getString("li_di_dom_a_d3"));
                v.setDi_dom_a_d4(rs.getString("di_dom_a_d4"));
                v.setLi_di_dom_a_d5(rs.getString("li_di_dom_a_d5"));
                v.setDi_dom_a_d6(rs.getString("di_dom_a_d6"));
                v.setDi_dom_a_ref(rs.getString("di_dom_a_ref"));
                v.setDi_dom_a_distrito(rs.getString("di_dom_a_distrito"));
                v.setLi_di_dom_leg_d1(rs.getString("li_di_dom_leg_d1"));
                v.setDi_dom_leg_d2(rs.getString("di_dom_leg_d2"));
                v.setLi_di_dom_leg_d3(rs.getString("li_di_dom_leg_d3"));
                v.setDi_dom_leg_d4(rs.getString("di_dom_leg_d4"));
                v.setLi_di_dom_leg_d5(rs.getString("li_di_dom_leg_d5"));
                v.setDi_dom_leg_d6(rs.getString("di_dom_leg_d6"));
                v.setDi_dom_leg_distrito(rs.getString("di_dom_leg_distrito"));
                v.setCa_ing_qta_cat_empresa(rs.getString("ca_ing_qta_cat_empresa"));
                v.setCa_ing_qta_cat_ruc(rs.getString("ca_ing_qta_cat_ruc"));
                v.setCa_ing_qta_cat_otras_empresas(rs.getString("ca_ing_qta_cat_otras_empresas"));
                v.setCm_observaciones(rs.getString("cm_observaciones"));
                v.setUs_creacion(rs.getString("us_creacion"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setFe_modif(rs.getString("fe_modif"));
                v.setIp_usuario(rs.getString("ip_usuario"));
                v.setId_usuario_creacion(rs.getString("id_usuario_creacion"));
                v.setId_universidad_carrera(rs.getString("id_universidad_carrera"));
                v.setId_nacionalidad(rs.getString("id_nacionalidad"));
                v.setDistrito_nac(rs.getString("distrito_nac"));
                v.setEs_proceso(rs.getString("es_proceso"));
                list.add(v);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            //  throw new RuntimeException("ERROR :" + e.getMessage());
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
    public List<V_Ficha_Trab_Num_C> ListaridTrabajador(String id) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHVD_TRABAJADOR where ID_TRABAJADOR='" + id + "'";
        List<V_Ficha_Trab_Num_C> list = new ArrayList<V_Ficha_Trab_Num_C>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Ficha_Trab_Num_C v = new V_Ficha_Trab_Num_C();

                v.setNo_s_educativa(rs.getString("no_s_educativa"));
                v.setAp_nombres_madre(rs.getString("ap_nombres_madre"));
                v.setAp_nombres_padre(rs.getString("ap_nombres_padre"));
                v.setEs_trabaja_upeu_c(rs.getString("es_trabaja_upeu_c"));
                v.setAp_nombres_c(rs.getString("ap_nombres_c"));
                v.setFe_nac_c(rs.getString("fe_nac_c"));
                v.setId_tipo_doc_c(rs.getString("id_tipo_doc_c"));
                v.setNu_doc_c(rs.getString("nu_doc_c"));
                v.setLi_inscripcion_vig_essalud_c(rs.getString("li_inscripcion_vig_essalud_c"));
                v.setId_conyugue(rs.getString("id_conyugue"));
                v.setNo_carrera(rs.getString("no_carrera"));
                v.setNo_universidad(rs.getString("no_universidad"));
                v.setAr_foto(rs.getString("ar_foto"));
                v.setDe_foto(rs.getString("de_foto"));
                v.setId_foto(rs.getString("id_foto"));
                v.setNo_ar_foto(rs.getString("no_ar_foto"));
                v.setTa_ar_foto(rs.getString("ta_ar_foto"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setTi_doc(rs.getString("ti_doc"));
                v.setNu_doc(rs.getString("nu_doc"));
                v.setEs_civil(rs.getString("es_civil"));
                v.setFe_nac(rs.getString("fe_nac"));
                v.setNo_nacionalidad(rs.getString("no_nacionalidad"));
                v.setNo_departamento(rs.getString("no_departamento"));
                v.setNo_provincia(rs.getString("no_provincia"));
                v.setNo_distrito(rs.getString("no_distrito"));
                v.setTe_trabajador(rs.getString("te_trabajador"));
                v.setCl_tra(rs.getString("cl_tra"));
                v.setDi_correo_personal(rs.getString("di_correo_personal"));
                v.setDi_correo_inst(rs.getString("di_correo_inst"));
                v.setCo_sistema_pensionario(rs.getString("co_sistema_pensionario"));
                v.setId_situacion_educativa(rs.getString("id_situacion_educativa"));
                v.setLi_reg_inst_educativa(rs.getString("li_reg_inst_educativa"));
                v.setEs_inst_educ_peru(rs.getString("es_inst_educ_peru"));
                v.setCm_otros_estudios(rs.getString("cm_otros_estudios"));
                v.setEs_sexo(rs.getString("es_sexo"));
                v.setLi_grupo_sanguineo(rs.getString("li_grupo_sanguineo"));
                v.setDe_referencia(rs.getString("de_referencia"));
                v.setLi_religion(rs.getString("li_religion"));
                v.setNo_iglesia(rs.getString("no_iglesia"));
                v.setDe_cargo(rs.getString("de_cargo"));
                v.setLi_autoridad(rs.getString("li_autoridad"));
                v.setNo_ap_autoridad(rs.getString("no_ap_autoridad"));
                v.setCl_autoridad(rs.getString("cl_autoridad"));
                v.setId_no_afp(rs.getString("id_no_afp"));
                v.setEs_afiliado_essalud(rs.getString("es_afiliado_essalud"));
                v.setLi_tipo_trabajador(rs.getString("li_tipo_trabajador"));
                v.setCa_tipo_hora_pago_refeerencial(rs.getString("ca_tipo_hora_pago_refeerencial"));
                v.setEs_factor_rh(rs.getString("es_factor_rh"));
                v.setLi_di_dom_a_d1(rs.getString("li_di_dom_a_d1"));
                v.setDi_dom_a_d2(rs.getString("di_dom_a_d2"));
                v.setLi_di_dom_a_d3(rs.getString("li_di_dom_a_d3"));
                v.setDi_dom_a_d4(rs.getString("di_dom_a_d4"));
                v.setLi_di_dom_a_d5(rs.getString("li_di_dom_a_d5"));
                v.setDi_dom_a_d6(rs.getString("di_dom_a_d6"));
                v.setDi_dom_a_ref(rs.getString("di_dom_a_ref"));
                v.setDi_dom_a_distrito(rs.getString("di_dom_a_distrito"));
                v.setLi_di_dom_leg_d1(rs.getString("li_di_dom_leg_d1"));
                v.setDi_dom_leg_d2(rs.getString("di_dom_leg_d2"));
                v.setLi_di_dom_leg_d3(rs.getString("li_di_dom_leg_d3"));
                v.setDi_dom_leg_d4(rs.getString("di_dom_leg_d4"));
                v.setLi_di_dom_leg_d5(rs.getString("li_di_dom_leg_d5"));
                v.setDi_dom_leg_d6(rs.getString("di_dom_leg_d6"));
                v.setDi_dom_leg_distrito(rs.getString("di_dom_leg_distrito"));
                v.setCa_ing_qta_cat_empresa(rs.getString("ca_ing_qta_cat_empresa"));
                v.setCa_ing_qta_cat_ruc(rs.getString("ca_ing_qta_cat_ruc"));
                v.setCa_ing_qta_cat_otras_empresas(rs.getString("ca_ing_qta_cat_otras_empresas"));
                v.setCm_observaciones(rs.getString("cm_observaciones"));
                v.setUs_creacion(rs.getString("us_creacion"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setFe_modif(rs.getString("fe_modif"));
                v.setIp_usuario(rs.getString("ip_usuario"));
                v.setId_usuario_creacion(rs.getString("id_usuario_creacion"));
                v.setId_universidad_carrera(rs.getString("id_universidad_carrera"));
                v.setId_nacionalidad(rs.getString("id_nacionalidad"));
                v.setDistrito_nac(rs.getString("distrito_nac"));
                v.setDe_anno_egreso(rs.getString("de_anno_egreso"));
                v.setId_carrera(rs.getString("id_carrera"));
                v.setId_distrito(rs.getString("id_distrito"));
                v.setId_provincia(rs.getString("id_provincia"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setId_di_dom_a_distrito(rs.getString("id_di_dom_a_distrito"));
                v.setId_di_dom_leg_distrito(rs.getString("id_di_dom_leg_distrito"));
                v.setCo_universitario(rs.getString("co_universitario"));
                v.setEs_diezmo(rs.getString("es_diezmo"));
                list.add(v);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public List<X_List_dat_tr_plantilla> LIST_DAT_TR_PLANTILLA(String id) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select dt.ap_paterno,dt.ap_materno,dt.no_trabajador,dt.nu_doc,dt.li_di_dom_a_d1,dt.di_dom_a_d2,dt.li_di_dom_a_d3,dt.di_dom_a_d4,dt.li_di_dom_a_d5,dt.di_dom_a_d6,p.no_dep,p.no_puesto,c.fe_desde,c.fe_hasta,c.ca_sueldo,c.ca_bono_alimento,to_char(sysdate,'dd')||' de '||to_char(sysdate,'Month')||' del '||to_char(sysdate,'YYYY') AS fecha_actual,dt.id_di_dom_a_distrito,u.NO_DISTRITO,u.NO_PROVINCIA,u.NO_DEPARTAMENTO from RHTM_TRABAJADOR dt,RHTM_CONTRATO c,RHVD_PUESTO_DIRECCION p,RHVD_UBIGEO u where  dt.id_trabajador=c.id_trabajador and c.id_puesto=p.id_puesto  and dt.ID_DI_DOM_A_DISTRITO=u.ID_DISTRITO and c.id_contrato='" + id + "'";
        List<X_List_dat_tr_plantilla> list = new ArrayList<X_List_dat_tr_plantilla>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                X_List_dat_tr_plantilla t = new X_List_dat_tr_plantilla();
                t.setAp_paterno(rs.getString("ap_paterno"));
                t.setAp_materno(rs.getString("ap_materno"));
                t.setNo_trabajador(rs.getString("no_trabajador"));
                t.setNu_doc(rs.getString("nu_doc"));
                t.setLi_di_dom_a_d1(rs.getString("li_di_dom_a_d1"));
                t.setDi_dom_a_d2(rs.getString("di_dom_a_d2"));
                t.setLi_di_dom_a_d3(rs.getString("li_di_dom_a_d3"));
                t.setDi_dom_a_d4(rs.getString("di_dom_a_d4"));
                t.setLi_di_dom_a_d5(rs.getString("li_di_dom_a_d5"));
                t.setDi_dom_a_d6(rs.getString("di_dom_a_d6"));
                t.setNo_dep(rs.getString("no_dep"));
                t.setNo_puesto(rs.getString("no_puesto"));
                t.setFe_desde(rs.getString("fe_desde"));
                t.setFe_hasta(rs.getString("fe_hasta"));
                t.setCa_sueldo(rs.getString("ca_sueldo"));
                t.setCa_bono_alimento(rs.getString("ca_bono_alimento"));
                t.setFecha_actual(rs.getString("fecha_actual"));
                t.setId_di_dom_a_distrito(rs.getString("id_di_dom_a_distrito"));
                t.setNo_ub_departamento(rs.getString("no_departamento"));
                t.setNo_ub_provincia(rs.getString("no_provincia"));
                t.setNo_ub_distrito(rs.getString("no_distrito"));
                list.add(t);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public String MAX_ID_DATOS_TRABAJADOR() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT 'TRB-' ||MAX (SUBSTR(ID_TRABAJADOR,5,8)) FROM RHTM_TRABAJADOR";
        String Max = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Max = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Max;
    }

    @Override
    public void UPDATE_ID_CONYUGUE(String id_conyugue, String id_trabajador, String US_MODIF, String IP_USUARIO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_UPDATE_ID_CONYUGUE(?, ?, ? ,?)} ");
            cst.setString(1, id_conyugue);
            cst.setString(2, id_trabajador);
            cst.setString(3, US_MODIF);
            cst.setString(4, IP_USUARIO);
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.conn.close();
        }
    }

    @Override
    public String tipo_planilla(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT ID_TIPO_PLANILLA FROM RHTM_CONTRATO WHERE ID_TRABAJADOR='" + id_trabajador + "' and ES_CONTRATO='1'";
        String id_pl = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                id_pl = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return id_pl;
    }

    @Override
    public void INSERT_HIST_RELIGION(String ID_HIST_INFO_REL, String LI_RELIGION, String NO_IGLESIA, String DE_CARGO, String LI_AUTORIDAD, String NO_AP_AUTORIDAD, String CL_AUTORIDAD, String ES_HIST_INFO_REL, String ID_TRABAJADOR, String iduser, String FE_MODIF) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_HIST_INFO_REL( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)} ");
            cst.setString(1, null);
            cst.setString(2, LI_RELIGION);
            cst.setString(3, NO_IGLESIA);
            cst.setString(4, DE_CARGO);
            cst.setString(5, LI_AUTORIDAD);
            cst.setString(6, NO_AP_AUTORIDAD);
            cst.setString(7, CL_AUTORIDAD);
            cst.setString(8, ES_HIST_INFO_REL);
            cst.setString(9, ID_TRABAJADOR);
            cst.setString(10, iduser);
            cst.setString(11, FE_MODIF);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void MOD_ASP_REL(String LI_RELIGION, String NO_IGLESIA, String DE_CARGO, String LI_AUTORIDAD, String NO_AP_AUTORIDAD, String CL_AUTORIDAD, String ID_TRABAJADOR, String US_MODIF, String IP_USUARIO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MOD_RELIGION_TRA( ?, ?, ?, ?, ?, ?, ?, ?, ?)} ");
            cst.setString(1, LI_RELIGION);
            cst.setString(2, NO_IGLESIA);
            cst.setString(3, DE_CARGO);
            cst.setString(4, LI_AUTORIDAD);
            cst.setString(5, NO_AP_AUTORIDAD);
            cst.setString(6, CL_AUTORIDAD);
            cst.setString(7, ID_TRABAJADOR);
            cst.setString(8, US_MODIF);
            cst.setString(9, IP_USUARIO);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<Trabajador> LIST_TRABAJADOR_MOD_REL() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_trabajador, NO_TRABAJADOR , AP_PATERNO , AP_MATERNO  ,NU_DOC_C , LI_RELIGION ,DI_CORREO_PERSONAL, CL_TRA from RHTM_TRABAJADOR where ID_TRABAJADOR in (select ID_TRABAJADOR from RHTR_HIST_INFO_REL )";
        List<Trabajador> Lista = new ArrayList<Trabajador>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Trabajador x = new Trabajador();
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setNo_trabajador(rs.getString("no_trabajador"));
                x.setAp_paterno(rs.getString("ap_paterno"));
                x.setAp_materno(rs.getString("ap_materno"));
                x.setNu_doc_c(rs.getString("nu_doc_c"));
                x.setLi_religion(rs.getString("li_religion"));
                x.setDi_correo_personal(rs.getString("di_correo_personal"));
                x.setCl_tra(rs.getString("cl_tra"));
                Lista.add(x);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public void INSERT_CUENTA_SUELDO(String ID_CUENTA_SUELDO, String NO_BANCO, String NU_CUENTA, String NU_CUENTA_BANC, String ES_GEM_NU_CUENTA, String NO_BANCO_OTROS, String ID_TRABAJADOR, String ES_CUENTA_SUELDO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_CUENTA_SUELDO( ?, ?, ?, ?, ?, ?, ?, ?)} ");
            cst.setString(1, null);
            cst.setString(2, NO_BANCO);
            cst.setString(3, NU_CUENTA);
            cst.setString(4, NU_CUENTA_BANC);
            cst.setString(5, ES_GEM_NU_CUENTA);
            cst.setString(6, NO_BANCO_OTROS);
            cst.setString(7, ID_TRABAJADOR);
            cst.setString(8, ES_CUENTA_SUELDO);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public String CuentaSueldoTra(String ID_TRABAJADOR) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select ES_CUENTA_SUELDO from RHTD_CUENTA_SUELDO where ID_TRABAJADOR = '" + ID_TRABAJADOR + "'";
        String es_cs = "0";
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                es_cs = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return es_cs;
    }

    @Override
    public void MOD_DAT_GEN(String AP_PATERNO, String AP_MATERNO, String NO_TRABAJADOR, String TI_DOC, String NU_DOC, String ES_CIVIL, String FE_NAC, String ID_NACIONALIDAD, String ID_DEPARTAMENTO, String ID_PROVINCIA, String ID_DISTRITO, String TE_TRABAJADOR, String CL_TRA, String DI_CORREO_PERSONAL, String DI_CORREO_INST, String CO_SISTEMA_PENSIONARIO, String ES_SEXO, String LI_GRUPO_SANGUINEO, String ID_NO_AFP, String ES_AFILIADO_ESSALUD, String LI_TIPO_TRABAJADOR, String ES_FACTOR_RH, String ID_TRABAJADOR, String US_MODIF, String IP_USUARIO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MOD_TRA_DET_GEN( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)} ");
            cst.setString(1, AP_PATERNO);
            cst.setString(2, AP_MATERNO);
            cst.setString(3, NO_TRABAJADOR);
            cst.setString(4, TI_DOC);
            cst.setString(5, NU_DOC);
            cst.setString(6, ES_CIVIL);
            cst.setString(7, DateFormat.toFormat1(FE_NAC));
            cst.setString(8, ID_NACIONALIDAD);
            cst.setString(9, ID_DEPARTAMENTO);
            cst.setString(10, ID_PROVINCIA);
            cst.setString(11, ID_DISTRITO);
            cst.setString(12, TE_TRABAJADOR);
            cst.setString(13, CL_TRA);
            cst.setString(14, DI_CORREO_PERSONAL);
            cst.setString(15, DI_CORREO_INST);
            cst.setString(16, CO_SISTEMA_PENSIONARIO);
            cst.setString(17, ES_SEXO);
            cst.setString(18, LI_GRUPO_SANGUINEO);
            cst.setString(19, ID_NO_AFP);
            cst.setString(20, ES_AFILIADO_ESSALUD);
            cst.setString(21, LI_TIPO_TRABAJADOR);
            cst.setString(22, ES_FACTOR_RH);
            cst.setString(23, ID_TRABAJADOR.trim());
            cst.setString(24, US_MODIF);
            cst.setString(25, IP_USUARIO);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<Cuenta_Sueldo> List_Cuenta_Sueldo(String idtr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHTD_CUENTA_SUELDO WHERE ID_TRABAJADOR = '" + idtr + "'";
        List<Cuenta_Sueldo> list = new ArrayList<Cuenta_Sueldo>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Cuenta_Sueldo cs = new Cuenta_Sueldo();
                cs.setId_cuenta_sueldo(rs.getString("Id_cuenta_sueldo"));
                cs.setNo_banco(rs.getString("no_banco"));
                cs.setNu_cuenta(rs.getString("nu_cuenta"));
                cs.setNu_cuenta_banc(rs.getString("nu_cuenta_banc"));
                cs.setEs_gem_nu_cuenta(rs.getString("es_gem_nu_cuenta"));
                cs.setNo_banco_otros(rs.getString("no_banco_otros"));
                cs.setId_trabajador(rs.getString("id_trabajador"));
                cs.setEs_cuenta_sueldo(rs.getString("es_cuenta_sueldo"));
                list.add(cs);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public void MOD_ASPEC_ACADEM(String LI_NIVEL_EDUCATIVO, String REGIMEN, String ES_INS_PERU, String CARRERA, String DE_ANNO_EGRESO, String CM_OTROS_ESTUDIOS, String CA_TIPO_HORA_PAGO_REFERENCIAL, String ID_TRABAJADOR, String CO_UNIVERSITARIO, String US_MODIF, String IP_USUARIO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MOD_TRA_ASP_ACAD( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ? )} ");
            cst.setString(1, LI_NIVEL_EDUCATIVO);
            cst.setString(2, REGIMEN);
            cst.setString(3, ES_INS_PERU);
            cst.setString(4, CARRERA);
            cst.setString(5, DE_ANNO_EGRESO);
            cst.setString(6, CM_OTROS_ESTUDIOS);
            cst.setString(7, CA_TIPO_HORA_PAGO_REFERENCIAL);
            cst.setString(8, ID_TRABAJADOR);
            cst.setString(9, CO_UNIVERSITARIO);
            cst.setString(10, US_MODIF);
            cst.setString(11, IP_USUARIO);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public void MOD_CUENTA_SUELDO(String NO_BANCO, String NU_CUENTA, String NU_CUENTA_BANC, String ES_GEM_NU_CUENTA, String NO_BANCO_OTROS_SP, String ID_TRABAJADOR, String ES_CUENTA_SUELDO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MOD_TRA_CUEN_SUELDO( ?, ?, ?, ?, ?, ?, ?)} ");
            cst.setString(1, NO_BANCO);
            cst.setString(2, NU_CUENTA);
            cst.setString(3, NU_CUENTA_BANC);
            cst.setString(4, ES_GEM_NU_CUENTA);
            cst.setString(5, NO_BANCO_OTROS_SP);
            cst.setString(6, ID_TRABAJADOR);
            cst.setString(7, ES_CUENTA_SUELDO);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<Universidad_Carrera> List_Uni_Carr() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHTX_UNIVERSIDAD_CARRERA";
        List<Universidad_Carrera> list = new ArrayList<Universidad_Carrera>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Universidad_Carrera cs = new Universidad_Carrera();
                cs.setId_universidad_carrera(rs.getString("id_universidad_carrera"));
                cs.setId_carrera(rs.getString("id_carrera"));
                cs.setId_universidad(rs.getString("id_universidad"));
                cs.setEs_uni_carr(rs.getString("es_uni_carr"));

                list.add(cs);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public void MOD_ASPEC_SOCIAL(String LI_DI_DOM_A_D1, String DI_DOM_A_D2, String LI_DI_DOM_A_D3, String DI_DOM_A_D4, String LI_DI_DOM_A_D5, String DI_DOM_A_D6, String DI_DOM_A_REF, String ID_DI_DOM_A_DISTRITO, String LI_DI_DOM_LEG_D1, String DI_DOM_LEG_D2, String LI_DI_DOM_LEG_D3, String DI_DOM_LEG_D4, String LI_DI_DOM_LEG_D5, String DI_DOM_LEG_D6, String ID_DOM_LEG_DISTRITO, String CA_ING_QTA_CAT_EMPRESA, String CA_ING_QTA_RUC, String CA_ING_QTA_CAT_OTRAS_EMPRESAS, String ID_TRABAJADOR, String US_MODIF, String IP_USUARIO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MOD_TRA_ASP_SOCIAL( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)} ");
            cst.setString(1, LI_DI_DOM_A_D1);
            cst.setString(2, DI_DOM_A_D2);
            cst.setString(3, LI_DI_DOM_A_D3);
            cst.setString(4, DI_DOM_A_D4);
            cst.setString(5, LI_DI_DOM_A_D5);
            cst.setString(6, DI_DOM_A_D6);
            cst.setString(7, DI_DOM_A_REF);
            cst.setString(8, ID_DI_DOM_A_DISTRITO);
            cst.setString(9, LI_DI_DOM_LEG_D1);
            cst.setString(10, DI_DOM_LEG_D2);
            cst.setString(11, LI_DI_DOM_LEG_D3);
            cst.setString(12, DI_DOM_LEG_D4);
            cst.setString(13, LI_DI_DOM_LEG_D5);
            cst.setString(14, DI_DOM_LEG_D6);
            cst.setString(15, ID_DOM_LEG_DISTRITO);
            cst.setString(16, CA_ING_QTA_CAT_EMPRESA);
            cst.setString(17, CA_ING_QTA_RUC);
            cst.setString(18, CA_ING_QTA_CAT_OTRAS_EMPRESAS);
            cst.setString(19, ID_TRABAJADOR);
            cst.setString(20, US_MODIF);
            cst.setString(21, IP_USUARIO);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public String REG_DOC_TRABAJADOR(String trb) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(*) from RHTV_DGP_DOC_ADJ where ID_TRABAJADOR = " + trb + "";
        String n = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                n = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return n;
    }

    @Override
    public String ID_TRB(String user) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select ID_TRABAJADOR from RHVD_USUARIO where ID_USUARIO = '" + user + "'";
        String id = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                id = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return id;
    }

    @Override
    public String ip() {
        String x = "";
        InetAddress ip;
        try {
            ip = InetAddress.getLocalHost();
            NetworkInterface network = NetworkInterface.getByInetAddress(ip);
            byte[] mac = network.getHardwareAddress();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < mac.length; i++) {
                sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
            }
            x = ip.getHostAddress() + "*" + ip.getCanonicalHostName() + "*" + sb.toString();

        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (SocketException e) {
            e.printStackTrace();
        }
        return x;
    }

    @Override
    public boolean val_nu_doc(String nu_doc) {

        boolean val = false;
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(*)  from rhtm_trabajador where trim(NU_DOC)='" + nu_doc.trim() + "'";
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                if (rs.getString(1).trim().equals("1")) {
                    val = true;
                } else {
                    val = false;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
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
    public String Cod_aps_x_idt(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT CO_APS FROM RHTD_EMPLEADO WHERE ID_TRABAJADOR='" + id_trabajador.trim() + "'";
        String co_ap = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                co_ap = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return co_ap;
    }

    @Override
    public String Cod_huella_x_idt(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT CO_HUELLA_DIGITAL FROM RHTD_EMPLEADO WHERE ID_TRABAJADOR='" + id_trabajador.trim() + "'";
        String co_hu = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                co_hu = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return co_hu;
    }

    @Override
    public int cod_uni_unico(String cod_uni) {
        int n = 0;
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count (*) from RHTM_TRABAJADOR where CO_UNIVERSITARIO = '" + cod_uni + "'";
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            n = rs.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al validar el codigo universitario");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return n;
    }

    @Override
    public int ShowPorcentageTrabajador(String idtr) {
        int porcentaje = 0;
        int acum = 0;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT  AP_PATERNO,"
                    + "  AP_MATERNO,"
                    + "  NO_TRABAJADOR,"
                    + "  TI_DOC,"
                    + "  NU_DOC,"
                    + "  ES_CIVIL,"
                    + "  FE_NAC,"
                    + "  ID_NACIONALIDAD,"
                    + "  ID_DISTRITO,"
                    + "  TE_TRABAJADOR,"
                    + "  CL_TRA,"
                    + "  DI_CORREO_PERSONAL,"
                    + "  DI_CORREO_INST,"
                    + "  CO_SISTEMA_PENSIONARIO,"
                    + "  ID_SITUACION_EDUCATIVA,"
                    + "  ES_SEXO,"
                    + "  LI_GRUPO_SANGUINEO,"
                    + "  LI_RELIGION,"
                    + "  NO_IGLESIA,"
                    + "  ID_NO_AFP,"
                    + "  ES_AFILIADO_ESSALUD,"
                    + "  LI_TIPO_TRABAJADOR,"
                    + "  LI_DI_DOM_A_D1,"
                    + "  DI_DOM_A_D2,"
                    + "  LI_DI_DOM_A_D3,"
                    + "  DI_DOM_A_D4,"
                    + "  LI_DI_DOM_A_D5,"
                    + "  DI_DOM_A_D6,"
                    + "  DI_DOM_A_REF,"
                    + "  ID_DI_DOM_A_DISTRITO,"
                    + "  LI_DI_DOM_LEG_D1,"
                    + "  DI_DOM_LEG_D2,"
                    + "  LI_DI_DOM_LEG_D3,"
                    + "  DI_DOM_LEG_D4,"
                    + "  LI_DI_DOM_LEG_D5,"
                    + "  DI_DOM_LEG_D6,"
                    + "  ID_DI_DOM_LEG_DISTRITO,"
                    + "  US_CREACION,"
                    + "  FE_CREACION,"
                    + "  IP_USUARIO FROM rhtm_trabajador where id_trabajador ='" + idtr + "' ";
            try (ResultSet rs = this.conn.query(sql)) {
                if (rs.next()) {
                    //  Map<String, Object> rec = new HashMap<String, Object>();
                    for (int i = 1; i < 40; i++) {
                        if (rs.getString(i) == null) {

                        } else {
                            acum++;
                        }
                    }
                    System.out.println("acum:"+acum);
                    porcentaje = (int) ((acum / 40.0) * 100);
                             System.out.println("porcentage:"+porcentaje);
                }
            }
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
        return porcentaje;

    }

    @Override
    public boolean UpdateEsDiezmo(String idtr, int estado) {
        boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL rhsp_mod_es_diezmo( ?, ?)} ");
            cst.setString(1, idtr);
            cst.setInt(2, estado);
            cst.execute();
            x = true;
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
        return x;

    }

    @Override
    public int ShowEsDiezmoTrabajador(String idtr) {
        int estado = 0;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT es_diezmo FROM rhtm_trabajador where id_trabajador ='" + idtr + "' ";
            ResultSet rs = this.conn.query(sql);
            if (rs.next()) {
                estado = Integer.parseInt(rs.getString(1));
            }
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
        return estado;

    }

    @Override
    public String[] ShowAFP_ONP(String idtr) {
        String[] data = new String[2];
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT ID_NO_AFP,CO_SISTEMA_PENSIONARIO FROM rhtm_trabajador where id_trabajador ='" + idtr + "' ";
            ResultSet rs = this.conn.query(sql);

            Logger.getLogger(getClass().getName()).log(Level.INFO, sql);
            if (rs.next()) {
                data[0] = rs.getString("ID_NO_AFP");
                data[1] = rs.getString("CO_SISTEMA_PENSIONARIO");
            }
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
        return data;

    }
}
