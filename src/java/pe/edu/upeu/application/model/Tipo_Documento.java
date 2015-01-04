/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author ALFA 3
 */
public class Tipo_Documento {

    private String id_tipo_doc_ident;
    private String de_tip_doc;
    private String de_tdoc_abreviada;
    private String co_tdoc;

    public Tipo_Documento(String id_tipo_doc_ident, String de_tip_doc, String de_tdoc_abreviada, String co_tdoc) {
        this.id_tipo_doc_ident = id_tipo_doc_ident;
        this.de_tip_doc = de_tip_doc;
        this.de_tdoc_abreviada = de_tdoc_abreviada;
        this.co_tdoc = co_tdoc;
    }

    public Tipo_Documento() {
        this.id_tipo_doc_ident = "";
        this.de_tip_doc = "";
        this.de_tdoc_abreviada = "";
        this.co_tdoc = "";
    }

    public String getId_tipo_doc_ident() {
        return id_tipo_doc_ident;
    }

    public void setId_tipo_doc_ident(String id_tipo_doc_ident) {
        this.id_tipo_doc_ident = id_tipo_doc_ident;
    }

    public String getDe_tip_doc() {
        return de_tip_doc;
    }

    public void setDe_tip_doc(String de_tip_doc) {
        this.de_tip_doc = de_tip_doc;
    }

    public String getDe_tdoc_abreviada() {
        return de_tdoc_abreviada;
    }

    public void setDe_tdoc_abreviada(String de_tdoc_abreviada) {
        this.de_tdoc_abreviada = de_tdoc_abreviada;
    }

    public String getCo_tdoc() {
        return co_tdoc;
    }

    public void setCo_tdoc(String co_tdoc) {
        this.co_tdoc = co_tdoc;
    }

}
