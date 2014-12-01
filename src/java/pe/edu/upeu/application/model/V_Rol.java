/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.model;

/**
 *
 * @author joserodrigo
 */
public class V_Rol {
    String no_Rol;
    String id_rol;

    public V_Rol(String no_Rol, String id_rol) {
        this.no_Rol = no_Rol;
        this.id_rol = id_rol;
    }
    public V_Rol() {
        this.no_Rol = "";
        this.id_rol = "";
    }

    public String getNo_Rol() {
        return no_Rol;
    }

    public void setNo_Rol(String no_Rol) {
        this.no_Rol = no_Rol;
    }

    public String getId_rol() {
        return id_rol;
    }

    public void setId_rol(String id_rol) {
        this.id_rol = id_rol;
    }
    
}
