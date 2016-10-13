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

    public Notification(String id_notification, String id_rol, String es_visualizado, String es_leido, String de_notification, String di_notification, String titulo, String fecha, String tipo_notification, String id_usuario) {
        this.id_notification = id_notification;
        this.id_rol = id_rol;
        this.es_visualizado = es_visualizado;
        this.es_leido = es_leido;
        this.de_notification = de_notification;
        this.di_notification = di_notification;
        this.titulo = titulo;
        this.fecha = fecha;
        this.tipo_notification = tipo_notification;
        this.id_usuario = id_usuario;
    }

    public Notification(String id_rol, String es_visualizado, String es_leido, String de_notification, String di_notification, String titulo, String fecha, String tipo_notification, String id_usuario) {
        this.id_rol = id_rol;
        this.es_visualizado = es_visualizado;
        this.es_leido = es_leido;
        this.de_notification = de_notification;
        this.di_notification = di_notification;
        this.titulo = titulo;
        this.fecha = fecha;
        this.tipo_notification = tipo_notification;
        this.id_usuario = id_usuario;
    }

    public Notification() {
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
