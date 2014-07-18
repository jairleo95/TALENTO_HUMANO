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
public class Puesto {

    private String id_puesto;
    private String no_puesto;
    private String no_corto_pu;
    private String es_puesto;
    private String id_seccion;
    private String co_grupo;

    public Puesto(String id_puesto, String no_puesto, String no_corto_pu, String es_puesto, String id_seccion, String co_grupo) {
        this.id_puesto = id_puesto;
        this.no_puesto = no_puesto;
        this.no_corto_pu = no_corto_pu;
        this.es_puesto = es_puesto;
        this.id_seccion = id_seccion;
        this.co_grupo = co_grupo;
    }

    public Puesto() {
        this.id_puesto = "";
        this.no_puesto = "";
        this.no_corto_pu = "";
        this.es_puesto = "";
        this.id_seccion = "";
        this.co_grupo = "";
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getNo_puesto() {
        return no_puesto;
    }

    public void setNo_puesto(String no_puesto) {
        this.no_puesto = no_puesto;
    }

    public String getNo_corto_pu() {
        return no_corto_pu;
    }

    public void setNo_corto_pu(String no_corto_pu) {
        this.no_corto_pu = no_corto_pu;
    }

    public String getEs_puesto() {
        return es_puesto;
    }

    public void setEs_puesto(String es_puesto) {
        this.es_puesto = es_puesto;
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getCo_grupo() {
        return co_grupo;
    }

    public void setCo_grupo(String co_grupo) {
        this.co_grupo = co_grupo;
    }
    
    
}
