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
public class V_Solicitud_Requerimiento {

    private String no_dep;
    private String no_area;
    private String no_puesto;
    private String no_trabajador;
    private String ap_materno;
    private String ap_paterno;
    private String fe_desde;
    private String fe_hasta;
    private String fe_creacion;
    private String id_dgp;
    private String id_solicitud_dgp;
    private String id_trabajador;
    private String id_departamento;
    private String no_usuario_sol;

    public String getNo_dep() {
        return no_dep;
    }

    public void setNo_dep(String no_dep) {
        this.no_dep = no_dep;
    }

    public String getNo_area() {
        return no_area;
    }

    public void setNo_area(String no_area) {
        this.no_area = no_area;
    }

    public String getNo_puesto() {
        return no_puesto;
    }

    public void setNo_puesto(String no_puesto) {
        this.no_puesto = no_puesto;
    }

    public String getNo_trabajador() {
        return no_trabajador;
    }

    public void setNo_trabajador(String no_trabajador) {
        this.no_trabajador = no_trabajador;
    }

    public String getAp_materno() {
        return ap_materno;
    }

    public void setAp_materno(String ap_materno) {
        this.ap_materno = ap_materno;
    }

    public String getAp_paterno() {
        return ap_paterno;
    }

    public void setAp_paterno(String ap_paterno) {
        this.ap_paterno = ap_paterno;
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

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getId_solicitud_dgp() {
        return id_solicitud_dgp;
    }

    public void setId_solicitud_dgp(String id_solicitud_dgp) {
        this.id_solicitud_dgp = id_solicitud_dgp;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getNo_usuario_sol() {
        return no_usuario_sol;
    }

    public void setNo_usuario_sol(String no_usuario_sol) {
        this.no_usuario_sol = no_usuario_sol;
    }

    public String getUs_modif() {
        return us_modif;
    }

    public void setUs_modif(String us_modif) {
        this.us_modif = us_modif;
    }

    public String getNo_usuario_modif() {
        return no_usuario_modif;
    }

    public void setNo_usuario_modif(String no_usuario_modif) {
        this.no_usuario_modif = no_usuario_modif;
    }
    private String us_modif;
    private String no_usuario_modif;

    public V_Solicitud_Requerimiento(String no_dep, String no_area, String no_puesto, String no_trabajador, String ap_materno, String ap_paterno, String fe_desde, String fe_hasta, String fe_creacion, String id_dgp, String id_solicitud_dgp, String id_trabajador, String id_departamento, String no_usuario_sol, String us_modif, String no_usuario_modif) {
        this.no_dep = no_dep;
        this.no_area = no_area;
        this.no_puesto = no_puesto;
        this.no_trabajador = no_trabajador;
        this.ap_materno = ap_materno;
        this.ap_paterno = ap_paterno;
        this.fe_desde = fe_desde;
        this.fe_hasta = fe_hasta;
        this.fe_creacion = fe_creacion;
        this.id_dgp = id_dgp;
        this.id_solicitud_dgp = id_solicitud_dgp;
        this.id_trabajador = id_trabajador;
        this.id_departamento = id_departamento;
        this.no_usuario_sol = no_usuario_sol;
        this.us_modif = us_modif;
        this.no_usuario_modif = no_usuario_modif;
    }

    public V_Solicitud_Requerimiento() {
        this.no_dep = "";
        this.no_area = "";
        this.no_puesto = "";
        this.no_trabajador = "";
        this.ap_materno = "";
        this.ap_paterno = "";
        this.fe_desde = "";
        this.fe_hasta = "";
        this.fe_creacion = "";
        this.id_dgp = "";
        this.id_solicitud_dgp = "";
        this.id_trabajador = "";
        this.id_departamento = "";
        this.no_usuario_sol = "";
        this.us_modif = "";
        this.no_usuario_modif = "";
    }

}
