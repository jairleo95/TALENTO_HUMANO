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
public class V_Filtro_Dgp_Aut {
    private String id_dgp;
private String dep;
private String id_autorizacion;
private String id_trabajador;
private String es_autorizacion;
private String nombre_p;
private String no_puesto;
private String de_pasos;
private String fecha_creacion;
private String proc;

    public V_Filtro_Dgp_Aut(String id_dgp, String dep, String id_autorizacion, String id_trabajador, String es_autorizacion, String nombre_p, String no_puesto, String de_pasos, String fecha_creacion, String proc, String requerimiento, String no_area, String no_seccion, String ca_sueldo) {
        this.id_dgp = id_dgp;
        this.dep = dep;
        this.id_autorizacion = id_autorizacion;
        this.id_trabajador = id_trabajador;
        this.es_autorizacion = es_autorizacion;
        this.nombre_p = nombre_p;
        this.no_puesto = no_puesto;
        this.de_pasos = de_pasos;
        this.fecha_creacion = fecha_creacion;
        this.proc = proc;
        this.requerimiento = requerimiento;
        this.no_area = no_area;
        this.no_seccion = no_seccion;
        this.ca_sueldo = ca_sueldo;
    }
    
    
    public V_Filtro_Dgp_Aut() {
        this.id_dgp = "";
        this.dep = "";
        this.id_autorizacion = "";
        this.id_trabajador = "";
        this.es_autorizacion = "";
        this.nombre_p = "";
        this.no_puesto = "";
        this.de_pasos = "";
        this.fecha_creacion = "";
        this.proc = "";
        this.requerimiento = "";
        this.no_area = "";
        this.no_seccion = "";
        this.ca_sueldo = "";
    }
private String requerimiento;
private String no_area;
private String no_seccion;
private String ca_sueldo;

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getDep() {
        return dep;
    }

    public void setDep(String dep) {
        this.dep = dep;
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

    public String getNombre_p() {
        return nombre_p;
    }

    public void setNombre_p(String nombre_p) {
        this.nombre_p = nombre_p;
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

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public String getProc() {
        return proc;
    }

    public void setProc(String proc) {
        this.proc = proc;
    }

    public String getRequerimiento() {
        return requerimiento;
    }

    public void setRequerimiento(String requerimiento) {
        this.requerimiento = requerimiento;
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

    public String getCa_sueldo() {
        return ca_sueldo;
    }

    public void setCa_sueldo(String ca_sueldo) {
        this.ca_sueldo = ca_sueldo;
    }
    
    
}
