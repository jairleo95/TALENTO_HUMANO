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
public class Plantilla_Contractual {

    private String id_plantilla_contractual;
    private String no_plantilla;
    private String no_archivo;
    private String us_creacion;
    private String fe_creacion;
    private String us_modificacion;
    private String fe_modificacion;
    private String es_plan_contractual;

    public Plantilla_Contractual(String id_plantilla_contractual, String no_plantilla, String no_archivo, String us_creacion, String fe_creacion, String us_modificacion, String fe_modificacion,String es_plan_contractual) {
        this.id_plantilla_contractual = id_plantilla_contractual;
        this.no_plantilla = no_plantilla;
        this.no_archivo = no_archivo;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modificacion = us_modificacion;
        this.fe_modificacion = fe_modificacion;
        this.es_plan_contractual = es_plan_contractual;
    }

    public Plantilla_Contractual() {
        this.id_plantilla_contractual = "";
        this.no_plantilla = "";
        this.no_archivo = "";
        this.us_creacion = "";
        this.fe_creacion = "";
        this.us_modificacion = "";
        this.fe_modificacion = "";
        this.es_plan_contractual = "";
    }

    public String getEs_plan_contractual() {
        return es_plan_contractual;
    }

    public void setEs_plan_contractual(String es_plan_contractual) {
        this.es_plan_contractual = es_plan_contractual;
    }

    public String getId_plantilla_contractual() {
        return id_plantilla_contractual;
    }

    public void setId_plantilla_contractual(String id_plantilla_contractual) {
        this.id_plantilla_contractual = id_plantilla_contractual;
    }

    public String getNo_plantilla() {
        return no_plantilla;
    }

    public void setNo_plantilla(String no_plantilla) {
        this.no_plantilla = no_plantilla;
    }

    public String getNo_archivo() {
        return no_archivo;
    }

    public void setNo_archivo(String no_archivo) {
        this.no_archivo = no_archivo;
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

    public String getUs_modificacion() {
        return us_modificacion;
    }

    public void setUs_modificacion(String us_modificacion) {
        this.us_modificacion = us_modificacion;
    }

    public String getFe_modificacion() {
        return fe_modificacion;
    }

    public void setFe_modificacion(String fe_modificacion) {
        this.fe_modificacion = fe_modificacion;
    }
    
}
