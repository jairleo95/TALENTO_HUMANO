/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.model;
    
/**
 *
 * @author joserodrigo
 */
public class Datos_Generales {
    private String id_contrato;
private String id_trabajador;
private String ap_paterno;
private String ap_materno;
private String no_trabajador;
private String ti_doc;
private String nu_doc;
private String es_civil;
private String fe_nac;
private String no_nacionalidad;
private String no_departamento;
private String no_provincia;
private String no_distrito;
private String te_trabajador;
private String cl_tra;
private String di_correo_personal;
private String di_correo_inst;
private String co_sistema_pensionario;
private String id_situacion_educativa;
private String li_reg_inst_educativa;
private String es_inst_educ_peru;
private String cm_otros_estudios;
private String es_sexo;
private String li_grupo_sanguineo;
private String de_referencia;
private String li_religion;
private String no_iglesia;
private String de_cargo;
private String li_autoridad;
private String no_ap_autoridad;
private String cl_autoridad;
private String id_no_afp;
private String es_afiliado_essalud;
private String li_tipo_trabajador;
private String ca_tipo_hora_pago_refeerencial;
private String es_factor_rh;
private String li_di_dom_a_d1;
private String di_dom_a_d2;
private String li_di_dom_a_d3;
private String di_dom_a_d4;
private String li_di_dom_a_d5;
private String di_dom_a_d6;
private String di_dom_a_ref;
private String di_dom_a_distrito;
private String li_di_dom_leg_d1;
private String di_dom_leg_d2;
private String li_di_dom_leg_d3;
private String di_dom_leg_d4;
private String li_di_dom_leg_d5;
private String di_dom_leg_d6;
private String di_dom_leg_distrito;
private String ca_ing_qta_cat_empresa;
private String ca_ing_qta_cat_ruc;
private String ca_ing_qta_cat_otras_empresas;
private String cm_observaciones;
private String us_creacion;
private String fe_creacion;
private String us_modif;
private String fe_modif;
private String ip_usuario;
private String id_usuario_creacion;
private String id_universidad_carrera;
private String id_nacionalidad;
private String distrito_nac;
private String no_s_educativa;
private String ap_nombres_madre;
private String ap_nombres_padre;
private String es_trabaja_upeu_c;
private String ap_nombres_c;
private String fe_nac_c;
private String id_tipo_doc_c;
private String nu_doc_c;
private String li_inscripcion_vig_essalud_c;
private String id_conyugue;
private String no_carrera;
private String no_universidad;
private String ar_foto;
private String de_foto;
private String id_foto;
private String no_ar_foto;
private String ta_ar_foto;
private String no_puesto;
private String no_seccion;
private String no_area;
private String id_direccion;
private String no_dep;
private String id_departamento;
private String id_area;
private String id_seccion;
private String id_puesto;
private String id_empleado;
private String fe_creacion_contrato;
private Double ca_sueldo;
private String fe_desde;
private String fe_hasta;
private Double co_aps;
private String de_anno_egreso;
private String id_tipo_institucion;
private Double co_ti_institucion;
private String no_tipo_institucion;
private Double co_regimen;
private String de_regimen;
private String co_universidad;
private String id_carrera;
private String co_carrera;
private String co_nacionalidad;
private String no_direccion;
private String no_completo;

