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

    private String fe_desde_s;
    private String us_creacion;

    public String getUs_creacion() {
        return us_creacion;
    }

    public void setUs_creacion(String us_creacion) {
        this.us_creacion = us_creacion;
    }

    public String getFe_desde_s() {
        return fe_desde_s;
    }

    public void setFe_desde_s(String fe_desde_s) {
        this.fe_desde_s = fe_desde_s;
    }

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

    public String getId_plazo() {
        return id_plazo;
    }

    public void setId_plazo(String id_plazo) {
        this.id_plazo = id_plazo;
    }

    public String getNo_plazo() {
        return no_plazo;
    }

    public void setNo_plazo(String no_plazo) {
        this.no_plazo = no_plazo;
    }

    public String getDet_alerta() {
        return det_alerta;
    }

    public void setDet_alerta(String det_alerta) {
        this.det_alerta = det_alerta;
    }

    public String getFe_desde_p() {
        return fe_desde_p;
    }

    public void setFe_desde_p(String fe_desde_p) {
        this.fe_desde_p = fe_desde_p;
    }

    public String getNo_usuario_modif() {
        return no_usuario_modif;
    }

    public void setNo_usuario_modif(String no_usuario_modif) {
        this.no_usuario_modif = no_usuario_modif;
    }

    public String getNo_req() {
        return no_req;
    }

    public void setNo_req(String no_req) {
        this.no_req = no_req;
    }

    public String getDe_solicitud() {
        return de_solicitud;
    }

    public void setDe_solicitud(String de_solicitud) {
        this.de_solicitud = de_solicitud;
    }

    public String getEs_autorizar() {
        return es_autorizar;
    }

    public void setEs_autorizar(String es_autorizar) {
        this.es_autorizar = es_autorizar;
    }

    public String getEs_solicitud_dgp() {
        return es_solicitud_dgp;
    }

    public void setEs_solicitud_dgp(String es_solicitud_dgp) {
        this.es_solicitud_dgp = es_solicitud_dgp;
    }

    public String getTi_plazo() {
        return ti_plazo;
    }

    public void setTi_plazo(String ti_plazo) {
        this.ti_plazo = ti_plazo;
    }

    public V_Solicitud_Requerimiento(String no_dep, String no_area, String no_puesto, String no_trabajador, String ap_materno, String ap_paterno, String fe_desde, String fe_hasta, String fe_creacion, String id_dgp, String id_solicitud_dgp, String id_trabajador, String id_departamento, String no_usuario_sol, String us_modif, String id_plazo, String no_plazo, String det_alerta, String fe_desde_p, String no_usuario_modif, String no_req, String de_solicitud, String es_autorizar, String es_solicitud_dgp, String ti_plazo, String fe_desde_s, String us_creacion) {
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
        this.id_plazo = id_plazo;
        this.no_plazo = no_plazo;
        this.det_alerta = det_alerta;
        this.fe_desde_p = fe_desde_p;
        this.no_usuario_modif = no_usuario_modif;
        this.no_req = no_req;
        this.de_solicitud = de_solicitud;
        this.es_autorizar = es_autorizar;
        this.es_solicitud_dgp = es_solicitud_dgp;
        this.ti_plazo = ti_plazo;
        this.fe_desde_s = fe_desde_s;
        this.us_creacion = us_creacion ;
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
        this.id_plazo = "";
        this.no_plazo = "";
        this.det_alerta = "";
        this.fe_desde_p = "";
        this.no_usuario_modif = "";
        this.no_req = "";
        this.de_solicitud = "";
        this.es_autorizar = "";
        this.es_solicitud_dgp = "";
        this.ti_plazo = "";
        this.fe_desde_s = "";
        this.us_creacion = "";
    }
    private String fe_hasta;
    private String fe_creacion;
    private String id_dgp;
    private String id_solicitud_dgp;
    private String id_trabajador;
    private String id_departamento;
    private String no_usuario_sol;
    private String us_modif;
    private String id_plazo;
    private String no_plazo;
    private String det_alerta;
    private String fe_desde_p;
    private String no_usuario_modif;
    private String no_req;
    private String de_solicitud;
    private String es_autorizar;
    private String es_solicitud_dgp;
    private String ti_plazo;

}
