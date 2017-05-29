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
public class Seccion {

    private String id_seccion;
    private String no_seccion;
    private String no_corto_sec;
    private String es_seccion;
    private String id_area;

    public Seccion(String id_seccion, String no_seccion, String no_corto_sec, String es_seccion, String id_area) {
        this.id_seccion = id_seccion;
        this.no_seccion = no_seccion;
        this.no_corto_sec = no_corto_sec;
        this.es_seccion = es_seccion;
        this.id_area = id_area;
    }

    public Seccion() {
        this.id_seccion = "";
        this.no_seccion = "";
        this.no_corto_sec = "";
        this.es_seccion = "";
        this.id_area = "";
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getNo_seccion() {
        return no_seccion;
    }

    public void setNo_seccion(String no_seccion) {
        this.no_seccion = no_seccion;
    }

    public String getNo_corto_sec() {
        return no_corto_sec;
    }

    public void setNo_corto_sec(String no_corto_sec) {
        this.no_corto_sec = no_corto_sec;
    }

    public String getEs_seccion() {
        return es_seccion;
    }

    public void setEs_seccion(String es_seccion) {
        this.es_seccion = es_seccion;
    }

    public String getId_area() {
        return id_area;
    }

    public void setId_area(String id_area) {
        this.id_area = id_area;
    }

    
}
