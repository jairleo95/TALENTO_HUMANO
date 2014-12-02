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
public class Modalidad {
    private String id_modalidad;
    private String co_modalidad;
    private String de_modalidad;

    public Modalidad(String id_modalidad, String co_modalidad, String de_modalidad) {
        this.id_modalidad = id_modalidad;
        this.co_modalidad = co_modalidad;
        this.de_modalidad = de_modalidad;
    }
    public Modalidad() {
        this.id_modalidad = "";
        this.co_modalidad = "";
        this.de_modalidad = "";
    }

    public String getId_modalidad() {
        return id_modalidad;
    }

    public void setId_modalidad(String id_modalidad) {
        this.id_modalidad = id_modalidad;
    }

    public String getCo_modalidad() {
        return co_modalidad;
    }

    public void setCo_modalidad(String co_modalidad) {
        this.co_modalidad = co_modalidad;
    }

    public String getDe_modalidad() {
        return de_modalidad;
    }

    public void setDe_modalidad(String de_modalidad) {
        this.de_modalidad = de_modalidad;
    }
    
}