    public Datos_Generales(String id_contrato, String id_trabajador, String ap_paterno, String ap_materno, String no_trabajador, String ti_doc, String nu_doc, String es_civil, String fe_nac, String no_nacionalidad, String no_departamento, String no_provincia, String no_distrito, String te_trabajador, String cl_tra, String di_correo_personal, String di_correo_inst, String co_sistema_pensionario, String id_situacion_educativa, String li_reg_inst_educativa, String es_inst_educ_peru, String cm_otros_estudios, String es_sexo, String li_grupo_sanguineo, String de_referencia, String li_religion, String no_iglesia, String de_cargo, String li_autoridad, String no_ap_autoridad, String cl_autoridad, String id_no_afp, String es_afiliado_essalud, String li_tipo_trabajador, String ca_tipo_hora_pago_refeerencial, String es_factor_rh, String li_di_dom_a_d1, String di_dom_a_d2, String li_di_dom_a_d3, String di_dom_a_d4, String li_di_dom_a_d5, String di_dom_a_d6, String di_dom_a_ref, String di_dom_a_distrito, String li_di_dom_leg_d1, String di_dom_leg_d2, String li_di_dom_leg_d3, String di_dom_leg_d4, String li_di_dom_leg_d5, String di_dom_leg_d6, String di_dom_leg_distrito, String ca_ing_qta_cat_empresa, String ca_ing_qta_cat_ruc, String ca_ing_qta_cat_otras_empresas, String cm_observaciones, String us_creacion, String fe_creacion, String us_modif, String fe_modif, String ip_usuario, String id_usuario_creacion, String id_universidad_carrera, String id_nacionalidad, String distrito_nac, String no_s_educativa, String ap_nombres_madre, String ap_nombres_padre, String es_trabaja_upeu_c, String ap_nombres_c, String fe_nac_c, String id_tipo_doc_c, String nu_doc_c, String li_inscripcion_vig_essalud_c, String id_conyugue, String no_carrera, String no_universidad, String ar_foto, String de_foto, String id_foto, String no_ar_foto, String ta_ar_foto, String no_puesto, String no_seccion, String no_area, String id_direccion, String no_dep, String id_departamento, String id_area, String id_seccion, String id_puesto, String id_empleado, String fe_creacion_contrato, Double ca_sueldo, String fe_desde, String fe_hasta, Double co_aps, String de_anno_egreso, String id_tipo_institucion, Double co_ti_institucion, String no_tipo_institucion, Double co_regimen, String de_regimen, String co_universidad, String id_carrera, String co_carrera, String co_nacionalidad, String no_direccion,String no_completo) {
        this.id_contrato = id_contrato;
        this.id_trabajador = id_trabajador;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.no_trabajador = no_trabajador;
        this.ti_doc = ti_doc;
        this.nu_doc = nu_doc;
        this.es_civil = es_civil;
        this.fe_nac = fe_nac;
        this.no_nacionalidad = no_nacionalidad;
        this.no_departamento = no_departamento;
        this.no_provincia = no_provincia;
        this.no_distrito = no_distrito;
        this.te_trabajador = te_trabajador;
        this.cl_tra = cl_tra;
        this.di_correo_personal = di_correo_personal;
        this.di_correo_inst = di_correo_inst;
        this.co_sistema_pensionario = co_sistema_pensionario;
        this.id_situacion_educativa = id_situacion_educativa;
        this.li_reg_inst_educativa = li_reg_inst_educativa;
        this.es_inst_educ_peru = es_inst_educ_peru;
        this.cm_otros_estudios = cm_otros_estudios;
        this.es_sexo = es_sexo;
        this.li_grupo_sanguineo = li_grupo_sanguineo;
        this.de_referencia = de_referencia;
        this.li_religion = li_religion;
        this.no_iglesia = no_iglesia;
        this.de_cargo = de_cargo;
        this.li_autoridad = li_autoridad;
        this.no_ap_autoridad = no_ap_autoridad;
        this.cl_autoridad = cl_autoridad;
        this.id_no_afp = id_no_afp;
        this.es_afiliado_essalud = es_afiliado_essalud;
        this.li_tipo_trabajador = li_tipo_trabajador;
        this.ca_tipo_hora_pago_refeerencial = ca_tipo_hora_pago_refeerencial;
        this.es_factor_rh = es_factor_rh;
        this.li_di_dom_a_d1 = li_di_dom_a_d1;
        this.di_dom_a_d2 = di_dom_a_d2;
        this.li_di_dom_a_d3 = li_di_dom_a_d3;
        this.di_dom_a_d4 = di_dom_a_d4;
        this.li_di_dom_a_d5 = li_di_dom_a_d5;
        this.di_dom_a_d6 = di_dom_a_d6;
        this.di_dom_a_ref = di_dom_a_ref;
        this.di_dom_a_distrito = di_dom_a_distrito;
        this.li_di_dom_leg_d1 = li_di_dom_leg_d1;
        this.di_dom_leg_d2 = di_dom_leg_d2;
        this.li_di_dom_leg_d3 = li_di_dom_leg_d3;
        this.di_dom_leg_d4 = di_dom_leg_d4;
        this.li_di_dom_leg_d5 = li_di_dom_leg_d5;
        this.di_dom_leg_d6 = di_dom_leg_d6;
        this.di_dom_leg_distrito = di_dom_leg_distrito;
        this.ca_ing_qta_cat_empresa = ca_ing_qta_cat_empresa;
        this.ca_ing_qta_cat_ruc = ca_ing_qta_cat_ruc;
        this.ca_ing_qta_cat_otras_empresas = ca_ing_qta_cat_otras_empresas;
        this.cm_observaciones = cm_observaciones;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modif = us_modif;
        this.fe_modif = fe_modif;
        this.ip_usuario = ip_usuario;
        this.id_usuario_creacion = id_usuario_creacion;
        this.id_universidad_carrera = id_universidad_carrera;
        this.id_nacionalidad = id_nacionalidad;
        this.distrito_nac = distrito_nac;
        this.no_s_educativa = no_s_educativa;
        this.ap_nombres_madre = ap_nombres_madre;
        this.ap_nombres_padre = ap_nombres_padre;
        this.es_trabaja_upeu_c = es_trabaja_upeu_c;
        this.ap_nombres_c = ap_nombres_c;
        this.fe_nac_c = fe_nac_c;
        this.id_tipo_doc_c = id_tipo_doc_c;
        this.nu_doc_c = nu_doc_c;
        this.li_inscripcion_vig_essalud_c = li_inscripcion_vig_essalud_c;
        this.id_conyugue = id_conyugue;
        this.no_carrera = no_carrera;
        this.no_universidad = no_universidad;
        this.ar_foto = ar_foto;
        this.de_foto = de_foto;
        this.id_foto = id_foto;
        this.no_ar_foto = no_ar_foto;
        this.ta_ar_foto = ta_ar_foto;
        this.no_puesto = no_puesto;
        this.no_seccion = no_seccion;
        this.no_area = no_area;
        this.id_direccion = id_direccion;
        this.no_dep = no_dep;
        this.id_departamento = id_departamento;
        this.id_area = id_area;
        this.id_seccion = id_seccion;
        this.id_puesto = id_puesto;
        this.id_empleado = id_empleado;
        this.fe_creacion_contrato = fe_creacion_contrato;
        this.ca_sueldo = ca_sueldo;
        this.fe_desde = fe_desde;
        this.fe_hasta = fe_hasta;
        this.co_aps = co_aps;
        this.de_anno_egreso = de_anno_egreso;
        this.id_tipo_institucion = id_tipo_institucion;
        this.co_ti_institucion = co_ti_institucion;
        this.no_tipo_institucion = no_tipo_institucion;
        this.co_regimen = co_regimen;
        this.de_regimen = de_regimen;
        this.co_universidad = co_universidad;
        this.id_carrera = id_carrera;
        this.co_carrera = co_carrera;
        this.co_nacionalidad = co_nacionalidad;
        this.no_direccion = no_direccion;
        this.no_completo = no_completo;
    }
    public Datos_Generales() {
        this.id_contrato = "";
        this.id_trabajador = "";
        this.ap_paterno = "";
        this.ap_materno = "";
        this.no_trabajador = "";
        this.ti_doc = "";
        this.nu_doc = "";
        this.es_civil = "";
        this.fe_nac = "";
        this.no_nacionalidad = "";
        this.no_departamento = "";
        this.no_provincia = "";
        this.no_distrito = "";
        this.te_trabajador = "";
        this.cl_tra = "";
        this.di_correo_personal = "";
        this.di_correo_inst = "";
        this.co_sistema_pensionario = "";
        this.id_situacion_educativa = "";
        this.li_reg_inst_educativa = "";
        this.es_inst_educ_peru = "";
        this.cm_otros_estudios = "";
        this.es_sexo = "";
        this.li_grupo_sanguineo = "";
        this.de_referencia = "";
        this.li_religion = "";
        this.no_iglesia = "";
        this.de_cargo = "";
        this.li_autoridad = "";
        this.no_ap_autoridad = "";
        this.cl_autoridad = "";
        this.id_no_afp = "";
        this.es_afiliado_essalud = "";
        this.li_tipo_trabajador = "";
        this.ca_tipo_hora_pago_refeerencial = "";
        this.es_factor_rh = "";
        this.li_di_dom_a_d1 = "";
        this.di_dom_a_d2 = "";
        this.li_di_dom_a_d3 = "";
        this.di_dom_a_d4 = "";
        this.li_di_dom_a_d5 = "";
        this.di_dom_a_d6 = "";
        this.di_dom_a_ref = "";
        this.di_dom_a_distrito = "";
        this.li_di_dom_leg_d1 = "";
        this.di_dom_leg_d2 = "";
        this.li_di_dom_leg_d3 = "";
        this.di_dom_leg_d4 = "";
        this.li_di_dom_leg_d5 = "";
        this.di_dom_leg_d6 = "";
        this.di_dom_leg_distrito = "";
        this.ca_ing_qta_cat_empresa = "";
        this.ca_ing_qta_cat_ruc = "";
        this.ca_ing_qta_cat_otras_empresas = "";
        this.cm_observaciones = "";
        this.us_creacion = "";
        this.fe_creacion = "";
        this.us_modif = "";
        this.fe_modif = "";
        this.ip_usuario = "";
        this.id_usuario_creacion = "";
        this.id_universidad_carrera = "";
        this.id_nacionalidad = "";
        this.distrito_nac = "";
        this.no_s_educativa = "";
        this.ap_nombres_madre = "";
        this.ap_nombres_padre = "";
        this.es_trabaja_upeu_c = "";
        this.ap_nombres_c = "";
        this.fe_nac_c = "";
        this.id_tipo_doc_c = "";
        this.nu_doc_c = "";
        this.li_inscripcion_vig_essalud_c = "";
        this.id_conyugue = "";
        this.no_carrera = "";
        this.no_universidad = "";
        this.ar_foto = "";
        this.de_foto = "";
        this.id_foto = "";
        this.no_ar_foto = "";
        this.ta_ar_foto = "";
        this.no_puesto = "";
        this.no_seccion = "";
        this.no_area = "";
        this.id_direccion = "";
        this.no_dep = "";
        this.id_departamento = "";
        this.id_area = "";
        this.id_seccion = "";
        this.id_puesto = "";
        this.id_empleado = "";
        this.fe_creacion_contrato = "";
        this.ca_sueldo = 0.0;
        this.fe_desde = "";
        this.fe_hasta = "";
        this.co_aps = 0.0;
        this.de_anno_egreso = "";
        this.id_tipo_institucion = "";
        this.co_ti_institucion = 0.0;
        this.no_tipo_institucion = "";
        this.co_regimen = 0.0;
        this.de_regimen = "";
        this.co_universidad = "";
        this.id_carrera = "";
        this.co_carrera = "";
        this.co_nacionalidad = "";
        this.no_direccion = "";
        this.no_completo = "";
    }

