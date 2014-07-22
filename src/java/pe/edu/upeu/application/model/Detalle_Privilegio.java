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
public class Detalle_Privilegio {

    private String id_detalle_privilegio;
    private String id_rol;
    private int nu_orden;
    private String id_privilegio;
    private String es_detalle_privilegio;

    public Detalle_Privilegio(String id_detalle_privilegio, String id_rol, int nu_orden, String id_privilegio, String es_detalle_privilegio) {
        this.id_detalle_privilegio = id_detalle_privilegio;
        this.id_rol = id_rol;
        this.nu_orden = nu_orden;
        this.id_privilegio = id_privilegio;
        this.es_detalle_privilegio = es_detalle_privilegio;
    }
    public Detalle_Privilegio() {
        this.id_detalle_privilegio = id_detalle_privilegio;
        this.id_rol = id_rol;
        this.nu_orden = nu_orden;
        this.id_privilegio = id_privilegio;
        this.es_detalle_privilegio = es_detalle_privilegio;
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

    public int getNu_orden() {
        return nu_orden;
    }

    public void setNu_orden(int nu_orden) {
        this.nu_orden = nu_orden;
    }

    public String getId_privilegio() {
        return id_privilegio;
    }

    public void setId_privilegio(String id_privilegio) {
        this.id_privilegio = id_privilegio;
    }

    public String getEs_detalle_privilegio() {
        return es_detalle_privilegio;
    }

    public void setEs_detalle_privilegio(String es_detalle_privilegio) {
        this.es_detalle_privilegio = es_detalle_privilegio;
    }
    
}