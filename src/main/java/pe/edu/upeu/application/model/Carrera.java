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
public class Carrera {

    private String id_carrera;
    private String no_carrera;

    public Carrera(String id_carrera, String no_carrera) {
        this.id_carrera = id_carrera;
        this.no_carrera = no_carrera;
    }

    public Carrera() {
        this.id_carrera = "";
        this.no_carrera = "";
    }

    public String getId_carrera() {
        return id_carrera;
    }

    public void setId_carrera(String id_carrera) {
        this.id_carrera = id_carrera;
    }

    public String getNo_carrera() {
        return no_carrera;
    }

    public void setNo_carrera(String no_carrera) {
        this.no_carrera = no_carrera;
    }
    
}
