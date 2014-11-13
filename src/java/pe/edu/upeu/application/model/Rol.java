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
public class Rol {

    private String id_rol;
    private String no_rol;
    private String es_rol;

    public Rol(String id_rol, String no_rol, String es_rol) {
        this.id_rol = id_rol;
        this.no_rol = no_rol;
        this.es_rol = es_rol;
    }
    public Rol(){
        this.id_rol = "";
        this.no_rol = "";
        this.es_rol = "";
    }

    public String getId_rol() {
        return id_rol;
    }

    public void setId_rol(String id_rol) {
        this.id_rol = id_rol;
    }

    public String getNo_rol() {
        return no_rol;
    }

    public void setNo_rol(String no_rol) {
        this.no_rol = no_rol;
    }

    public String getEs_rol() {
        return es_rol;
    }

    public void setEs_rol(String es_rol) {
        this.es_rol = es_rol;
    }
    

    
}
