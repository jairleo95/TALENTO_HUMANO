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
public class Sub_Modalidad {
    private String id_sub_modalidad;
    private String co_sub_modalidad;
    private String de_sub_modalidad;
    private String id_modalidad;

    public Sub_Modalidad(String id_sub_modalidad, String co_sub_modalidad, String de_sub_modalidad, String id_modalidad) {
        this.id_sub_modalidad = id_sub_modalidad;
        this.co_sub_modalidad = co_sub_modalidad;
        this.de_sub_modalidad = de_sub_modalidad;
        this.id_modalidad = id_modalidad;
    }
    public Sub_Modalidad() {
        this.id_sub_modalidad = "";
        this.co_sub_modalidad = "";
        this.de_sub_modalidad = "";
        this.id_modalidad = "";
    }

    public String getId_sub_modalidad() {
        return id_sub_modalidad;
    }

    public void setId_sub_modalidad(String id_sub_modalidad) {
        this.id_sub_modalidad = id_sub_modalidad;
    }

    public String getCo_sub_modalidad() {
        return co_sub_modalidad;
    }

    public void setCo_sub_modalidad(String co_sub_modalidad) {
        this.co_sub_modalidad = co_sub_modalidad;
    }

    public String getDe_sub_modalidad() {
        return de_sub_modalidad;
    }

    public void setDe_sub_modalidad(String de_sub_modalidad) {
        this.de_sub_modalidad = de_sub_modalidad;
    }

    public String getId_modalidad() {
        return id_modalidad;
    }

    public void setId_modalidad(String id_modalidad) {
        this.id_modalidad = id_modalidad;
    }
}
