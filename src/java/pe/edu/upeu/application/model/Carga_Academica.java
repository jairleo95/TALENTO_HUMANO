/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author Alex
 */
public class Carga_Academica {

    private String nu_doc;
    private String es_tipo_doc;
    private String no_trabajador;
    private String ap_paterno;
    private String ap_materno;
    private String no_eap;
    private String no_facultad;
    private String de_condicion;
    private String de_carga;
    private String id_proceso_carga_ac;
    private String id_trabajador;
    private String id_situacion_educativa;
    private String no_s_educativa;
    private String profesion_docente;
    private String fe_desde;
    private String fe_hasta;
    private String fe_creacion;
    private Integer countCursos;

    private String validateExistTrabajador;

    public String getValidateExistTrabajador() {
        return validateExistTrabajador;
    }

    public void setValidateExistTrabajador(String validateExistTrabajador) {
        this.validateExistTrabajador = validateExistTrabajador;
    }

    public Integer getCountCursos() {
        return countCursos;
    }

    public void setCountCursos(Integer countCursos) {
        this.countCursos = countCursos;
    }

    public Carga_Academica(String nu_doc, String es_tipo_doc, String no_trabajador, String ap_paterno, String ap_materno, String no_eap,
            String no_facultad, String de_condicion, String de_carga,
            String id_proceso_carga_ac, String id_trabajador, String id_situacion_educativa, String no_s_educativa, String profesion_docente, String fe_desde,
            String fe_hasta, String fe_creacion, Integer countCursos, String validateExistTrabajador) {
        this.nu_doc = nu_doc;
        this.es_tipo_doc = es_tipo_doc;
        this.no_trabajador = no_trabajador;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.no_eap = no_eap;
        this.no_facultad = no_facultad;
        this.de_condicion = de_condicion;
        this.de_condicion = de_carga;
        this.id_proceso_carga_ac = id_proceso_carga_ac;
        this.id_trabajador = id_trabajador;
        this.id_situacion_educativa = id_situacion_educativa;
        this.no_s_educativa = no_s_educativa;
        this.profesion_docente = profesion_docente;
        this.fe_desde = fe_desde;
        this.fe_hasta = fe_hasta;
        this.fe_creacion = fe_creacion;
        this.countCursos = countCursos;
        this.validateExistTrabajador = validateExistTrabajador;
    }

    public Carga_Academica() {
        this.nu_doc = "";
        this.es_tipo_doc = "";
        this.no_trabajador = "";
        this.ap_paterno = "";
        this.ap_materno = "";
        this.no_eap = "";
        this.no_facultad = "";
        this.de_condicion = "";
        this.de_condicion = "";
        this.id_proceso_carga_ac = "";
        this.id_trabajador = "";
        this.id_situacion_educativa = "";
        this.no_s_educativa = "";
        this.profesion_docente = "";
        this.fe_desde = "";
        this.fe_hasta = "";
        this.fe_creacion = "";
        this.countCursos = 0;
        this.validateExistTrabajador = "";
    }

    public String getEs_tipo_doc() {
        return es_tipo_doc;
    }

    public void setEs_tipo_doc(String es_tipo_doc) {
        this.es_tipo_doc = es_tipo_doc;
    }

    public String getDe_carga() {
        return de_carga;
    }

    public void setDe_carga(String de_carga) {
        this.de_carga = de_carga;
    }

    public String getNu_doc() {
        return nu_doc;
    }

    public void setNu_doc(String nu_doc) {
        this.nu_doc = nu_doc;
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

    public String getNo_eap() {
        return no_eap;
    }

    public void setNo_eap(String no_eap) {
        this.no_eap = no_eap;
    }

    public String getNo_facultad() {
        return no_facultad;
    }

    public void setNo_facultad(String no_facultad) {
        this.no_facultad = no_facultad;
    }

    public String getDe_condicion() {
        return de_condicion;
    }

    public void setDe_condicion(String de_condicion) {
        this.de_condicion = de_condicion;
    }

    public String getId_proceso_carga_ac() {
        return id_proceso_carga_ac;
    }

    public void setId_proceso_carga_ac(String id_proceso_carga_ac) {
        this.id_proceso_carga_ac = id_proceso_carga_ac;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public String getId_situacion_educativa() {
        return id_situacion_educativa;
    }

    public void setId_situacion_educativa(String id_situacion_educativa) {
        this.id_situacion_educativa = id_situacion_educativa;
    }

    public String getNo_s_educativa() {
        return no_s_educativa;
    }

    public void setNo_s_educativa(String no_s_educativa) {
        this.no_s_educativa = no_s_educativa;
    }

    public String getProfesion_docente() {
        return profesion_docente;
    }

    public void setProfesion_docente(String profesion_docente) {
        this.profesion_docente = profesion_docente;
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

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }
    public String toDataSent(){
        return "nro_doc="+this.nu_doc+"&ap_p="+this.ap_paterno+"&ap_m="+this.ap_materno+"no_tr="+this.no_trabajador+"&ti_doc="+
                this.es_tipo_doc+"&eap="+this.no_eap+"&facultad="+this.no_facultad+"&ciclo="+this.de_carga+"&idtr="+this.id_trabajador;
    }

}
