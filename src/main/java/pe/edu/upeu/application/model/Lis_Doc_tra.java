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
public class Lis_Doc_tra {

    private String ti_documento;
    private String no_original;
    private String no_file;
    private String no_documento;
    private String id_trabajador;
    private String id_documentos;
    private String id_documento_adjunto;
    private String id_dgp_doc_adj;
    private String id_dgp;
    private String es_obligatorio;
    private String es_documento_adjunto;
    private String es_documento;
    private String es_dgp_doc_adj;
    private String de_documento_adjunto;
    private String id_datos_hijo;
    private String id_contrato;
    private String es_rec_fisico;

    public String getId_contrato() {
        return id_contrato;
    }

    public void setId_contrato(String id_contrato) {
        this.id_contrato = id_contrato;
    }

    public String getEs_rec_fisico() {
        return es_rec_fisico;
    }

    public void setEs_rec_fisico(String es_rec_fisico) {
        this.es_rec_fisico = es_rec_fisico;
    }

    public String getId_datos_hijo() {
        return id_datos_hijo;
    }

    public void setId_datos_hijo(String id_datos_hijo) {
        this.id_datos_hijo = id_datos_hijo;
    }

    public Lis_Doc_tra(String ti_documento, String no_original, String no_file, String no_documento, String id_trabajador, String id_documentos, String id_documento_adjunto,
            String id_dgp_doc_adj, String id_dgp, String es_obligatorio, String es_documento_adjunto, String es_documento, String es_dgp_doc_adj, String de_documento_adjunto,
            String id_datos_hijo, String id_contrato, String es_rec_fisico) {
        this.ti_documento = ti_documento;
        this.no_original = no_original;
        this.no_file = no_file;
        this.no_documento = no_documento;
        this.id_trabajador = id_trabajador;
        this.id_documentos = id_documentos;
        this.id_documento_adjunto = id_documento_adjunto;
        this.id_dgp_doc_adj = id_dgp_doc_adj;
        this.id_dgp = id_dgp;
        this.es_obligatorio = es_obligatorio;
        this.es_documento_adjunto = es_documento_adjunto;
        this.es_documento = es_documento;
        this.es_dgp_doc_adj = es_dgp_doc_adj;
        this.de_documento_adjunto = de_documento_adjunto;
        this.id_datos_hijo = id_datos_hijo;
        this.id_contrato = id_contrato;
        this.es_rec_fisico = es_rec_fisico;
    }

    public Lis_Doc_tra() {
        this.ti_documento = "";
        this.no_original = "";
        this.no_file = "";
        this.no_documento = "";
        this.id_trabajador = "";
        this.id_documentos = "";
        this.id_documento_adjunto = "";
        this.id_dgp_doc_adj = "";
        this.id_dgp = "";
        this.es_obligatorio = "";
        this.es_documento_adjunto = "";
        this.es_documento = "";
        this.es_dgp_doc_adj = "";
        this.de_documento_adjunto = "";
        this.id_datos_hijo = "";
        this.id_contrato = "";
        this.es_rec_fisico = "";
    }

    public String getDe_documento_adjunto() {
        return de_documento_adjunto;
    }

    public void setDe_documento_adjunto(String de_documento_adjunto) {
        this.de_documento_adjunto = de_documento_adjunto;
    }

    public String getTi_documento() {
        return ti_documento;
    }

    public void setTi_documento(String ti_documento) {
        this.ti_documento = ti_documento;
    }

    public String getNo_original() {
        return no_original;
    }

    public void setNo_original(String no_original) {
        this.no_original = no_original;
    }

    public String getNo_file() {
        return no_file;
    }

    public void setNo_file(String no_file) {
        this.no_file = no_file;
    }

    public String getNo_documento() {
        return no_documento;
    }

    public void setNo_documento(String no_documento) {
        this.no_documento = no_documento;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public String getId_documentos() {
        return id_documentos;
    }

    public void setId_documentos(String id_documentos) {
        this.id_documentos = id_documentos;
    }

    public String getId_documento_adjunto() {
        return id_documento_adjunto;
    }

    public void setId_documento_adjunto(String id_documento_adjunto) {
        this.id_documento_adjunto = id_documento_adjunto;
    }

    public String getId_dgp_doc_adj() {
        return id_dgp_doc_adj;
    }

    public void setId_dgp_doc_adj(String id_dgp_doc_adj) {
        this.id_dgp_doc_adj = id_dgp_doc_adj;
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getEs_obligatorio() {
        return es_obligatorio;
    }

    public void setEs_obligatorio(String es_obligatorio) {
        this.es_obligatorio = es_obligatorio;
    }

    public String getEs_documento_adjunto() {
        return es_documento_adjunto;
    }

    public void setEs_documento_adjunto(String es_documento_adjunto) {
        this.es_documento_adjunto = es_documento_adjunto;
    }

    public String getEs_documento() {
        return es_documento;
    }

    public void setEs_documento(String es_documento) {
        this.es_documento = es_documento;
    }

    public String getEs_dgp_doc_adj() {
        return es_dgp_doc_adj;
    }

    public void setEs_dgp_doc_adj(String es_dgp_doc_adj) {
        this.es_dgp_doc_adj = es_dgp_doc_adj;
    }

}
