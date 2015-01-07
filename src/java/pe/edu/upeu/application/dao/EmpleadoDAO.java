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
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.V_List_Empleado;

/**
 *
 * @author Alfa.sistemas
 */
public class EmpleadoDAO implements InterfaceEmpleadoDAO {

    ConexionBD conn;

    @Override
    public String Id_Puesto_Personal(String ide) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_puesto from RHVD_EMP_PU_DIR_DEP WHERE ID_EMPLEADO='" + ide + "'";
        String id = null;
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            id = rs.getString("id_puesto");
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return id;
    }

    @Override
    public void VALIDAR_EMPLEADO(String id_tra) {

        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_VAL_EMP ( ? )}");
            cst.setString(1, id_tra);
            cst.execute();
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

    }

    @Override
    public List<V_List_Empleado> Listar_Empleado(String id_departamento) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_LIST_EMPLEADO WHERE ID_departamento='" + id_departamento + "'  order by id_contrato desc";
        List<V_List_Empleado> list = new ArrayList<V_List_Empleado>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_List_Empleado v = new V_List_Empleado();
                v.setEs_inst_educ_peru(rs.getString("es_inst_educ_peru"));
                v.setN(rs.getString("n"));
                v.setNn(rs.getString("nn"));
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
                v.setNo_s_educativa(rs.getString("no_s_educativa"));
                v.setNo_carrera(rs.getString("no_carrera"));
                v.setNo_universidad(rs.getString("no_universidad"));
                v.setAr_foto(rs.getString("ar_foto"));
                v.setDe_foto(rs.getString("de_foto"));
                v.setId_foto(rs.getString("id_foto"));
                v.setNo_ar_foto(rs.getString("no_ar_foto"));
                v.setTa_ar_foto(rs.getString("ta_ar_foto"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setNo_area(rs.getString("no_area"));
                v.setId_direccion(rs.getString("id_direccion"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setId_area(rs.getString("id_area"));
                v.setId_seccion(rs.getString("id_seccion"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setId_empleado(rs.getString("id_empleado"));
                v.setFe_creacion_contrato(rs.getString("fe_creacion_contrato"));
                v.setCa_sueldo(rs.getDouble("ca_sueldo"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setId_contrato(rs.getString("id_contrato"));
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
                list.add(v);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }
     @Override
    public List<V_List_Empleado> Listar_Empleado() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_LIST_EMPLEADO ";
        List<V_List_Empleado> list = new ArrayList<V_List_Empleado>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_List_Empleado v = new V_List_Empleado();
                v.setEs_inst_educ_peru(rs.getString("es_inst_educ_peru"));
                v.setN(rs.getString("n"));
                v.setNn(rs.getString("nn"));
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
                v.setNo_s_educativa(rs.getString("no_s_educativa"));
                v.setNo_carrera(rs.getString("no_carrera"));
                v.setNo_universidad(rs.getString("no_universidad"));
                v.setAr_foto(rs.getString("ar_foto"));
                v.setDe_foto(rs.getString("de_foto"));
                v.setId_foto(rs.getString("id_foto"));
                v.setNo_ar_foto(rs.getString("no_ar_foto"));
                v.setTa_ar_foto(rs.getString("ta_ar_foto"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setNo_area(rs.getString("no_area"));
                v.setId_direccion(rs.getString("id_direccion"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setId_area(rs.getString("id_area"));
                v.setId_seccion(rs.getString("id_seccion"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setId_empleado(rs.getString("id_empleado"));
                v.setFe_creacion_contrato(rs.getString("fe_creacion_contrato"));
                v.setCa_sueldo(rs.getDouble("ca_sueldo"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setId_contrato(rs.getString("id_contrato"));
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
                list.add(v);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<V_List_Empleado> Listar_Emp() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_LIST_EMPLEADO order by ap_paterno ";
        List<V_List_Empleado> list = new ArrayList<V_List_Empleado>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_List_Empleado em = new V_List_Empleado();
                em.setFe_desde(rs.getString("fe_desde"));
                em.setFe_hasta(rs.getString("fe_hasta"));
                em.setNu_doc(rs.getString("nu_doc"));
                em.setId_contrato(rs.getString("id_contrato"));
                em.setId_trabajador(rs.getString("id_trabajador"));
                em.setAp_paterno(rs.getString("ap_paterno"));
                em.setAp_materno(rs.getString("ap_materno"));
                em.setNo_trabajador(rs.getString("no_trabajador"));
                em.setNo_puesto(rs.getString("no_puesto"));
                em.setNo_seccion(rs.getString("no_seccion"));
                em.setNo_area(rs.getString("no_area"));
                em.setId_direccion(rs.getString("id_direccion"));
                em.setNo_dep(rs.getString("no_dep"));
                em.setId_departamento(rs.getString("id_departamento"));
                em.setId_area(rs.getString("id_area"));
                em.setId_seccion(rs.getString("id_seccion"));
                em.setId_puesto(rs.getString("id_puesto"));
                em.setId_empleado(rs.getString("id_empleado"));
                em.setFe_creacion(rs.getString("fe_creacion"));
                em.setCa_sueldo(rs.getDouble("ca_sueldo"));
                list.add(em);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

}
