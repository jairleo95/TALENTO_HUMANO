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
public class Detalle_Req_Proceso {

    private String id_detalle_req_proceso;
    private String id_requerimiento;
    private String id_proceso;
    private String es_req_proceso;
    private String id_direccion;
    private String id_departamento;

    public Detalle_Req_Proceso(String id_detalle_req_proceso, String id_requerimiento, String id_proceso, String es_req_proceso, String id_direccion, String id_departamento) {
        this.id_detalle_req_proceso = id_detalle_req_proceso;
        this.id_requerimiento = id_requerimiento;
        this.id_proceso = id_proceso;
        this.es_req_proceso = es_req_proceso;
        this.id_direccion = id_direccion;
        this.id_departamento = id_departamento;
    }

    public Detalle_Req_Proceso() {
        this.id_detalle_req_proceso = "";
        this.id_requerimiento = "";
        this.id_proceso = "";
        this.es_req_proceso = "";
        this.id_direccion = "";
        this.id_departamento = "";
    }

    public String getId_detalle_req_proceso() {
        return id_detalle_req_proceso;
    }

    public void setId_detalle_req_proceso(String id_detalle_req_proceso) {
        this.id_detalle_req_proceso = id_detalle_req_proceso;
    }

    public String getId_requerimiento() {
        return id_requerimiento;
    }

    public void setId_requerimiento(String id_requerimiento) {
        this.id_requerimiento = id_requerimiento;
    }

    public String getId_proceso() {
        return id_proceso;
    }

    public void setId_proceso(String id_proceso) {
        this.id_proceso = id_proceso;
    }

    public String getEs_req_proceso() {
        return es_req_proceso;
    }

    public void setEs_req_proceso(String es_req_proceso) {
        this.es_req_proceso = es_req_proceso;
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

    
}
