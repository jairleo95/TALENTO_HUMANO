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
public class Auto_Mostrar {

    private String id_auto_mostrar;
    private String di_url;
    private String id_rol;

    public Auto_Mostrar(String id_auto_mostrar, String di_url, String id_rol) {
        this.id_auto_mostrar = id_auto_mostrar;
        this.di_url = di_url;
        this.id_rol = id_rol;
    }

    public Auto_Mostrar() {
        this.id_auto_mostrar = "";
        this.di_url = "";
        this.id_rol = "";
    }

    public String getId_auto_mostrar() {
        return id_auto_mostrar;
    }

    public void setId_auto_mostrar(String id_auto_mostrar) {
        this.id_auto_mostrar = id_auto_mostrar;
    }

    public String getDi_url() {
        return di_url;
    }

    public void setDi_url(String di_url) {
        this.di_url = di_url;
    }

    public String getId_rol() {
        return id_rol;
    }

    public void setId_rol(String id_rol) {
        this.id_rol = id_rol;
    }

}
