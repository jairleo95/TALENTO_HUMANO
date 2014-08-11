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
public class V_List_Empleado {

    private String id_contrato;
    private String id_trabajador;
    private String ap_paterno;
    private String ap_materno;
    private String no_trabajador;
    private String no_puesto;
    private String no_seccion;
    private String no_area;
    private String id_direccion;
    private String no_dep;
    private String id_departamento;
    private String id_area;
    private String id_seccion;
    private String id_puesto;
    private String id_empleado;
    private String fe_creacion;
    private Double ca_sueldo;
    private String fe_desde;
    private String fe_hasta;

    public V_List_Empleado(String id_contrato, String id_trabajador, String ap_paterno, String ap_materno, String no_trabajador, String no_puesto, String no_seccion, String no_area, String id_direccion, String no_dep, String id_departamento, String id_area, String id_seccion, String id_puesto, String id_empleado, String fe_creacion, Double ca_sueldo, String fe_desde, String fe_hasta) {
        this.id_contrato = id_contrato;
        this.id_trabajador = id_trabajador;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.no_trabajador = no_trabajador;
        this.no_puesto = no_puesto;
        this.no_seccion = no_seccion;
        this.no_area = no_area;
        this.id_direccion = id_direccion;
        this.no_dep = no_dep;
        this.id_departamento = id_departamento;
        this.id_area = id_area;
        this.id_seccion = id_seccion;
        this.id_puesto = id_puesto;
        this.id_empleado = id_empleado;
        this.fe_creacion = fe_creacion;
        this.ca_sueldo = ca_sueldo;
        this.fe_desde = fe_desde;
        this.fe_hasta = fe_hasta;
    }
    
     public V_List_Empleado() {
        this.id_contrato = "";
        this.id_trabajador = "";
        this.ap_paterno = "";
        this.ap_materno = "";
        this.no_trabajador = "";
        this.no_puesto = "";
        this.no_seccion = "";
        this.no_area = "";
        this.id_direccion = "";
        this.no_dep = "";
        this.id_departamento = "";
        this.id_area = "";
        this.id_seccion = "";
        this.id_puesto = "";
        this.id_empleado = "";
        this.fe_creacion = "";
        this.ca_sueldo = 0.0;
        this.fe_desde = "";
        this.fe_hasta = "";
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

    public String getNo_puesto() {
        return no_puesto;
    }

    public void setNo_puesto(String no_puesto) {
        this.no_puesto = no_puesto;
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

    public String getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(String id_direccion) {
        this.id_direccion = id_direccion;
    }

    public String getNo_dep() {
        return no_dep;
    }

    public void setNo_dep(String no_dep) {
        this.no_dep = no_dep;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getId_area() {
        return id_area;
    }

    public void setId_area(String id_area) {
        this.id_area = id_area;
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(String id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }

    public Double getCa_sueldo() {
        return ca_sueldo;
    }

    public void setCa_sueldo(Double ca_sueldo) {
        this.ca_sueldo = ca_sueldo;
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
     
     
}
