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
public class List_Rh_Contrato_Fec {
    private String id_contrato; 
    private String id_trabajador; 
    private String ap_paterno; 
    private String ap_materno; 
    private String no_trabajador; 
    private String fe_desde; 
    private String fe_hasta; 
    private Double ca_sueldo; 
    private String no_area; 
    private String no_seccion; 
    private String no_puesto; 
    private String fe_creacion;

    public List_Rh_Contrato_Fec(String id_contrato, String id_trabajador, String ap_paterno, String ap_materno, String no_trabajador, String fe_desde, String fe_hasta, Double ca_sueldo, String no_area, String no_seccion, String no_puesto, String fe_creacion) {
        this.id_contrato = id_contrato;
        this.id_trabajador = id_trabajador;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.no_trabajador = no_trabajador;
        this.fe_desde = fe_desde;
        this.fe_hasta = fe_hasta;
        this.ca_sueldo = ca_sueldo;
        this.no_area = no_area;
        this.no_seccion = no_seccion;
        this.no_puesto = no_puesto;
        this.fe_creacion = fe_creacion;
    }

    public List_Rh_Contrato_Fec() {
        this.id_contrato = "";
        this.id_trabajador = "";
        this.ap_paterno = "";
        this.ap_materno = "";
        this.no_trabajador = "";
        this.fe_desde = "";
        this.fe_hasta = "";
        this.ca_sueldo = 0.0;
        this.no_area = "";
        this.no_seccion = "";
        this.no_puesto = "";
        this.fe_creacion = "";
    }

    public String getId_contrato() {
        return id_contrato;
    }

    public void setId_contrato(String id_contrato) {
        this.id_contrato = id_contrato;
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

    public Double getCa_sueldo() {
        return ca_sueldo;
    }

    public void setCa_sueldo(Double ca_sueldo) {
        this.ca_sueldo = ca_sueldo;
    }

    public String getNo_area() {
        return no_area;
    }

    public void setNo_area(String no_area) {
        this.no_area = no_area;
    }

    public String getNo_seccion() {
        return no_seccion;
    }

    public void setNo_seccion(String no_seccion) {
        this.no_seccion = no_seccion;
    }

    public String getNo_puesto() {
        return no_puesto;
    }

    public void setNo_puesto(String no_puesto) {
        this.no_puesto = no_puesto;
    }

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }
    
    
}