    public String getId_contrato() {
        return id_contrato;
    }

    public void setId_contrato(String id_contrato) {
        this.id_contrato = id_contrato;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public String getAp_paterno() {
        return ap_paterno;
    }

    public void setAp_paterno(String ap_paterno) {
        this.ap_paterno = ap_paterno;
    }

    public String getAp_materno() {
        return ap_materno;
    }

    public void setAp_materno(String ap_materno) {
        this.ap_materno = ap_materno;
    }

    public String getNo_trabajador() {
        return no_trabajador;
    }

    public void setNo_trabajador(String no_trabajador) {
        this.no_trabajador = no_trabajador;
    }

    public String getTi_doc() {
        return ti_doc;
    }

    public void setTi_doc(String ti_doc) {
        this.ti_doc = ti_doc;
    }

    public String getNu_doc() {
        return nu_doc;
    }

    public void setNu_doc(String nu_doc) {
        this.nu_doc = nu_doc;
    }

    public String getEs_civil() {
        return es_civil;
    }

    public void setEs_civil(String es_civil) {
        this.es_civil = es_civil;
    }

    public String getFe_nac() {
        return fe_nac;
    }

    public void setFe_nac(String fe_nac) {
        this.fe_nac = fe_nac;
    }

    public String getNo_nacionalidad() {
        return no_nacionalidad;
    }

    public void setNo_nacionalidad(String no_nacionalidad) {
        this.no_nacionalidad = no_nacionalidad;
    }

    public String getNo_departamento() {
        return no_departamento;
    }

    public void setNo_departamento(String no_departamento) {
        this.no_departamento = no_departamento;
    }

    public String getNo_provincia() {
        return no_provincia;
    }

    public void setNo_provincia(String no_provincia) {
        this.no_provincia = no_provincia;
    }

    public String getNo_distrito() {
        return no_distrito;
    }

    public void setNo_distrito(String no_distrito) {
        this.no_distrito = no_distrito;
    }

    public String getTe_trabajador() {
        return te_trabajador;
    }

    public void setTe_trabajador(String te_trabajador) {
        this.te_trabajador = te_trabajador;
    }

    public String getCl_tra() {
        return cl_tra;
    }

    public void setCl_tra(String cl_tra) {
        this.cl_tra = cl_tra;
    }

    public String getDi_correo_personal() {
        return di_correo_personal;
    }

    public void setDi_correo_personal(String di_correo_personal) {
        this.di_correo_personal = di_correo_personal;
    }

    public String getDi_correo_inst() {
        return di_correo_inst;
    }

    public void setDi_correo_inst(String di_correo_inst) {
        this.di_correo_inst = di_correo_inst;
    }

    public String getCo_sistema_pensionario() {
        return co_sistema_pensionario;
    }

    public void setCo_sistema_pensionario(String co_sistema_pensionario) {
        this.co_sistema_pensionario = co_sistema_pensionario;
    }

    public String getId_situacion_educativa() {
        return id_situacion_educativa;
    }

    public void setId_situacion_educativa(String id_situacion_educativa) {
        this.id_situacion_educativa = id_situacion_educativa;
    }

    public String getLi_reg_inst_educativa() {
        return li_reg_inst_educativa;
    }

    public void setLi_reg_inst_educativa(String li_reg_inst_educativa) {
        this.li_reg_inst_educativa = li_reg_inst_educativa;
    }

    public String getEs_inst_educ_peru() {
        return es_inst_educ_peru;
    }

    public void setEs_inst_educ_peru(String es_inst_educ_peru) {
        this.es_inst_educ_peru = es_inst_educ_peru;
    }

    public String getCm_otros_estudios() {
        return cm_otros_estudios;
    }

    public void setCm_otros_estudios(String cm_otros_estudios) {
        this.cm_otros_estudios = cm_otros_estudios;
    }

    public String getEs_sexo() {
        return es_sexo;
    }

    public void setEs_sexo(String es_sexo) {
        this.es_sexo = es_sexo;
    }

    public String getLi_grupo_sanguineo() {
        return li_grupo_sanguineo;
    }

    public void setLi_grupo_sanguineo(String li_grupo_sanguineo) {
        this.li_grupo_sanguineo = li_grupo_sanguineo;
    }

    public String getDe_referencia() {
        return de_referencia;
    }

    public void setDe_referencia(String de_referencia) {
        this.de_referencia = de_referencia;
    }

    public String getLi_religion() {
        return li_religion;
    }

    public void setLi_religion(String li_religion) {
        this.li_religion = li_religion;
    }

    public String getNo_iglesia() {
        return no_iglesia;
    }

    public void setNo_iglesia(String no_iglesia) {
        this.no_iglesia = no_iglesia;
    }

    public String getDe_cargo() {
        return de_cargo;
    }

    public void setDe_cargo(String de_cargo) {
        this.de_cargo = de_cargo;
    }

    public String getNo_completo() {
        return no_completo;
    }

    public void setNo_completo(String no_completo) {
        this.no_completo = no_completo;
    }

    public String getLi_autoridad() {
        return li_autoridad;
    }

    public void setLi_autoridad(String li_autoridad) {
        this.li_autoridad = li_autoridad;
    }

    public String getNo_ap_autoridad() {
        return no_ap_autoridad;
    }

    public void setNo_ap_autoridad(String no_ap_autoridad) {
        this.no_ap_autoridad = no_ap_autoridad;
    }

    public String getCl_autoridad() {
        return cl_autoridad;
    }

    public void setCl_autoridad(String cl_autoridad) {
        this.cl_autoridad = cl_autoridad;
    }

    public String getId_no_afp() {
        return id_no_afp;
    }

    public void setId_no_afp(String id_no_afp) {
        this.id_no_afp = id_no_afp;
    }

    public String getEs_afiliado_essalud() {
        return es_afiliado_essalud;
    }

    public void setEs_afiliado_essalud(String es_afiliado_essalud) {
        this.es_afiliado_essalud = es_afiliado_essalud;
    }

    public String getLi_tipo_trabajador() {
        return li_tipo_trabajador;
    }

    public void setLi_tipo_trabajador(String li_tipo_trabajador) {
        this.li_tipo_trabajador = li_tipo_trabajador;
    }

    public String getCa_tipo_hora_pago_refeerencial() {
        return ca_tipo_hora_pago_refeerencial;
    }

    public void setCa_tipo_hora_pago_refeerencial(String ca_tipo_hora_pago_refeerencial) {
        this.ca_tipo_hora_pago_refeerencial = ca_tipo_hora_pago_refeerencial;
    }

    public String getEs_factor_rh() {
        return es_factor_rh;
    }

    public void setEs_factor_rh(String es_factor_rh) {
        this.es_factor_rh = es_factor_rh;
    }

    public String getLi_di_dom_a_d1() {
        return li_di_dom_a_d1;
    }

    public void setLi_di_dom_a_d1(String li_di_dom_a_d1) {
        this.li_di_dom_a_d1 = li_di_dom_a_d1;
    }

    public String getDi_dom_a_d2() {
        return di_dom_a_d2;
    }

    public void setDi_dom_a_d2(String di_dom_a_d2) {
        this.di_dom_a_d2 = di_dom_a_d2;
    }

    public String getLi_di_dom_a_d3() {
        return li_di_dom_a_d3;
    }

    public void setLi_di_dom_a_d3(String li_di_dom_a_d3) {
        this.li_di_dom_a_d3 = li_di_dom_a_d3;
    }

    public String getDi_dom_a_d4() {
        return di_dom_a_d4;
    }

    public void setDi_dom_a_d4(String di_dom_a_d4) {
        this.di_dom_a_d4 = di_dom_a_d4;
    }

    public String getLi_di_dom_a_d5() {
        return li_di_dom_a_d5;
    }

    public void setLi_di_dom_a_d5(String li_di_dom_a_d5) {
        this.li_di_dom_a_d5 = li_di_dom_a_d5;
    }

    public String getDi_dom_a_d6() {
        return di_dom_a_d6;
    }

    public void setDi_dom_a_d6(String di_dom_a_d6) {
        this.di_dom_a_d6 = di_dom_a_d6;
    }

    public String getDi_dom_a_ref() {
        return di_dom_a_ref;
    }

    public void setDi_dom_a_ref(String di_dom_a_ref) {
        this.di_dom_a_ref = di_dom_a_ref;
    }

    public String getDi_dom_a_distrito() {
        return di_dom_a_distrito;
    }

    public void setDi_dom_a_distrito(String di_dom_a_distrito) {
        this.di_dom_a_distrito = di_dom_a_distrito;
    }

    public String getLi_di_dom_leg_d1() {
        return li_di_dom_leg_d1;
    }

    public void setLi_di_dom_leg_d1(String li_di_dom_leg_d1) {
        this.li_di_dom_leg_d1 = li_di_dom_leg_d1;
    }

    public String getDi_dom_leg_d2() {
        return di_dom_leg_d2;
    }

    public void setDi_dom_leg_d2(String di_dom_leg_d2) {
        this.di_dom_leg_d2 = di_dom_leg_d2;
    }

    public String getLi_di_dom_leg_d3() {
        return li_di_dom_leg_d3;
    }

    public void setLi_di_dom_leg_d3(String li_di_dom_leg_d3) {
        this.li_di_dom_leg_d3 = li_di_dom_leg_d3;
    }

    public String getDi_dom_leg_d4() {
        return di_dom_leg_d4;
    }

    public void setDi_dom_leg_d4(String di_dom_leg_d4) {
        this.di_dom_leg_d4 = di_dom_leg_d4;
    }

    public String getLi_di_dom_leg_d5() {
        return li_di_dom_leg_d5;
    }

    public void setLi_di_dom_leg_d5(String li_di_dom_leg_d5) {
        this.li_di_dom_leg_d5 = li_di_dom_leg_d5;
    }

    public String getDi_dom_leg_d6() {
        return di_dom_leg_d6;
    }

    public void setDi_dom_leg_d6(String di_dom_leg_d6) {
        this.di_dom_leg_d6 = di_dom_leg_d6;
    }

    public String getDi_dom_leg_distrito() {
        return di_dom_leg_distrito;
    }

    public void setDi_dom_leg_distrito(String di_dom_leg_distrito) {
        this.di_dom_leg_distrito = di_dom_leg_distrito;
    }

    public String getCa_ing_qta_cat_empresa() {
        return ca_ing_qta_cat_empresa;
    }

    public void setCa_ing_qta_cat_empresa(String ca_ing_qta_cat_empresa) {
        this.ca_ing_qta_cat_empresa = ca_ing_qta_cat_empresa;
    }

    public String getCa_ing_qta_cat_ruc() {
        return ca_ing_qta_cat_ruc;
    }

    public void setCa_ing_qta_cat_ruc(String ca_ing_qta_cat_ruc) {
        this.ca_ing_qta_cat_ruc = ca_ing_qta_cat_ruc;
    }

    public String getCa_ing_qta_cat_otras_empresas() {
        return ca_ing_qta_cat_otras_empresas;
    }

    public void setCa_ing_qta_cat_otras_empresas(String ca_ing_qta_cat_otras_empresas) {
        this.ca_ing_qta_cat_otras_empresas = ca_ing_qta_cat_otras_empresas;
    }

    public String getCm_observaciones() {
        return cm_observaciones;
    }

    public void setCm_observaciones(String cm_observaciones) {
        this.cm_observaciones = cm_observaciones;
    }

    public String getUs_creacion() {
        return us_creacion;
    }

    public void setUs_creacion(String us_creacion) {
        this.us_creacion = us_creacion;
    }

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }

