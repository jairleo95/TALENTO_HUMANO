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
public class Detalle_Pasos {

    private String id_detalle_pasos;
    private String id_pasos;
    private String id_puesto;
    private String es_detalle_pasos;
    private String co_puesto;

    public Detalle_Pasos(String id_detalle_pasos, String id_pasos, String id_puesto, String es_detalle_pasos, String co_puesto) {
        this.id_detalle_pasos = id_detalle_pasos;
        this.id_pasos = id_pasos;
        this.id_puesto = id_puesto;
        this.es_detalle_pasos = es_detalle_pasos;
        this.co_puesto = co_puesto;
    }

    public Detalle_Pasos() {
        this.id_detalle_pasos = "";
        this.id_pasos = "";
        this.id_puesto = "";
        this.es_detalle_pasos = "";
        this.co_puesto = "";
    }

    public String getId_detalle_pasos() {
        return id_detalle_pasos;
    }

    public void setId_detalle_pasos(String id_detalle_pasos) {
        this.id_detalle_pasos = id_detalle_pasos;
    }

    public String getId_pasos() {
        return id_pasos;
    }

    public void setId_pasos(String id_pasos) {
        this.id_pasos = id_pasos;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getEs_detalle_pasos() {
        return es_detalle_pasos;
    }

    public void setEs_detalle_pasos(String es_detalle_pasos) {
        this.es_detalle_pasos = es_detalle_pasos;
    }

    public String getCo_puesto() {
        return co_puesto;
    }

    public void setCo_puesto(String co_puesto) {
        this.co_puesto = co_puesto;
    }
    
    
    
    
}
