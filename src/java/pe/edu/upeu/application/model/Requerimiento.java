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
public class Requerimiento {

    private String id_requerimiento;
    private String no_req;
    private String id_tipo_planilla;

    public Requerimiento(String id_requerimiento, String no_req, String id_tipo_planilla) {
        this.id_requerimiento = id_requerimiento;
        this.no_req = no_req;
        this.id_tipo_planilla = id_tipo_planilla;
    }

    public Requerimiento() {
        this.id_requerimiento ="";
        this.no_req = "";
        this.id_tipo_planilla = "";
    }

    public String getId_requerimiento() {
        return id_requerimiento;
    }

    public void setId_requerimiento(String id_requerimiento) {
        this.id_requerimiento = id_requerimiento;
    }

    public String getNo_req() {
        return no_req;
    }

    public void setNo_req(String no_req) {
        this.no_req = no_req;
    }

    public String getId_tipo_planilla() {
        return id_tipo_planilla;
    }

    public void setId_tipo_planilla(String id_tipo_planilla) {
        this.id_tipo_planilla = id_tipo_planilla;
    }

    
}
