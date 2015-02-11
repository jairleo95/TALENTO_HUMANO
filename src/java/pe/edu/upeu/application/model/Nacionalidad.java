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
    private String co_nacionalidad;

    public Nacionalidad(String id_nacionalidad, String no_nacionalidad,String co_nacionalidad) {
        this.id_nacionalidad = id_nacionalidad;
        this.no_nacionalidad = no_nacionalidad;
        this.co_nacionalidad = co_nacionalidad;
    }

    public Nacionalidad() {
        this.id_nacionalidad = "";
        this.no_nacionalidad = "";
        this.co_nacionalidad = "";
    }

    public String getCo_nacionalidad() {
        return co_nacionalidad;
    }

    public void setCo_nacionalidad(String co_nacionalidad) {
        this.co_nacionalidad = co_nacionalidad;
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
