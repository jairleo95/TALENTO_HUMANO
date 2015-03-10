/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author joserodrigo
 */
public class Contrato_Adjunto {

    private String id_contrato_adjunto;
    private String id_contrato;
    private String no_archivo;
    private String no_archivo_original;
    private String es_archivo_adjunto;
    private String us_creacion;
    private String fe_creacion;

    public Contrato_Adjunto(String id_contrato_adjunto, String id_contrato, String no_archivo, String no_archivo_original, String es_archivo_adjunto, String us_creacion, String fe_creacion) {
        this.id_contrato_adjunto = id_contrato_adjunto;
        this.id_contrato = id_contrato;
        this.no_archivo = no_archivo;
        this.no_archivo_original = no_archivo_original;
        this.es_archivo_adjunto = es_archivo_adjunto;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
    }

    public Contrato_Adjunto() {
        this.id_contrato_adjunto = "";
        this.id_contrato = "";
        this.no_archivo = "";
        this.no_archivo_original = "";
        this.es_archivo_adjunto = "";
        this.us_creacion = "";
        this.fe_creacion = "";
    }

    public String getId_contrato_adjunto() {
        return id_contrato_adjunto;
    }

    public void setId_contrato_adjunto(String id_contrato_adjunto) {
        this.id_contrato_adjunto = id_contrato_adjunto;
    }

    public String getId_contrato() {
        return id_contrato;
    }

    public void setId_contrato(String id_contrato) {
        this.id_contrato = id_contrato;
    }

    public String getNo_archivo() {
        return no_archivo;
    }

    public void setNo_archivo(String no_archivo) {
        this.no_archivo = no_archivo;
    }

    public String getNo_archivo_original() {
        return no_archivo_original;
    }

    public void setNo_archivo_original(String no_archivo_original) {
        this.no_archivo_original = no_archivo_original;
    }

    public String getEs_archivo_adjunto() {
        return es_archivo_adjunto;
    }

    public void setEs_archivo_adjunto(String es_archivo_adjunto) {
        this.es_archivo_adjunto = es_archivo_adjunto;
    }

    public String getUs_creacion() {
        return us_creacion;
    }

    public void setUs_creacion(String us_creacion) {
        this.us_creacion = us_creacion;
    }

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }

}