    public String getUs_modif() {
        return us_modif;
    }

    public void setUs_modif(String us_modif) {
        this.us_modif = us_modif;
    }

    public String getFe_modif() {
        return fe_modif;
    }

    public void setFe_modif(String fe_modif) {
        this.fe_modif = fe_modif;
    }

    public String getIp_usuario() {
        return ip_usuario;
    }

    public void setIp_usuario(String ip_usuario) {
        this.ip_usuario = ip_usuario;
    }

    public String getId_usuario_creacion() {
        return id_usuario_creacion;
    }

    public void setId_usuario_creacion(String id_usuario_creacion) {
        this.id_usuario_creacion = id_usuario_creacion;
    }

    public String getId_universidad_carrera() {
        return id_universidad_carrera;
    }

    public void setId_universidad_carrera(String id_universidad_carrera) {
        this.id_universidad_carrera = id_universidad_carrera;
    }

    public String getId_nacionalidad() {
        return id_nacionalidad;
    }

    public void setId_nacionalidad(String id_nacionalidad) {
        this.id_nacionalidad = id_nacionalidad;
    }

    public String getDistrito_nac() {
        return distrito_nac;
    }

    public void setDistrito_nac(String distrito_nac) {
        this.distrito_nac = distrito_nac;
    }

    public String getNo_s_educativa() {
        return no_s_educativa;
    }

