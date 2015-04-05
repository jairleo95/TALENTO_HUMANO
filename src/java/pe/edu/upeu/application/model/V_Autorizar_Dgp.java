/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author Alfa.sistemas
 */
public class V_Autorizar_Dgp {

    private String id_trabajador;
    private String no_trabajador;
    private String ap_paterno;
    private String ap_materno;
    private String no_puesto;
    private String nu_pasos;
    private String id_dgp;
    private String co_pasos;
    private String id_detalle_req_proceso;
    private String de_pasos;
    private String id_departamento;
    private String id_puesto;
    private String id_requerimiento;
    private String id_tipo_planilla;
    private String no_req;
    private String id_pasos;
    private String no_usuario;
    private String id_usuario;
    private String no_seccion;
    private String no_area;
    private String ar_foto;
    private String de_foto;
    private String id_foto;
    private String no_ar_foto;
    private String ta_ar_foto;
    private String ti_ar_foto;
    private String fe_creacion;
    private String fe_autorizacion;
    private String ver_list_plazo;
    private String elab_contrato;
    private String val_firm_contrato;
    private String no_dep;
    private String mes_creacion;
    private int val_cod_aps_empleado;
    private int val_cod_huella;
    private int co_aps;
    private int co_huella_digital;
    private String li_motivo;
    private String es_mfl;
    private String di_correo_personal;
    private String di_correo_inst;

    public String getFe_autorizacion() {
        return fe_autorizacion;
    }

