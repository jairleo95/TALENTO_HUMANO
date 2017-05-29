/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author ALFA 3
 */
public class V_Detalle_Carga_Academica {

    private String id_carga_academica;
    private String es_carga_academica;
    private String campus;
    private String es_tipo_doc;
    private String nu_doc;
    private String ap_paterno;
    private String ap_materno;
    private String no_trabajador;
    private String no_facultad;
    private String no_eap;
    private String de_carga;
    private String no_curso;
    private String nu_grupo;
    private String de_horario;
    private Double ca_hlab;
    private String de_condicion;
    private String de_tipo_curso;
    private String es_procesado;
    private String fe_creacion;
    private String ca_tipo_hora_pago_refeerencial;
    private String id_trabajador;

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public V_Detalle_Carga_Academica(String id_carga_academica, String es_carga_academica, String campus, String es_tipo_doc, String nu_doc, String ap_paterno, String ap_materno, String no_trabajador, String no_facultad, String no_eap, String de_carga, String no_curso, String nu_grupo, String de_horario, Double ca_hlab, String de_condicion, String de_tipo_curso, String es_procesado, String fe_creacion, String ca_tipo_hora_pago_refeerencial, String id_trabajador) {
        this.id_carga_academica = id_carga_academica;
        this.es_carga_academica = es_carga_academica;
        this.campus = campus;
        this.es_tipo_doc = es_tipo_doc;
        this.nu_doc = nu_doc;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.no_trabajador = no_trabajador;
        this.no_facultad = no_facultad;
        this.no_eap = no_eap;
        this.de_carga = de_carga;
        this.no_curso = no_curso;
        this.nu_grupo = nu_grupo;
        this.de_horario = de_horario;
        this.ca_hlab = ca_hlab;
        this.de_condicion = de_condicion;
        this.de_tipo_curso = de_tipo_curso;
        this.es_procesado = es_procesado;
        this.fe_creacion = fe_creacion;
        this.ca_tipo_hora_pago_refeerencial = ca_tipo_hora_pago_refeerencial;
        this.id_trabajador = id_trabajador;
    }

    public V_Detalle_Carga_Academica() {
        this.id_carga_academica = "";
        this.es_carga_academica = "";
        this.campus = "";
        this.es_tipo_doc = "";
        this.nu_doc = "";
        this.ap_paterno = "";
        this.ap_materno = "";
        this.no_trabajador = "";
        this.no_facultad = "";
        this.no_eap = "";
        this.de_carga = "";
        this.no_curso = "";
        this.nu_grupo = "";
        this.de_horario = "";
        this.ca_hlab = 0.0;
        this.de_condicion = "";
        this.de_tipo_curso = "";
        this.es_procesado = "";
        this.fe_creacion = "";
        this.ca_tipo_hora_pago_refeerencial = "";
        this.id_trabajador = "";
    }

    public String getId_carga_academica() {
        return id_carga_academica;
    }

    public void setId_carga_academica(String id_carga_academica) {
        this.id_carga_academica = id_carga_academica;
    }

    public String getEs_carga_academica() {
        return es_carga_academica;
    }

    public void setEs_carga_academica(String es_carga_academica) {
        this.es_carga_academica = es_carga_academica;
    }

    public String getCampus() {
        return campus;
    }

    public void setCampus(String campus) {
        this.campus = campus;
    }

    public String getEs_tipo_doc() {
        return es_tipo_doc;
    }

    public void setEs_tipo_doc(String es_tipo_doc) {
        this.es_tipo_doc = es_tipo_doc;
    }

    public String getNu_doc() {
        return nu_doc;
    }

    public void setNu_doc(String nu_doc) {
        this.nu_doc = nu_doc;
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

    public String getNo_facultad() {
        return no_facultad;
    }

    public void setNo_facultad(String no_facultad) {
        this.no_facultad = no_facultad;
    }

    public String getNo_eap() {
        return no_eap;
    }

    public void setNo_eap(String no_eap) {
        this.no_eap = no_eap;
    }

    public String getDe_carga() {
        return de_carga;
    }

    public void setDe_carga(String de_carga) {
        this.de_carga = de_carga;
    }

    public String getNo_curso() {
        return no_curso;
    }

    public void setNo_curso(String no_curso) {
        this.no_curso = no_curso;
    }

    public String getNu_grupo() {
        return nu_grupo;
    }

    public void setNu_grupo(String nu_grupo) {
        this.nu_grupo = nu_grupo;
    }

    public String getDe_horario() {
        return de_horario;
    }

    public void setDe_horario(String de_horario) {
        this.de_horario = de_horario;
    }

    public Double getCa_hlab() {
        return ca_hlab;
    }

    public void setCa_hlab(Double ca_hlab) {
        this.ca_hlab = ca_hlab;
    }

    public String getDe_condicion() {
        return de_condicion;
    }

    public void setDe_condicion(String de_condicion) {
        this.de_condicion = de_condicion;
    }

    public String getDe_tipo_curso() {
        return de_tipo_curso;
    }

    public void setDe_tipo_curso(String de_tipo_curso) {
        this.de_tipo_curso = de_tipo_curso;
    }

    public String getEs_procesado() {
        return es_procesado;
    }

    public void setEs_procesado(String es_procesado) {
        this.es_procesado = es_procesado;
    }

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }

    public String getCa_tipo_hora_pago_refeerencial() {
        return ca_tipo_hora_pago_refeerencial;
    }

    public void setCa_tipo_hora_pago_refeerencial(String ca_tipo_hora_pago_refeerencial) {
        this.ca_tipo_hora_pago_refeerencial = ca_tipo_hora_pago_refeerencial;
    }

}