    public void setNo_s_educativa(String no_s_educativa) {
        this.no_s_educativa = no_s_educativa;
    }

    public String getAp_nombres_madre() {
        return ap_nombres_madre;
    }

    public void setAp_nombres_madre(String ap_nombres_madre) {
        this.ap_nombres_madre = ap_nombres_madre;
    }

    public String getAp_nombres_padre() {
        return ap_nombres_padre;
    }

    public void setAp_nombres_padre(String ap_nombres_padre) {
        this.ap_nombres_padre = ap_nombres_padre;
    }

    public String getEs_trabaja_upeu_c() {
        return es_trabaja_upeu_c;
    }

    public void setEs_trabaja_upeu_c(String es_trabaja_upeu_c) {
        this.es_trabaja_upeu_c = es_trabaja_upeu_c;
    }

    public String getAp_nombres_c() {
        return ap_nombres_c;
    }

    public void setAp_nombres_c(String ap_nombres_c) {
        this.ap_nombres_c = ap_nombres_c;
    }

    public String getFe_nac_c() {
        return fe_nac_c;
    }

    public void setFe_nac_c(String fe_nac_c) {
        this.fe_nac_c = fe_nac_c;
    }

    public String getId_tipo_doc_c() {
        return id_tipo_doc_c;
    }

