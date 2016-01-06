/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author Admin
 */
public class V_Es_Requerimiento {

    private String id_trabajador;

    public String getAut_actual() {
        return aut_actual;
    }

    public void setAut_actual(String aut_actual) {
        this.aut_actual = aut_actual;
    }
    private String ap_paterno;
    private String ap_materno;
    private String no_trabajador;
    private String id_dgp;
    private String id_departamento;
    private String ar_foto;
    private String es_proceso_aut;
    private String id_detalle_req_proceso;
    private String aut_actual;
    private String fe_creacion;
    private String mes_creacion;
    private String no_req;
    private String no_dep;
    private String anno_procesamiento;
    private String  mes_procesamiento;

    public String getAnno_procesamiento() {
        return anno_procesamiento;
    }

    public void setAnno_procesamiento(String anno_procesamiento) {
        this.anno_procesamiento = anno_procesamiento;
    }

    public String getMes_procesamiento() {
        return mes_procesamiento;
    }

    public void setMes_procesamiento(String mes_procesamiento) {
        this.mes_procesamiento = mes_procesamiento;
    }

    public String getNo_dep() {
        return no_dep;
    }

    public void setNo_dep(String no_dep) {
        this.no_dep = no_dep;
    }

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }

    public String getMes_creacion() {
        return mes_creacion;
    }

    public void setMes_creacion(String mes_creacion) {
        this.mes_creacion = mes_creacion;
    }

    public String getId_detalle_req_proceso() {
        return id_detalle_req_proceso;
    }

    public void setId_detalle_req_proceso(String id_detalle_req_proceso) {
        this.id_detalle_req_proceso = id_detalle_req_proceso;
    }

    public String getEs_proceso_aut() {
        return es_proceso_aut;
    }

    public void setEs_proceso_aut(String es_proceso_aut) {
        this.es_proceso_aut = es_proceso_aut;
    }

    public V_Es_Requerimiento(String id_trabajador, String ap_paterno, String ap_materno, String no_trabajador, String id_dgp, 
            String id_departamento, String ar_foto, String de_foto, String id_foto, String no_ar_foto, String ta_ar_foto, 
            String es_porcent, String es_dgp, String es_proceso_aut,String id_detalle_req_proceso,String aut_actual,String fe_creacion,String mes_creacion,String no_req,String no_dep,
    String anno_procesamiento, String mes_procesamiento) {
        this.id_trabajador = id_trabajador;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.no_trabajador = no_trabajador;
        this.id_dgp = id_dgp;
        this.id_departamento = id_departamento;
        this.ar_foto = ar_foto;
        this.de_foto = de_foto;
        this.id_foto = id_foto;
        this.no_ar_foto = no_ar_foto;
        this.ta_ar_foto = ta_ar_foto;
        this.es_porcent = es_porcent;
        this.es_dgp = es_dgp;
        this.es_proceso_aut = es_proceso_aut;
        this.id_detalle_req_proceso = id_detalle_req_proceso;
        this.aut_actual = aut_actual;
        this.fe_creacion = fe_creacion;
        this.mes_creacion = mes_creacion;
        this.no_req = no_req;
        this.no_dep = no_dep;
        this.anno_procesamiento = anno_procesamiento;
        this.mes_procesamiento = mes_procesamiento;
    }

    public V_Es_Requerimiento() {
        this.id_trabajador = "";
        this.ap_paterno = "";
        this.ap_materno = "";
        this.no_trabajador = "";
        this.id_dgp = "";
        this.id_departamento = "";
        this.ar_foto = "";
        this.de_foto = "";
        this.id_foto = "";
        this.no_ar_foto = "";
        this.ta_ar_foto = "";
        this.es_porcent = "";
        this.es_dgp = "";
        this.es_proceso_aut = "";
        this.id_detalle_req_proceso = "";
        this.aut_actual = "";
        this.fe_creacion = "";
        this.mes_creacion = "";
        this.no_req = "";
        this.no_dep = "";
        this.anno_procesamiento= "";
        this.mes_procesamiento= "";
    }
    private String de_foto;
    private String id_foto;

    public String getNo_req() {
        return no_req;
    }

    public void setNo_req(String no_req) {
        this.no_req = no_req;
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

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
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

    public String getEs_porcent() {
        return es_porcent;
    }

    public void setEs_porcent(String es_porcent) {
        this.es_porcent = es_porcent;
    }
    private String no_ar_foto;
    private String ta_ar_foto;
    private String es_porcent;
    private String es_dgp;

    public String getEs_dgp() {
        return es_dgp;
    }

    public void setEs_dgp(String es_dgp) {
        this.es_dgp = es_dgp;
    }

}
