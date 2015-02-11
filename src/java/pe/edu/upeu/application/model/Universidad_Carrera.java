/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.model;

/**
 *
 * @author Alex
 */
public class Universidad_Carrera {
    private String id_universidad_carrera;
    private String id_carrera;
    private String id_universidad;
    private String es_uni_carr;

    public Universidad_Carrera(String id_universidad_carrera, String id_carrera, String id_universidad, String es_uni_carr) {
        this.id_universidad_carrera = id_universidad_carrera;
        this.id_carrera = id_carrera;
        this.id_universidad = id_universidad;
        this.es_uni_carr = es_uni_carr;
    }

    public Universidad_Carrera() {
        this.id_universidad_carrera = "";
        this.id_carrera = "";
        this.id_universidad = "";
        this.es_uni_carr = "";
    }

    public String getId_universidad_carrera() {
        return id_universidad_carrera;
    }

    public void setId_universidad_carrera(String id_universidad_carrera) {
        this.id_universidad_carrera = id_universidad_carrera;
    }

    public String getId_carrera() {
        return id_carrera;
    }

    public void setId_carrera(String id_carrera) {
        this.id_carrera = id_carrera;
    }

    public String getId_universidad() {
        return id_universidad;
    }

    public void setId_universidad(String id_universidad) {
        this.id_universidad = id_universidad;
    }

    public String getEs_uni_carr() {
        return es_uni_carr;
    }

    public void setEs_uni_carr(String es_uni_carr) {
        this.es_uni_carr = es_uni_carr;
    }
    
    
}
