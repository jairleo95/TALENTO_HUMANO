/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author Cesar
 */
public class Notification {

    private String id_notification;
    private String id_rol;
    private String es_visualizado;
    private String es_leido;
    private String de_notification;
    private String di_notification;
    private String titulo;
    private String fecha;
    private String tipo_notification;
    private String id_usuario;
    private Boolean enable_send_email;
    private Boolean mail_status;
    private String url_external_access;

    public Notification() {
        this.id_rol = "";
        this.es_visualizado = "";
        this.es_leido = "";
        this.de_notification = "";
        this.di_notification = "";
        this.titulo = "";
        this.fecha = "";
        this.tipo_notification = "";
        this.id_usuario = "";
        this.enable_send_email = false;
        this.mail_status = false;
        this.url_external_access = "";
    }

    public Boolean getEnable_send_email() {
        return enable_send_email;
    }

    public void setEnable_send_email(Boolean enable_send_email) {
        this.enable_send_email = enable_send_email;
    }

    public Boolean getMail_status() {
        return mail_status;
    }

    public void setMail_status(Boolean mail_status) {
        this.mail_status = mail_status;
    }

    public String getUrl_external_access() {
        return url_external_access;
    }

    public void setUrl_external_access(String url_external_access) {
        this.url_external_access = url_external_access;
    }

    public String getId_notification() {
        return id_notification;
    }

    public void setId_notification(String id_notification) {
        this.id_notification = id_notification;
    }

    public String getId_rol() {
        return id_rol;
    }

    public void setId_rol(String id_rol) {
        this.id_rol = id_rol;
    }

    public String getEs_visualizado() {
        return es_visualizado;
    }

    public void setEs_visualizado(String es_visualizado) {
        this.es_visualizado = es_visualizado;
    }

    public String getEs_leido() {
        return es_leido;
    }

    public void setEs_leido(String es_leido) {
        this.es_leido = es_leido;
    }

    public String getDe_notification() {
        return de_notification;
    }

    public void setDe_notification(String de_notification) {
        this.de_notification = de_notification;
    }

    public String getDi_notification() {
        return di_notification;
    }

    public void setDi_notification(String di_notification) {
        this.di_notification = di_notification;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getTipo_notification() {
        return tipo_notification;
    }

    public void setTipo_notification(String tipo_notification) {
        this.tipo_notification = tipo_notification;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

}
