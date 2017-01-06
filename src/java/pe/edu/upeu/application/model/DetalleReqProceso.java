/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author ALPHA
 */
public class DetalleReqProceso {

    private String idDetalleReqProceso;
    private String idProceso;
    private String esReqProceso;
    private String idDireccion;
    private String idDepartamento;
    private String idArea;
    private String idRequerimiento;

    public DetalleReqProceso(String idDetalleReqProceso, String idProceso, String esReqProceso, String idDireccion, String idDepartamento, String idArea, String idRequerimiento) {
        this.idDetalleReqProceso = idDetalleReqProceso;
        this.idProceso = idProceso;
        this.esReqProceso = esReqProceso;
        this.idDireccion = idDireccion;
        this.idDepartamento = idDepartamento;
        this.idArea = idArea;
        this.idRequerimiento = idRequerimiento;
    }

    public DetalleReqProceso() {
        this.idDetalleReqProceso = "";
        this.idProceso = "";
        this.esReqProceso = "";
        this.idDireccion = "";
        this.idDepartamento = "";
        this.idArea = "";
        this.idRequerimiento = "";
    }

    public String getIdDetalleReqProceso() {
        return idDetalleReqProceso;
    }

    public void setIdDetalleReqProceso(String idDetalleReqProceso) {
        this.idDetalleReqProceso = idDetalleReqProceso;
    }

    public String getIdProceso() {
        return idProceso;
    }

    public void setIdProceso(String idProceso) {
        this.idProceso = idProceso;
    }

    public String getEsReqProceso() {
        return esReqProceso;
    }

    public void setEsReqProceso(String esReqProceso) {
        this.esReqProceso = esReqProceso;
    }

    public String getIdDireccion() {
        return idDireccion;
    }

    public void setIdDireccion(String idDireccion) {
        this.idDireccion = idDireccion;
    }

    public String getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(String idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public String getIdArea() {
        return idArea;
    }

    public void setIdArea(String idArea) {
        this.idArea = idArea;
    }

    public String getIdRequerimiento() {
        return idRequerimiento;
    }

    public void setIdRequerimiento(String idRequerimiento) {
        this.idRequerimiento = idRequerimiento;
    }

}
