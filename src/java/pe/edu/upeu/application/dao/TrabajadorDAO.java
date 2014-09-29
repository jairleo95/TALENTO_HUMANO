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
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.V_Ficha_Trab_Num_C;
import pe.edu.upeu.application.model.X_List_dat_tr_plantilla;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author Jose
 */
public class TrabajadorDAO implements InterfaceTrabajadorDAO {

    CConversion c = new CConversion();
    ConexionBD conn;

    @Override
    public String Calculaedad(String fecha_nac) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void INSERT_TRABAJADOR(String ID_TRABAJADOR, String AP_PATERNO, String AP_MATERNO, String NO_TRABAJADOR, String TI_DOC, String NU_DOC, String ES_CIVIL, String FE_NAC, String ID_NACIONALIDAD, String ID_DEPARTAMENTO, String ID_PROVINCIA, String ID_DISTRITO, String TE_TRABAJADOR, String CL_TRA, String DI_CORREO_PERSONAL, String DI_CORREO_INST, String CO_SISTEMA_PENSIONARIO, String ID_SITUACION_EDUCATIVA, String LI_REG_INST_EDUCATIVA, String ES_INST_EDUC_PERU, String ID_UNIVERSIDAD_CARRERA, String DE_ANNO_EGRESO, String CM_OTROS_ESTUDIOS, String ES_SEXO, String LI_GRUPO_SANGUINEO, String DE_REFERENCIA, String LI_RELIGION, String NO_IGLESIA, String DE_CARGO, String LI_AUTORIDAD, String NO_AP_AUTORIDAD, String CL_AUTORIDAD, String ID_NO_AFP, String ES_AFILIADO_ESSALUD, String LI_TIPO_TRABAJADOR, String CA_TIPO_HORA_PAGO_REFEERENCIAL, String ES_FACTOR_RH, String LI_DI_DOM_A_D1, String DI_DOM_A_D2, String LI_DI_DOM_A_D3, String DI_DOM_A_D4, String LI_DI_DOM_A_D5, String DI_DOM_A_D6, String DI_DOM_A_REF, String ID_DI_DOM_A_DISTRITO, String LI_DI_DOM_LEG_D1, String DI_DOM_LEG_D2, String LI_DI_DOM_LEG_D3, String DI_DOM_LEG_D4, String LI_DI_DOM_LEG_D5, String DI_DOM_LEG_D6, String ID_DI_DOM_LEG_DISTRITO, String CA_ING_QTA_CAT_EMPRESA, String CA_ING_QTA_CAT_RUC, String CA_ING_QTA_CAT_OTRAS_EMPRESAS, String CM_OBSERVACIONES, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);

            cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_TRABAJADOR( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, AP_PATERNO);
            cst.setString(3, AP_MATERNO);
            cst.setString(4, NO_TRABAJADOR);
            cst.setString(5, TI_DOC);
            cst.setString(6, NU_DOC);
            cst.setString(7, ES_CIVIL);
            cst.setString(8, c.convertFecha(FE_NAC));
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
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            this.conn.close();
        }
    }

    @Override
    public boolean EliminarTrabajador(String id, String idc) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<V_Ficha_Trab_Num_C> ListarTrabajador(String iddep, String dni, String nom, String ape_p, String ape_m) {
        /*if (dni != null || !"".equals(nom)) {

         }*/
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select d.*  from (select * from RHVD_FICHA_TRAB_NUM_C) d, RHVD_USUARIO u where u.id_usuario= d.id_usuario_creacion";
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

                v.setId_trabajador(rs.getString("ID_TRABAJADOR"));
                v.setAp_paterno(rs.getString("AP_PATERNO"));
                v.setAp_materno(rs.getString("AP_MATERNO"));
                v.setNo_trabajador(rs.getString("NO_TRABAJADOR"));
                v.setTi_doc(rs.getString("TI_DOC"));
                v.setNu_doc(rs.getString("NU_DOC"));
                v.setEs_civil(rs.getString("ES_CIVIL"));
                v.setFe_nac(rs.getString("FE_NAC"));
                v.setNo_universidad(rs.getString("NO_UNIVERSIDAD"));
                v.setNo_departamento(rs.getString("NO_DEPARTAMENTO"));
                v.setNo_provincia(rs.getString("NO_PROVINCIA"));
                v.setNo_distrito(rs.getString("NO_DISTRITO"));
                v.setTe_trabajador(rs.getString("TE_TRABAJADOR"));
                v.setCl_tra(rs.getString("CL_TRA"));
                v.setDi_correo_personal(rs.getString("DI_CORREO_PERSONAL"));
                v.setDi_correo_inst(rs.getString("DI_CORREO_INST"));
                v.setCo_sistema_pensionario(rs.getString("CO_SISTEMA_PENSIONARIO"));
                  v.setLi_nivel_educativo(rs.getString("NO_S_EDUCATIVA"));
                //  v.setLi_grado_academico(rs.getString("LI_GRADO_ACADEMICO"));
                //   v.setLi_titulo_profesional(rs.getString("LI_TITULO_PROFESIONAL"));
                v.setNo_carrera(rs.getString("NO_CARRERA"));

                v.setCm_otros_estudios(rs.getString("CM_OTROS_ESTUDIOS"));
                v.setEs_sexo(rs.getString("ES_SEXO"));
                v.setLi_grupo_sanguineo(rs.getString("LI_GRUPO_SANGUINEO"));
                v.setDe_referencia(rs.getString("DE_REFERENCIA"));
                v.setLi_religion(rs.getString("LI_RELIGION"));
                v.setNo_iglesia(rs.getString("NO_IGLESIA"));
                v.setDe_cargo(rs.getString("DE_CARGO"));
                v.setLi_autoridad(rs.getString("LI_AUTORIDAD"));
                v.setNo_ap_autoridad(rs.getString("NO_AP_AUTORIDAD"));
                v.setCl_autoridad(rs.getString("CL_AUTORIDAD"));
                v.setId_no_afp(rs.getString("ID_NO_AFP"));
                v.setEs_afiliado_essalud(rs.getString("ES_AFILIADO_ESSALUD"));
                v.setLi_tipo_trabajador(rs.getString("LI_TIPO_TRABAJADOR"));
                v.setCa_tipo_hora_pago_refeerencial(rs.getString("CA_TIPO_HORA_PAGO_REFEERENCIAL"));
                v.setEs_factor_rh(rs.getString("ES_FACTOR_RH"));
                v.setLi_di_dom_a_d1(rs.getString("LI_DI_DOM_A_D1"));
                v.setDi_dom_a_d2(rs.getString("DI_DOM_A_D2"));
                v.setLi_di_dom_a_d3(rs.getString("LI_DI_DOM_A_D3"));
                v.setDi_dom_a_d4(rs.getString("DI_DOM_A_D4"));
                v.setLi_di_dom_a_d5(rs.getString("LI_DI_DOM_A_D5"));
                v.setDi_dom_a_d6(rs.getString("DI_DOM_A_D6"));
                v.setDi_dom_a_ref(rs.getString("DI_DOM_A_REF"));
                v.setDi_dom_a_distrito(rs.getString("DI_DOM_A_DISTRITO"));
                v.setLi_di_dom_leg_d1(rs.getString("LI_DI_DOM_LEG_D1"));
                v.setDi_dom_leg_d2(rs.getString("DI_DOM_LEG_D2"));
                v.setLi_di_dom_leg_d3(rs.getString("LI_DI_DOM_LEG_D3"));
                v.setDi_dom_leg_d4(rs.getString("DI_DOM_LEG_D4"));
                v.setLi_di_dom_leg_d5(rs.getString("LI_DI_DOM_LEG_D5"));
                v.setDi_dom_leg_d6(rs.getString("DI_DOM_LEG_D6"));
                v.setDi_dom_leg_distrito(rs.getString("DI_DOM_LEG_DISTRITO"));
                v.setCa_ing_qta_cat_empresa(rs.getString("CA_ING_QTA_CAT_EMPRESA"));
                v.setCa_ing_qta_cat_ruc(rs.getString("CA_ING_QTA_CAT_RUC"));
                v.setCa_ing_qta_cat_otras_empresas(rs.getString("CA_ING_QTA_CAT_OTRAS_EMPRESAS"));
                v.setCm_observaciones(rs.getString("CM_OBSERVACIONES"));
                v.setUs_creacion(rs.getString("US_CREACION"));
                v.setFe_creacion(rs.getString("FE_CREACION"));
                v.setUs_modif(rs.getString("US_MODIF"));
                v.setFe_modif(rs.getString("FE_MODIF"));
                v.setIp_usuario(rs.getString("IP_USUARIO"));
                v.setIdtr(rs.getString("IDTR"));
                list.add(v);
            }

        } catch (SQLException e) {

            System.err.println("Error :" + e.getMessage());

        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<V_Ficha_Trab_Num_C> ListaridTrabajador(String id) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHVD_FICHA_TRAB_NUM_C where ID_TRABAJADOR='" + id + "'";
        List<V_Ficha_Trab_Num_C> list = new ArrayList<V_Ficha_Trab_Num_C>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Ficha_Trab_Num_C v = new V_Ficha_Trab_Num_C();
                v.setId_trabajador(rs.getString("ID_TRABAJADOR"));
                v.setAp_paterno(rs.getString("AP_PATERNO"));
                v.setAp_materno(rs.getString("AP_MATERNO"));
                v.setNo_trabajador(rs.getString("NO_TRABAJADOR"));
                v.setTi_doc(rs.getString("TI_DOC"));
                v.setNu_doc(rs.getString("NU_DOC"));
                v.setEs_civil(rs.getString("ES_CIVIL"));
                v.setFe_nac(rs.getString("FE_NAC"));
                // v.setNo_universidad(rs.getString("NO_UNIVERSIDAD"));
                v.setNo_departamento(rs.getString("NO_DEPARTAMENTO"));
                v.setNo_provincia(rs.getString("NO_PROVINCIA"));
                v.setNo_distrito(rs.getString("NO_DISTRITO"));
                v.setTe_trabajador(rs.getString("TE_TRABAJADOR"));
                v.setCl_tra(rs.getString("CL_TRA"));
                v.setDi_correo_personal(rs.getString("DI_CORREO_PERSONAL"));
                v.setDi_correo_inst(rs.getString("DI_CORREO_INST"));
                v.setCo_sistema_pensionario(rs.getString("CO_SISTEMA_PENSIONARIO"));
                //v.setLi_nivel_educativo(rs.getString("LI_NIVEL_EDUCATIVO"));
                //v.setLi_grado_academico(rs.getString("LI_GRADO_ACADEMICO"));
                //v.setLi_titulo_profesional(rs.getString("LI_TITULO_PROFESIONAL"));
                //  v.setNo_carrera(rs.getString("NO_CARRERA"));
                //   v.setNo_universidad(rs.getString("NO_UNIVERSIDAD"));
                v.setCm_otros_estudios(rs.getString("CM_OTROS_ESTUDIOS"));
                v.setEs_sexo(rs.getString("ES_SEXO"));
                v.setLi_grupo_sanguineo(rs.getString("LI_GRUPO_SANGUINEO"));
                v.setDe_referencia(rs.getString("DE_REFERENCIA"));
                v.setLi_religion(rs.getString("LI_RELIGION"));
                v.setNo_iglesia(rs.getString("NO_IGLESIA"));
                v.setDe_cargo(rs.getString("DE_CARGO"));
                v.setLi_autoridad(rs.getString("LI_AUTORIDAD"));
                v.setNo_ap_autoridad(rs.getString("NO_AP_AUTORIDAD"));
                v.setCl_autoridad(rs.getString("CL_AUTORIDAD"));
                v.setId_no_afp(rs.getString("ID_NO_AFP"));
                v.setEs_afiliado_essalud(rs.getString("ES_AFILIADO_ESSALUD"));
                v.setLi_tipo_trabajador(rs.getString("LI_TIPO_TRABAJADOR"));
                v.setCa_tipo_hora_pago_refeerencial(rs.getString("CA_TIPO_HORA_PAGO_REFEERENCIAL"));
                v.setEs_factor_rh(rs.getString("ES_FACTOR_RH"));
                v.setLi_di_dom_a_d1(rs.getString("LI_DI_DOM_A_D1"));
                v.setDi_dom_a_d2(rs.getString("DI_DOM_A_D2"));
                v.setLi_di_dom_a_d3(rs.getString("LI_DI_DOM_A_D3"));
                v.setDi_dom_a_d4(rs.getString("DI_DOM_A_D4"));
                v.setLi_di_dom_a_d5(rs.getString("LI_DI_DOM_A_D5"));
                v.setDi_dom_a_d6(rs.getString("DI_DOM_A_D6"));
                v.setDi_dom_a_ref(rs.getString("DI_DOM_A_REF"));
                v.setDi_dom_a_distrito(rs.getString("DI_DOM_A_DISTRITO"));
                v.setLi_di_dom_leg_d1(rs.getString("LI_DI_DOM_LEG_D1"));
                v.setDi_dom_leg_d2(rs.getString("DI_DOM_LEG_D2"));
                v.setLi_di_dom_leg_d3(rs.getString("LI_DI_DOM_LEG_D3"));
                v.setDi_dom_leg_d4(rs.getString("DI_DOM_LEG_D4"));
                v.setLi_di_dom_leg_d5(rs.getString("LI_DI_DOM_LEG_D5"));
                v.setDi_dom_leg_d6(rs.getString("DI_DOM_LEG_D6"));
                v.setDi_dom_leg_distrito(rs.getString("DI_DOM_LEG_DISTRITO"));
                v.setCa_ing_qta_cat_empresa(rs.getString("CA_ING_QTA_CAT_EMPRESA"));
                v.setCa_ing_qta_cat_ruc(rs.getString("CA_ING_QTA_CAT_RUC"));
                v.setCa_ing_qta_cat_otras_empresas(rs.getString("CA_ING_QTA_CAT_OTRAS_EMPRESAS"));
                v.setCm_observaciones(rs.getString("CM_OBSERVACIONES"));
                v.setUs_creacion(rs.getString("US_CREACION"));
                v.setFe_creacion(rs.getString("FE_CREACION"));
                v.setUs_modif(rs.getString("US_MODIF"));
                v.setFe_modif(rs.getString("FE_MODIF"));
                v.setIp_usuario(rs.getString("IP_USUARIO"));
                v.setIdtr(rs.getString("IDTR"));
                list.add(v);
            }

        } catch (SQLException e) {
        } finally {
            this.conn.close();
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
        } finally {
            this.conn.close();
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

}
