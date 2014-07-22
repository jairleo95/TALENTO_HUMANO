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
public class V_Puesto_Aut {

    private String id_puesto;
    private String nu_pasos;
    private String co_pasos;
    private String de_pasos;
    private String id_dgp;
    private String id_detalle_pasos;
    private String id_detalle_req_proceso;
    private String id_pasos;
    private String id_proceso;
    private String id_requerimiento;
    private String no_proceso;
    private String id_departamento_dgp;
    private String no_direccion;
    private String id_direccion;
    private String no_dep;
    private String id_departamento;
    private String no_area;
    private String no_seccion;
    private String id_seccion;
    private String no_puesto;
    private String pasos_id_aux;

    public V_Puesto_Aut(String id_puesto, String nu_pasos, String co_pasos, String de_pasos, String id_dgp, String id_detalle_pasos, String id_detalle_req_proceso, String id_pasos, String id_proceso, String id_requerimiento, String no_proceso, String id_departamento_dgp, String no_direccion, String id_direccion, String no_dep, String id_departamento, String no_area, String no_seccion, String id_seccion, String no_puesto, String pasos_id_aux) {
        this.id_puesto = id_puesto;
        this.nu_pasos = nu_pasos;
        this.co_pasos = co_pasos;
        this.de_pasos = de_pasos;
        this.id_dgp = id_dgp;
        this.id_detalle_pasos = id_detalle_pasos;
        this.id_detalle_req_proceso = id_detalle_req_proceso;
        this.id_pasos = id_pasos;
        this.id_proceso = id_proceso;
        this.id_requerimiento = id_requerimiento;
        this.no_proceso = no_proceso;
        this.id_departamento_dgp = id_departamento_dgp;
        this.no_direccion = no_direccion;
        this.id_direccion = id_direccion;
        this.no_dep = no_dep;
        this.id_departamento = id_departamento;
        this.no_area = no_area;
        this.no_seccion = no_seccion;
        this.id_seccion = id_seccion;
        this.no_puesto = no_puesto;
        this.pasos_id_aux = pasos_id_aux;
    }
    
     public V_Puesto_Aut() {
        this.id_puesto = "";
        this.nu_pasos = "";
        this.co_pasos = "";
        this.de_pasos = "";
        this.id_dgp = "";
        this.id_detalle_pasos = "";
        this.id_detalle_req_proceso = "";
        this.id_pasos = "";
        this.id_proceso = "";
        this.id_requerimiento = "";
        this.no_proceso = "";
        this.id_departamento_dgp = "";
        this.no_direccion = "";
        this.id_direccion = "";
        this.no_dep = "";
        this.id_departamento = "";
        this.no_area = "";
        this.no_seccion = "";
        this.id_seccion = "";
        this.no_puesto = "";
        this.pasos_id_aux = "";
    }
    
}
