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
public class Funciones {
    private String id_fucion;
    private String de_funcion;
    private String es_funcion;
    private String us_creacion;
    private String fe_creacion;
    private String us_modif;
    private String fe_modif;
    private String id_puesto;
    private String no_puesto;

    public Funciones(String id_fucion, String de_funcion, String es_funcion, String us_creacion, String fe_creacion, String us_modif, String fe_modif, String id_puesto,String no_puesto) {
        this.id_fucion = id_fucion;
        this.de_funcion = de_funcion;
        this.es_funcion = es_funcion;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modif = us_modif;
        this.fe_modif = fe_modif;
        this.id_puesto = id_puesto;
        this.no_puesto = no_puesto;
    }
    public Funciones() {
        this.id_fucion = "";
        this.de_funcion = "";
        this.es_funcion = "";
        this.us_creacion = "";
        this.fe_creacion = "";
        this.us_modif = "";
        this.fe_modif = "";
        this.id_puesto = "";
        this.no_puesto = "";
    }

    public String getNo_puesto() {
        return no_puesto;
    }

    public void setNo_puesto(String no_puesto) {
        this.no_puesto = no_puesto;
    }

    public String getId_fucion() {
        return id_fucion;
    }

    public void setId_fucion(String id_fucion) {
        this.id_fucion = id_fucion;
    }

    public String getDe_funcion() {
        return de_funcion;
    }

    public void setDe_funcion(String de_funcion) {
        this.de_funcion = de_funcion;
    }

    public String getEs_funcion() {
        return es_funcion;
    }

    public void setEs_funcion(String es_funcion) {
        this.es_funcion = es_funcion;
    }

    public String getUs_creacion() {
        return us_creacion;
    }

    public void setUs_creacion(String us_creacion) {
        this.us_creacion = us_creacion;
    }

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }

    public String getUs_modif() {
        return us_modif;
    }

    public void setUs_modif(String us_modif) {
        this.us_modif = us_modif;
    }

    public String getFe_modif() {
        return fe_modif;
    }

    public void setFe_modif(String fe_modif) {
        this.fe_modif = fe_modif;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }
    
}
