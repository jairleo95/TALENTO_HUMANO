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
public class Pedido {

    private String id_pedido;
    private String fe_pedido;
    private String fe_procesado;
    private String fe_envio;
    private String es_pedido;
    private String es_firma;
    private String id_proceso;
    private String us_creacion;
    private String fe_creacion;
    private String us_modif;
    private String fe_modif;
    private String ip_usuario;

    public Pedido(String id_pedido, String fe_pedido, String fe_procesado, String fe_envio, String es_pedido, String es_firma, String id_proceso, String us_creacion, String fe_creacion, String us_modif, String fe_modif, String ip_usuario) {
        this.id_pedido = id_pedido;
        this.fe_pedido = fe_pedido;
        this.fe_procesado = fe_procesado;
        this.fe_envio = fe_envio;
        this.es_pedido = es_pedido;
        this.es_firma = es_firma;
        this.id_proceso = id_proceso;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modif = us_modif;
        this.fe_modif = fe_modif;
        this.ip_usuario = ip_usuario;
    }

    public Pedido() {
        this.id_pedido = "";
        this.fe_pedido = "";
        this.fe_procesado = "";
        this.fe_envio = "";
        this.es_pedido = "";
        this.es_firma = "";
        this.id_proceso = "";
        this.us_creacion = "";
        this.fe_creacion = "";
        this.us_modif = "";
        this.fe_modif = "";
        this.ip_usuario = "";
    }

    public String getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(String id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getFe_pedido() {
        return fe_pedido;
    }

    public void setFe_pedido(String fe_pedido) {
        this.fe_pedido = fe_pedido;
    }

    public String getFe_procesado() {
        return fe_procesado;
    }

    public void setFe_procesado(String fe_procesado) {
        this.fe_procesado = fe_procesado;
    }

    public String getFe_envio() {
        return fe_envio;
    }

    public void setFe_envio(String fe_envio) {
        this.fe_envio = fe_envio;
    }

    public String getEs_pedido() {
        return es_pedido;
    }

    public void setEs_pedido(String es_pedido) {
        this.es_pedido = es_pedido;
    }

    public String getEs_firma() {
        return es_firma;
    }

    public void setEs_firma(String es_firma) {
        this.es_firma = es_firma;
    }

    public String getId_proceso() {
        return id_proceso;
    }

    public void setId_proceso(String id_proceso) {
        this.id_proceso = id_proceso;
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
    
    

    
}
