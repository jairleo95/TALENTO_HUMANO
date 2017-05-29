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
public class V_Documento_Trabajador {

    private String id_documento_adjunto;
    private String id_dgp;
    private String id_trabajador;
    private String no_documento;
    private String no_req;
    private String de_documento_adjunto;
        private String ar_dato_archivo;

    public V_Documento_Trabajador(String id_documento_adjunto, String id_dgp, String id_trabajador, String no_documento, String no_req, String de_documento_adjunto, String ar_dato_archivo) {
        this.id_documento_adjunto = id_documento_adjunto;
        this.id_dgp = id_dgp;
        this.id_trabajador = id_trabajador;
        this.no_documento = no_documento;
        this.no_req = no_req;
        this.de_documento_adjunto = de_documento_adjunto;
        this.ar_dato_archivo = ar_dato_archivo;
    }
    public V_Documento_Trabajador() {
        this.id_documento_adjunto = "";
        this.id_dgp = "";
        this.id_trabajador = "";
        this.no_documento = "";
        this.no_req = "";
        this.de_documento_adjunto = "";
        this.ar_dato_archivo = "";
    }

    public String getId_documento_adjunto() {
        return id_documento_adjunto;
    }

    public void setId_documento_adjunto(String id_documento_adjunto) {
        this.id_documento_adjunto = id_documento_adjunto;
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

    public String getNo_documento() {
        return no_documento;
    }

    public void setNo_documento(String no_documento) {
        this.no_documento = no_documento;
    }

    public String getNo_req() {
        return no_req;
    }

    public void setNo_req(String no_req) {
        this.no_req = no_req;
    }

    public String getDe_documento_adjunto() {
        return de_documento_adjunto;
    }

    public void setDe_documento_adjunto(String de_documento_adjunto) {
        this.de_documento_adjunto = de_documento_adjunto;
    }

    public String getAr_dato_archivo() {
        return ar_dato_archivo;
    }

    public void setAr_dato_archivo(String ar_dato_archivo) {
        this.ar_dato_archivo = ar_dato_archivo;
    }



}
