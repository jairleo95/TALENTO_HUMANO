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
public class Area {

    private String id_area;
    private String no_area;
    private String no_corto_area;
    private String es_area;
    private String id_departamento;

    public Area(String id_area, String no_area, String no_corto_area, String es_area, String id_departamento) {
        this.id_area = id_area;
        this.no_area = no_area;
        this.no_corto_area = no_corto_area;
        this.es_area = es_area;
        this.id_departamento = id_departamento;
    }

    public Area() {
        this.id_area = "";
        this.no_area = "";
        this.no_corto_area = "";
        this.es_area = "";
        this.id_departamento = "";
    }

    public String getId_area() {
        return id_area;
    }

    public void setId_area(String id_area) {
        this.id_area = id_area;
    }

    public String getNo_area() {
        return no_area;
    }

    public void setNo_area(String no_area) {
        this.no_area = no_area;
    }

    public String getNo_corto_area() {
        return no_corto_area;
    }

    public void setNo_corto_area(String no_corto_area) {
        this.no_corto_area = no_corto_area;
    }

    public String getEs_area() {
        return es_area;
    }

    public void setEs_area(String es_area) {
        this.es_area = es_area;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }
   
    
}
