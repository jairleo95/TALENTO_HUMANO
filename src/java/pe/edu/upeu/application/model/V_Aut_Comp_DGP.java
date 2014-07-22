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
public class V_Aut_Comp_DGP {

    private String id_detalle_req_proceso;
    private String id_dgp;
    private String id_pasos;
    private String id_proceso;
    private String id_detalle_pasos;
    private String de_pasos;
    private String nu_pasos;
    private String co_pasos;
    private String no_proceso;
    private String id_puesto;
    private String id_direccion;
    private String id_departamento;
    private String id_requerimiento;
    private String id_autorizacion;
    private String fe_creacion;
    private String es_autorizacion;

    public V_Aut_Comp_DGP(String id_detalle_req_proceso, String id_dgp, String id_pasos, String id_proceso, String id_detalle_pasos, String de_pasos, String nu_pasos, String co_pasos, String no_proceso, String id_puesto, String id_direccion, String id_departamento, String id_requerimiento, String id_autorizacion, String fe_creacion, String es_autorizacion) {
        this.id_detalle_req_proceso = id_detalle_req_proceso;
        this.id_dgp = id_dgp;
        this.id_pasos = id_pasos;
        this.id_proceso = id_proceso;
        this.id_detalle_pasos = id_detalle_pasos;
        this.de_pasos = de_pasos;
        this.nu_pasos = nu_pasos;
        this.co_pasos = co_pasos;
        this.no_proceso = no_proceso;
        this.id_puesto = id_puesto;
        this.id_direccion = id_direccion;
        this.id_departamento = id_departamento;
        this.id_requerimiento = id_requerimiento;
        this.id_autorizacion = id_autorizacion;
        this.fe_creacion = fe_creacion;
        this.es_autorizacion = es_autorizacion;
    }

    public V_Aut_Comp_DGP() {
        this.id_detalle_req_proceso ="";
        this.id_dgp = "";
        this.id_pasos = "";
        this.id_proceso = "";
        this.id_detalle_pasos = "";
        this.de_pasos = "";
        this.nu_pasos = "";
        this.co_pasos = "";
        this.no_proceso = "";
        this.id_puesto = "";
        this.id_direccion = "";
        this.id_departamento = "";
        this.id_requerimiento = "";
        this.id_autorizacion = "";
        this.fe_creacion = "";
        this.es_autorizacion = "";
    }

    
    public String getId_detalle_req_proceso() {
        return id_detalle_req_proceso;
    }

    public void setId_detalle_req_proceso(String id_detalle_req_proceso) {
        this.id_detalle_req_proceso = id_detalle_req_proceso;
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getId_pasos() {
        return id_pasos;
    }

    public void setId_pasos(String id_pasos) {
        this.id_pasos = id_pasos;
    }

    public String getId_proceso() {
        return id_proceso;
    }

    public void setId_proceso(String id_proceso) {
        this.id_proceso = id_proceso;
    }

    public String getId_detalle_pasos() {
        return id_detalle_pasos;
    }

    public void setId_detalle_pasos(String id_detalle_pasos) {
        this.id_detalle_pasos = id_detalle_pasos;
    }

    public String getDe_pasos() {
        return de_pasos;
    }

    public void setDe_pasos(String de_pasos) {
        this.de_pasos = de_pasos;
    }

    public String getNu_pasos() {
        return nu_pasos;
    }

    public void setNu_pasos(String nu_pasos) {
        this.nu_pasos = nu_pasos;
    }

    public String getCo_pasos() {
        return co_pasos;
    }

    public void setCo_pasos(String co_pasos) {
        this.co_pasos = co_pasos;
    }

    public String getNo_proceso() {
        return no_proceso;
    }

    public void setNo_proceso(String no_proceso) {
        this.no_proceso = no_proceso;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(String id_direccion) {
        this.id_direccion = id_direccion;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getId_requerimiento() {
        return id_requerimiento;
    }

    public void setId_requerimiento(String id_requerimiento) {
        this.id_requerimiento = id_requerimiento;
    }

    public String getId_autorizacion() {
        return id_autorizacion;
    }

    public void setId_autorizacion(String id_autorizacion) {
        this.id_autorizacion = id_autorizacion;
    }

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }

    public String getEs_autorizacion() {
        return es_autorizacion;
    }

    public void setEs_autorizacion(String es_autorizacion) {
        this.es_autorizacion = es_autorizacion;
    }
    
    
}
