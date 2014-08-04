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
private String no_seccion;
private String no_area;

    public V_Autorizar_Dgp(String id_trabajador, String no_trabajador, String ap_paterno, String ap_materno, String no_puesto, String nu_pasos, String id_dgp, String co_pasos, String id_detalle_req_proceso, String de_pasos, String id_departamento, String id_puesto, String id_requerimiento, String id_tipo_planilla, String no_req, String id_pasos, String no_usuario, String no_seccion, String no_area) {
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
        this.no_seccion = no_seccion;
        this.no_area = no_area;
    }
    public V_Autorizar_Dgp(){
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
        this.no_seccion = "";
        this.no_area = "";
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
    
}
