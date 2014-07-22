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
public class V_Doc_Plant_Req {

    private String id_documentos;
    private String id_tipo_planilla;
    private String id_requerimiento;
    private String documento;
    private String ti_planilla;
    private String planilla;
    private String ti_documento;

    public V_Doc_Plant_Req(String id_documentos, String id_tipo_planilla, String id_requerimiento, String documento, String ti_planilla, String planilla, String ti_documento) {
        this.id_documentos = id_documentos;
        this.id_tipo_planilla = id_tipo_planilla;
        this.id_requerimiento = id_requerimiento;
        this.documento = documento;
        this.ti_planilla = ti_planilla;
        this.planilla = planilla;
        this.ti_documento = ti_documento;
    }

    public String getId_documentos() {
        return id_documentos;
    }

    public void setId_documentos(String id_documentos) {
        this.id_documentos = id_documentos;
    }

    public String getId_tipo_planilla() {
        return id_tipo_planilla;
    }

    public void setId_tipo_planilla(String id_tipo_planilla) {
        this.id_tipo_planilla = id_tipo_planilla;
    }

    public String getId_requerimiento() {
        return id_requerimiento;
    }

    public void setId_requerimiento(String id_requerimiento) {
        this.id_requerimiento = id_requerimiento;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getTi_planilla() {
        return ti_planilla;
    }

    public void setTi_planilla(String ti_planilla) {
        this.ti_planilla = ti_planilla;
    }

    public String getPlanilla() {
        return planilla;
    }

    public void setPlanilla(String planilla) {
        this.planilla = planilla;
    }

    public String getTi_documento() {
        return ti_documento;
    }

    public void setTi_documento(String ti_documento) {
        this.ti_documento = ti_documento;
    }
    
    
}
