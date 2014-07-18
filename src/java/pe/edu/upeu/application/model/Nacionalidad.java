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
public class Nacionalidad {

    private String id_nacionalidad;
    private String no_nacionalidad;

    public Nacionalidad(String id_nacionalidad, String no_nacionalidad) {
        this.id_nacionalidad = id_nacionalidad;
        this.no_nacionalidad = no_nacionalidad;
    }

    public Nacionalidad() {
        this.id_nacionalidad = "";
        this.no_nacionalidad = "";
    }

    public String getId_nacionalidad() {
        return id_nacionalidad;
    }

    public void setId_nacionalidad(String id_nacionalidad) {
        this.id_nacionalidad = id_nacionalidad;
    }

    public String getNo_nacionalidad() {
        return no_nacionalidad;
    }

    public void setNo_nacionalidad(String no_nacionalidad) {
        this.no_nacionalidad = no_nacionalidad;
    }

}