    public void setFe_autorizacion(String fe_autorizacion) {
        this.fe_autorizacion = fe_autorizacion;
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

    public String getLi_motivo() {
        return li_motivo;
    }

    public void setLi_motivo(String li_motivo) {
        this.li_motivo = li_motivo;
    }

    public String getEs_mfl() {
        return es_mfl;
    }

    public void setEs_mfl(String es_mfl) {
        this.es_mfl = es_mfl;
    }

    public int getVal_cod_aps_empleado() {
        return val_cod_aps_empleado;
    }

    public void setVal_cod_aps_empleado(int val_cod_aps_empleado) {
        this.val_cod_aps_empleado = val_cod_aps_empleado;
    }

    public String getMes_creacion() {
        return mes_creacion;
    }

    public void setMes_creacion(String mes_creacion) {
        this.mes_creacion = mes_creacion;
    }

    public String getNo_dep() {
        return no_dep;
    }

    public void setNo_dep(String no_dep) {
        this.no_dep = no_dep;
    }
    private int val_plazo;

    public String getFe_creacion() {
        return fe_creacion;
    }

    public int getVal_plazo() {
        return val_plazo;
    }

    public void setVal_plazo(int val_plazo) {
        this.val_plazo = val_plazo;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }

    public V_Autorizar_Dgp(String id_trabajador, String no_trabajador, String ap_paterno, String ap_materno,
            String no_puesto, String nu_pasos, String id_dgp, String co_pasos, String id_detalle_req_proceso, String de_pasos, String id_departamento, String id_puesto,
            String id_requerimiento, String id_tipo_planilla, String no_req, String id_pasos, String no_usuario, String id_usuario, String no_seccion, String no_area,
            String ar_foto, String de_foto, String id_foto, String no_ar_foto, String ta_ar_foto, String ti_ar_foto, String fe_creacion, int val_plazo, String ver_list_plazo,
            String elab_contrato, String val_firm_contrato, String no_dep, String mes_creacion, int val_cod_aps_empleado, int val_cod_huella, int co_aps, int co_huella_digital,
            String li_motivo, String es_mfl, String di_correo_personal, String di_correo_inst, String fe_autorizacion) {
        this.id_trabajador = id_trabajador;
        this.no_trabajador = no_trabajador;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.no_puesto = no_puesto;
        this.nu_pasos = nu_pasos;
        this.id_dgp = id_dgp;
        this.co_pasos = co_pasos;
        this.id_detalle_req_proceso = id_detalle_req_proceso;
        this.de_pasos = de_pasos;
        this.id_departamento = id_departamento;
        this.id_puesto = id_puesto;
        this.id_requerimiento = id_requerimiento;
        this.id_tipo_planilla = id_tipo_planilla;
        this.no_req = no_req;
        this.id_pasos = id_pasos;
        this.no_usuario = no_usuario;
        this.id_usuario = id_usuario;
        this.no_seccion = no_seccion;
        this.no_area = no_area;
        this.ar_foto = ar_foto;
        this.de_foto = de_foto;
        this.id_foto = id_foto;
        this.no_ar_foto = no_ar_foto;
        this.ta_ar_foto = ta_ar_foto;
        this.ti_ar_foto = ti_ar_foto;
        this.fe_creacion = fe_creacion;
        this.fe_autorizacion = fe_autorizacion;
        this.val_plazo = val_plazo;
        this.ver_list_plazo = ver_list_plazo;
        this.elab_contrato = elab_contrato;
        this.val_firm_contrato = val_firm_contrato;
        this.no_dep = no_dep;
        this.mes_creacion = mes_creacion;
        this.val_cod_aps_empleado = val_cod_aps_empleado;
        this.val_cod_huella = val_cod_huella;
        this.co_aps = co_aps;
        this.co_huella_digital = co_huella_digital;
        this.li_motivo = li_motivo;
        this.es_mfl = es_mfl;
        this.di_correo_personal = di_correo_personal;
        this.di_correo_inst = di_correo_inst;
    }

    public V_Autorizar_Dgp() {
        this.id_trabajador = "";
        this.no_trabajador = "";
        this.ap_paterno = "";
        this.ap_materno = "";
        this.no_puesto = "";
        this.nu_pasos = "";
        this.id_dgp = "";
        this.co_pasos = "";
        this.id_detalle_req_proceso = "";
        this.de_pasos = "";
        this.id_departamento = "";
        this.id_puesto = "";
        this.id_requerimiento = "";
        this.id_tipo_planilla = "";
        this.no_req = "";
        this.id_pasos = "";
        this.no_usuario = "";
        this.id_usuario = "";
        this.no_seccion = "";
        this.no_area = "";
        this.ar_foto = "";
        this.de_foto = "";
        this.id_foto = "";
        this.no_ar_foto = "";
        this.ta_ar_foto = "";
        this.ti_ar_foto = "";
        this.fe_creacion = "";
        this.fe_autorizacion = "";
        this.ver_list_plazo = "";
        this.elab_contrato = "";
        this.val_firm_contrato = "";
        this.no_dep = "";
        this.val_plazo = 0;
        this.mes_creacion = "";
        this.val_cod_aps_empleado = 0;
        this.val_cod_huella = 0;
        this.co_aps = 0;
        this.co_huella_digital = 0;
        this.li_motivo = "";
        this.es_mfl = "";
        this.di_correo_personal = "";
        this.di_correo_inst = "";
    }

    public int getCo_aps() {
        return co_aps;
    }

    public void setCo_aps(int co_aps) {
        this.co_aps = co_aps;
    }

    public int getCo_huella_digital() {
        return co_huella_digital;
    }

    public void setCo_huella_digital(int co_huella_digital) {
        this.co_huella_digital = co_huella_digital;
    }

    public int getVal_cod_huella() {
        return val_cod_huella;
    }

    public void setVal_cod_huella(int val_cod_huella) {
        this.val_cod_huella = val_cod_huella;
    }

    public String getVer_list_plazo() {
        return ver_list_plazo;
    }

    public void setVer_list_plazo(String ver_list_plazo) {
        this.ver_list_plazo = ver_list_plazo;
    }

    public String getVal_firm_contrato() {
        return val_firm_contrato;
    }

    public void setVal_firm_contrato(String val_firm_contrato) {
        this.val_firm_contrato = val_firm_contrato;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public String getNo_trabajador() {
        return no_trabajador;
    }

    public void setNo_trabajador(String no_trabajador) {
        this.no_trabajador = no_trabajador;
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

    public String getNo_puesto() {
        return no_puesto;
    }

    public void setNo_puesto(String no_puesto) {
        this.no_puesto = no_puesto;
    }

    public String getNu_pasos() {
        return nu_pasos;
    }

    public void setNu_pasos(String nu_pasos) {
        this.nu_pasos = nu_pasos;
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getCo_pasos() {
        return co_pasos;
    }

    public void setCo_pasos(String co_pasos) {
        this.co_pasos = co_pasos;
    }

    public String getId_detalle_req_proceso() {
        return id_detalle_req_proceso;
    }

    public void setId_detalle_req_proceso(String id_detalle_req_proceso) {
        this.id_detalle_req_proceso = id_detalle_req_proceso;
    }

    public String getDe_pasos() {
        return de_pasos;
    }

    public void setDe_pasos(String de_pasos) {
        this.de_pasos = de_pasos;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getId_requerimiento() {
        return id_requerimiento;
    }

    public void setId_requerimiento(String id_requerimiento) {
        this.id_requerimiento = id_requerimiento;
    }

    public String getElab_contrato() {
        return elab_contrato;
    }

    public void setElab_contrato(String elab_contrato) {
        this.elab_contrato = elab_contrato;
    }

    public String getId_tipo_planilla() {
        return id_tipo_planilla;
    }

    public void setId_tipo_planilla(String id_tipo_planilla) {
        this.id_tipo_planilla = id_tipo_planilla;
    }

    public String getNo_req() {
        return no_req;
    }

    public void setNo_req(String no_req) {
        this.no_req = no_req;
    }

    public String getId_pasos() {
        return id_pasos;
    }

    public void setId_pasos(String id_pasos) {
        this.id_pasos = id_pasos;
    }

    public String getNo_usuario() {
        return no_usuario;
    }

    public void setNo_usuario(String no_usuario) {
        this.no_usuario = no_usuario;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
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

    public String getTi_ar_foto() {
        return ti_ar_foto;
    }

    public void setTi_ar_foto(String ti_ar_foto) {
        this.ti_ar_foto = ti_ar_foto;
    }

}
