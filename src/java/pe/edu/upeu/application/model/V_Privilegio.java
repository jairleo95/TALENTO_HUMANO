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
public class V_Privilegio {

    private String id_privilegio;
    private String id_detalle_privilegio;
    private String id_rol;
    private String no_link;
    private String di_url;
    private Double nu_orden;

    public V_Privilegio(String id_privilegio, String id_detalle_privilegio, String id_rol, String no_link, String di_url, Double nu_orden) {
        this.id_privilegio = id_privilegio;
        this.id_detalle_privilegio = id_detalle_privilegio;
        this.id_rol = id_rol;
        this.no_link = no_link;
        this.di_url = di_url;
        this.nu_orden = nu_orden;
    }
    
     public V_Privilegio() {
        this.id_privilegio = "";
        this.id_detalle_privilegio = "";
        this.id_rol = "";
        this.no_link = "";
        this.di_url = "";
        this.nu_orden = 0.0;
    } 
     
    public String getId_privilegio() {
        return id_privilegio;
    }

    public void setId_privilegio(String id_privilegio) {
        this.id_privilegio = id_privilegio;
    }

    public String getId_detalle_privilegio() {
        return id_detalle_privilegio;
    }

    public void setId_detalle_privilegio(String id_detalle_privilegio) {
        this.id_detalle_privilegio = id_detalle_privilegio;
    }

    public String getId_rol() {
        return id_rol;
    }

    public void setId_rol(String id_rol) {
        this.id_rol = id_rol;
    }

    public String getNo_link() {
        return no_link;
    }

    public void setNo_link(String no_link) {
        this.no_link = no_link;
    }

    public String getDi_url() {
        return di_url;
    }

    public void setDi_url(String di_url) {
        this.di_url = di_url;
    }

    public Double getNu_orden() {
        return nu_orden;
    }

    public void setNu_orden(Double nu_orden) {
        this.nu_orden = nu_orden;
    }

}
