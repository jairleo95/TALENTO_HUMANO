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
public class Documentos {

    private String id_documentos;
    private String no_documento;
    private String id_tipo_planilla;
    private String es_documento;
    private String ti_documento;
    private String id_requerimiento;

    public Documentos(String id_documentos, String no_documento, String id_tipo_planilla, String es_documento, String ti_documento, String id_requerimiento) {
        this.id_documentos = id_documentos;
        this.no_documento = no_documento;
        this.id_tipo_planilla = id_tipo_planilla;
        this.es_documento = es_documento;
        this.ti_documento = ti_documento;
        this.id_requerimiento = id_requerimiento;
    }

    public Documentos() {
        this.id_documentos = "";
        this.no_documento = "";
        this.id_tipo_planilla = "";
        this.es_documento = "";
        this.ti_documento = "";
        this.id_requerimiento = "";
    }

    public String getId_requerimiento() {
        return id_requerimiento;
    }

    public void setId_requerimiento(String id_requerimiento) {
        this.id_requerimiento = id_requerimiento;
    }

    
    public String getId_documentos() {
        return id_documentos;
    }

    public void setId_documentos(String id_documentos) {
        this.id_documentos = id_documentos;
    }

    public String getNo_documento() {
        return no_documento;
    }

    public void setNo_documento(String no_documento) {
        this.no_documento = no_documento;
    }

    public String getId_tipo_planilla() {
        return id_tipo_planilla;
    }

    public void setId_tipo_planilla(String id_tipo_planilla) {
        this.id_tipo_planilla = id_tipo_planilla;
    }

    public String getEs_documento() {
        return es_documento;
    }

    public void setEs_documento(String es_documento) {
        this.es_documento = es_documento;
    }

    public String getTi_documento() {
        return ti_documento;
    }

    public void setTi_documento(String ti_documento) {
        this.ti_documento = ti_documento;
    }

    
}