    public void setId_tipo_doc_c(String id_tipo_doc_c) {
        this.id_tipo_doc_c = id_tipo_doc_c;
    }

    public String getNu_doc_c() {
        return nu_doc_c;
    }

    public void setNu_doc_c(String nu_doc_c) {
        this.nu_doc_c = nu_doc_c;
    }

    public String getLi_inscripcion_vig_essalud_c() {
        return li_inscripcion_vig_essalud_c;
    }

    public void setLi_inscripcion_vig_essalud_c(String li_inscripcion_vig_essalud_c) {
        this.li_inscripcion_vig_essalud_c = li_inscripcion_vig_essalud_c;
    }

    public String getId_conyugue() {
        return id_conyugue;
    }

    public void setId_conyugue(String id_conyugue) {
        this.id_conyugue = id_conyugue;
    }

    public String getNo_carrera() {
        return no_carrera;
    }

    public void setNo_carrera(String no_carrera) {
        this.no_carrera = no_carrera;
    }

    public String getNo_universidad() {
        return no_universidad;
    }

    public void setNo_universidad(String no_universidad) {
        this.no_universidad = no_universidad;
    }

    public String getAr_foto() {
        return ar_foto;
    }

    public void setAr_foto(String ar_foto) {
        this.ar_foto = ar_foto;
    }

