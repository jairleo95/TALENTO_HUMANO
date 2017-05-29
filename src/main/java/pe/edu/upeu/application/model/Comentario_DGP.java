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
public class Comentario_DGP {

    private String id_comentario_dgp;
    private String id_usuario;
    private String id_dgp;
    private String id_autorizacion;
    private String cm_comentario;
    private String us_creacion;
    private String fe_creacion;
    private String us_modificacion;
    private String fe_modificacion;
    private String es_comentario_dgp;
    private String id_pasos;

    public Comentario_DGP(String id_comentario_dgp, String id_usuario, String id_dgp, String id_autorizacion, String cm_comentario, String us_creacion, String fe_creacion, String us_modificacion, String fe_modificacion, String es_comentario_dgp, String id_pasos) {
        this.id_comentario_dgp = id_comentario_dgp;
        this.id_usuario = id_usuario;
        this.id_dgp = id_dgp;
        this.id_autorizacion = id_autorizacion;
        this.cm_comentario = cm_comentario;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modificacion = us_modificacion;
        this.fe_modificacion = fe_modificacion;
        this.es_comentario_dgp = es_comentario_dgp;
        this.id_pasos = id_pasos;
    }

    public Comentario_DGP() {
        this.id_comentario_dgp = "";
        this.id_usuario = "";
        this.id_dgp = "";
        this.id_autorizacion = "";
        this.cm_comentario = "";
        this.us_creacion = "";
        this.fe_creacion = "";
        this.us_modificacion = "";
        this.fe_modificacion = "";
        this.es_comentario_dgp = "";
        this.id_pasos = "";
    }

    public String getId_comentario_dgp() {
        return id_comentario_dgp;
    }

    public void setId_comentario_dgp(String id_comentario_dgp) {
        this.id_comentario_dgp = id_comentario_dgp;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getId_autorizacion() {
        return id_autorizacion;
    }

    public void setId_autorizacion(String id_autorizacion) {
        this.id_autorizacion = id_autorizacion;
    }

    public String getCm_comentario() {
        return cm_comentario;
    }

    public void setCm_comentario(String cm_comentario) {
        this.cm_comentario = cm_comentario;
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

    public String getUs_modificacion() {
        return us_modificacion;
    }

    public void setUs_modificacion(String us_modificacion) {
        this.us_modificacion = us_modificacion;
    }

    public String getFe_modificacion() {
        return fe_modificacion;
    }

    public void setFe_modificacion(String fe_modificacion) {
        this.fe_modificacion = fe_modificacion;
    }

    public String getEs_comentario_dgp() {
        return es_comentario_dgp;
    }

    public void setEs_comentario_dgp(String es_comentario_dgp) {
        this.es_comentario_dgp = es_comentario_dgp;
    }

    public String getId_pasos() {
        return id_pasos;
    }

    public void setId_pasos(String id_pasos) {
        this.id_pasos = id_pasos;
    }
    
    
}
