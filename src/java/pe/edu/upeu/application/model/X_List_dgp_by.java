/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.model;

/**
 *
 * @author Jose
 */
public class X_List_dgp_by {
    
    private String id_autorizacion;
    private String id_trabajador;
    private String es_autorizacion;
    private String ap_paterno;
    private String ap_materno;
    private String no_trabajador;
    private String no_puesto;
    private String de_pasos;
    private String no_proceso;
    private String fecha_creacion;

    public X_List_dgp_by(String id_autorizacion, String id_trabajador, String es_autorizacion, String ap_paterno, String ap_materno, String no_trabajador, String no_puesto, String de_pasos, String no_proceso, String fecha_creacion) {
        this.id_autorizacion = id_autorizacion;
        this.id_trabajador = id_trabajador;
        this.es_autorizacion = es_autorizacion;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.no_trabajador = no_trabajador;
        this.no_puesto = no_puesto;
        this.de_pasos = de_pasos;
        this.no_proceso = no_proceso;
        this.fecha_creacion = fecha_creacion;
    }
    public X_List_dgp_by() {
        this.id_autorizacion = "";
        this.id_trabajador = "";
        this.es_autorizacion = "";
        this.ap_paterno = "";
        this.ap_materno = "";
        this.no_trabajador = "";
        this.no_puesto = "";
        this.de_pasos = "";
        this.no_proceso = "";
        this.fecha_creacion = "";
    }

    public String getId_autorizacion() {
        return id_autorizacion;
    }

    public void setId_autorizacion(String id_autorizacion) {
        this.id_autorizacion = id_autorizacion;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public String getEs_autorizacion() {
        return es_autorizacion;
    }

    public void setEs_autorizacion(String es_autorizacion) {
        this.es_autorizacion = es_autorizacion;
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

    public String getNo_puesto() {
        return no_puesto;
    }

    public void setNo_puesto(String no_puesto) {
        this.no_puesto = no_puesto;
    }

    public String getDe_pasos() {
        return de_pasos;
    }

    public void setDe_pasos(String de_pasos) {
        this.de_pasos = de_pasos;
    }

    public String getNo_proceso() {
        return no_proceso;
    }

    public void setNo_proceso(String no_proceso) {
        this.no_proceso = no_proceso;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }
    
}