    public String getDe_foto() {
        return de_foto;
    }

    public void setDe_foto(String de_foto) {
        this.de_foto = de_foto;
    }

    public String getId_foto() {
        return id_foto;
    }

    public void setId_foto(String id_foto) {
        this.id_foto = id_foto;
    }

    public String getNo_ar_foto() {
        return no_ar_foto;
    }

    public void setNo_ar_foto(String no_ar_foto) {
        this.no_ar_foto = no_ar_foto;
    }

    public String getTa_ar_foto() {
        return ta_ar_foto;
    }

    public void setTa_ar_foto(String ta_ar_foto) {
        this.ta_ar_foto = ta_ar_foto;
    }

    public String getNo_puesto() {
        return no_puesto;
    }

    public void setNo_puesto(String no_puesto) {
        this.no_puesto = no_puesto;
    }

    public String getNo_seccion() {
        return no_seccion;
    }

    public void setNo_seccion(String no_seccion) {
        this.no_seccion = no_seccion;
    }

    public String getNo_area() {
        return no_area;
    }

    public void setNo_area(String no_area) {
        this.no_area = no_area;
    }

    public String getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(String id_direccion) {
        this.id_direccion = id_direccion;
    }

    public String getNo_dep() {
        return no_dep;
    }

    public void setNo_dep(String no_dep) {
        this.no_dep = no_dep;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getId_area() {
        return id_area;
    }

    public void setId_area(String id_area) {
        this.id_area = id_area;
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(String id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getFe_creacion_contrato() {
        return fe_creacion_contrato;
    }

    public void setFe_creacion_contrato(String fe_creacion_contrato) {
        this.fe_creacion_contrato = fe_creacion_contrato;
    }

    public Double getCa_sueldo() {
        return ca_sueldo;
    }

    public void setCa_sueldo(Double ca_sueldo) {
        this.ca_sueldo = ca_sueldo;
    }

    public String getFe_desde() {
        return fe_desde;
    }

    public void setFe_desde(String fe_desde) {
        this.fe_desde = fe_desde;
    }

    public String getFe_hasta() {
        return fe_hasta;
    }

    public void setFe_hasta(String fe_hasta) {
        this.fe_hasta = fe_hasta;
    }

    public Double getCo_aps() {
        return co_aps;
    }

    public void setCo_aps(Double co_aps) {
        this.co_aps = co_aps;
    }

    public String getDe_anno_egreso() {
        return de_anno_egreso;
    }

    public void setDe_anno_egreso(String de_anno_egreso) {
        this.de_anno_egreso = de_anno_egreso;
    }

    public String getId_tipo_institucion() {
        return id_tipo_institucion;
    }

    public void setId_tipo_institucion(String id_tipo_institucion) {
        this.id_tipo_institucion = id_tipo_institucion;
    }

    public Double getCo_ti_institucion() {
        return co_ti_institucion;
    }

    public void setCo_ti_institucion(Double co_ti_institucion) {
        this.co_ti_institucion = co_ti_institucion;
    }

    public String getNo_tipo_institucion() {
        return no_tipo_institucion;
    }

    public void setNo_tipo_institucion(String no_tipo_institucion) {
        this.no_tipo_institucion = no_tipo_institucion;
    }

    public Double getCo_regimen() {
        return co_regimen;
    }

    public void setCo_regimen(Double co_regimen) {
        this.co_regimen = co_regimen;
    }

    public String getDe_regimen() {
        return de_regimen;
    }

    public void setDe_regimen(String de_regimen) {
        this.de_regimen = de_regimen;
    }

    public String getCo_universidad() {
        return co_universidad;
    }

    public void setCo_universidad(String co_universidad) {
        this.co_universidad = co_universidad;
    }

    public String getId_carrera() {
        return id_carrera;
    }

    public void setId_carrera(String id_carrera) {
        this.id_carrera = id_carrera;
    }

    public String getCo_carrera() {
        return co_carrera;
    }

    public void setCo_carrera(String co_carrera) {
        this.co_carrera = co_carrera;
    }

    public String getCo_nacionalidad() {
        return co_nacionalidad;
    }

    public void setCo_nacionalidad(String co_nacionalidad) {
        this.co_nacionalidad = co_nacionalidad;
    }

    public String getNo_direccion() {
        return no_direccion;
    }

    public void setNo_direccion(String no_direccion) {
        this.no_direccion = no_direccion;
    }
    
}
