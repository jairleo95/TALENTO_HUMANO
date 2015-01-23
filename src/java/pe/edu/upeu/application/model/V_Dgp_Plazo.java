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
public class V_Dgp_Plazo {

    private String id_plazo;
    private String no_plazo;
    private String fe_desde;
    private String fe_hasta;
    private String id_requerimiento;
    private String id_dgp;
    private String id_trabajador;
    private String fe_creacion;
    private String es_plazo_cumplido;
    private String no_req;
    private String det_alerta;
    private String no_puesto;
    private String no_trabajador;
    private String ap_paterno;
    private String ap_materno;

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

    public String getId_requerimiento() {
        return id_requerimiento;
    }

    public void setId_requerimiento(String id_requerimiento) {
        this.id_requerimiento = id_requerimiento;
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }

    public String getEs_plazo_cumplido() {
        return es_plazo_cumplido;
    }

    public void setEs_plazo_cumplido(String es_plazo_cumplido) {
        this.es_plazo_cumplido = es_plazo_cumplido;
    }

    public String getNo_req() {
        return no_req;
    }

    public void setNo_req(String no_req) {
        this.no_req = no_req;
    }

    public String getDet_alerta() {
        return det_alerta;
    }

    public void setDet_alerta(String det_alerta) {
        this.det_alerta = det_alerta;
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

    public V_Dgp_Plazo(String id_plazo, String no_plazo, String fe_desde, String fe_hasta, String id_requerimiento, String id_dgp, String id_trabajador, String fe_creacion, String es_plazo_cumplido, String no_req, String det_alerta, String no_puesto, String no_trabajador, String ap_paterno, String ap_materno) {
        this.id_plazo = id_plazo;
        this.no_plazo = no_plazo;
        this.fe_desde = fe_desde;
        this.fe_hasta = fe_hasta;
        this.id_requerimiento = id_requerimiento;
        this.id_dgp = id_dgp;
        this.id_trabajador = id_trabajador;
        this.fe_creacion = fe_creacion;
        this.es_plazo_cumplido = es_plazo_cumplido;
        this.no_req = no_req;
        this.det_alerta = det_alerta;
        this.no_puesto = no_puesto;
        this.no_trabajador = no_trabajador;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
    }

    public V_Dgp_Plazo() {
        this.id_plazo = "";
        this.no_plazo = "";
        this.fe_desde = "";
        this.fe_hasta = "";
        this.id_requerimiento = "";
        this.id_dgp = "";
        this.id_trabajador = "";
        this.fe_creacion = "";
        this.es_plazo_cumplido = "";
        this.no_req = "";
        this.det_alerta = "";
        this.no_puesto = "";
        this.no_trabajador = "";
        this.ap_paterno = "";
        this.ap_materno = "";
    }

}
