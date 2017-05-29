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
public class Documento_Adjunto {

    private String id_documento_adjunto;
    private String id_dgp;
    private String id_documentos;
    private String es_documento_adjunto;
    private String us_creacion;
    private String fe_creacion;
    private String us_modif;
    private String fe_modif;
    private String ip_usuario;
    private String de_documento_adjunto;
    private String ar_dato_archivo;
    private String no_archivo;
    private String ta_archivo ;
    private String ar_file_type;

    public Documento_Adjunto(String id_documento_adjunto, String id_dgp, String id_documentos, String es_documento_adjunto, String us_creacion, String fe_creacion, String us_modif, String fe_modif, String ip_usuario, String de_documento_adjunto, String ar_dato_archivo, String no_archivo, String ta_archivo, String ar_file_type) {
        this.id_documento_adjunto = id_documento_adjunto;
        this.id_dgp = id_dgp;
        this.id_documentos = id_documentos;
        this.es_documento_adjunto = es_documento_adjunto;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modif = us_modif;
        this.fe_modif = fe_modif;
        this.ip_usuario = ip_usuario;
        this.de_documento_adjunto = de_documento_adjunto;
        this.ar_dato_archivo = ar_dato_archivo;
        this.no_archivo = no_archivo;
        this.ta_archivo = ta_archivo;
        this.ar_file_type = ar_file_type;
    }

     public Documento_Adjunto() {
        this.id_documento_adjunto = "";
        this.id_dgp = "";
        this.id_documentos = "";
        this.es_documento_adjunto = "";
        this.us_creacion = "";
        this.fe_creacion = "";
        this.us_modif = "";
        this.fe_modif = "";
        this.ip_usuario = "";
        this.de_documento_adjunto = "";
        this.ar_dato_archivo = "";
        this.no_archivo = "";
        this.ta_archivo = "";
        this.ar_file_type = "";
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

    public String getId_documentos() {
        return id_documentos;
    }

    public void setId_documentos(String id_documentos) {
        this.id_documentos = id_documentos;
    }

    public String getEs_documento_adjunto() {
        return es_documento_adjunto;
    }

    public void setEs_documento_adjunto(String es_documento_adjunto) {
        this.es_documento_adjunto = es_documento_adjunto;
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

    public String getUs_modif() {
        return us_modif;
    }

    public void setUs_modif(String us_modif) {
        this.us_modif = us_modif;
    }

    public String getFe_modif() {
        return fe_modif;
    }

    public void setFe_modif(String fe_modif) {
        this.fe_modif = fe_modif;
    }

    public String getIp_usuario() {
        return ip_usuario;
    }

    public void setIp_usuario(String ip_usuario) {
        this.ip_usuario = ip_usuario;
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

    public String getNo_archivo() {
        return no_archivo;
    }

    public void setNo_archivo(String no_archivo) {
        this.no_archivo = no_archivo;
    }

    public String getTa_archivo() {
        return ta_archivo;
    }

    public void setTa_archivo(String ta_archivo) {
        this.ta_archivo = ta_archivo;
    }

    public String getAr_file_type() {
        return ar_file_type;
    }

    public void setAr_file_type(String ar_file_type) {
        this.ar_file_type = ar_file_type;
    }
     
}
