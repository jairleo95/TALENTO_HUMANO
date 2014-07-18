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
public class Autorizacion {

    private String id_autorizacion;
    private String id_dgp;
    private String es_autorizacion;
    private String nu_pasos;
    private String ip_usuario;
    private String us_creacion;
    private String fe_creacion;
    private String us_modif;
    private String fe_modif;
    private String co_puesto;
    private String id_puesto;
    private String id_detalle_req_proceso;
    private String id_pasos;

    public Autorizacion(String id_autorizacion, String id_dgp, String es_autorizacion, String nu_pasos, String ip_usuario, String us_creacion, String fe_creacion, String us_modif, String fe_modif, String co_puesto, String id_puesto, String id_detalle_req_proceso, String id_pasos) {
        this.id_autorizacion = id_autorizacion;
        this.id_dgp = id_dgp;
        this.es_autorizacion = es_autorizacion;
        this.nu_pasos = nu_pasos;
        this.ip_usuario = ip_usuario;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modif = us_modif;
        this.fe_modif = fe_modif;
        this.co_puesto = co_puesto;
        this.id_puesto = id_puesto;
        this.id_detalle_req_proceso = id_detalle_req_proceso;
        this.id_pasos = id_pasos;
    }
    public Autorizacion() {
        this.id_autorizacion = "";
        this.id_dgp = "";
        this.es_autorizacion = "";
        this.nu_pasos = "";
        this.ip_usuario = "";
        this.us_creacion = "";
        this.fe_creacion = "";
        this.us_modif = "";
        this.fe_modif = "";
        this.co_puesto = "";
        this.id_puesto = "";
        this.id_detalle_req_proceso = "";
        this.id_pasos = "";
    }

    public String getId_autorizacion() {
        return id_autorizacion;
    }

    public void setId_autorizacion(String id_autorizacion) {
        this.id_autorizacion = id_autorizacion;
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getEs_autorizacion() {
        return es_autorizacion;
    }

    public void setEs_autorizacion(String es_autorizacion) {
        this.es_autorizacion = es_autorizacion;
    }

    public String getNu_pasos() {
        return nu_pasos;
    }

    public void setNu_pasos(String nu_pasos) {
        this.nu_pasos = nu_pasos;
    }

    public String getIp_usuario() {
        return ip_usuario;
    }

    public void setIp_usuario(String ip_usuario) {
        this.ip_usuario = ip_usuario;
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

    public String getCo_puesto() {
        return co_puesto;
    }

    public void setCo_puesto(String co_puesto) {
        this.co_puesto = co_puesto;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getId_detalle_req_proceso() {
        return id_detalle_req_proceso;
    }

    public void setId_detalle_req_proceso(String id_detalle_req_proceso) {
        this.id_detalle_req_proceso = id_detalle_req_proceso;
    }

    public String getId_pasos() {
        return id_pasos;
    }

    public void setId_pasos(String id_pasos) {
        this.id_pasos = id_pasos;
    }
    
    
}
