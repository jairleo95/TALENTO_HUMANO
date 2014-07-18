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
public class Plantilla_Puesto {

    private String id_plantilla_puesto;
    private String id_plantilla_contractual;
    private String id_direccion;
    private String id_departamento;
    private String id_area;
    private String id_seccion;
    private String id_puesto;
    private String es_plantilla_puesto;
    private String us_creacion;
    private String fe_creacion;
    private String us_modificacion;
    private String fe_modificacion;

    public Plantilla_Puesto(String id_plantilla_puesto, String id_plantilla_contractual, String id_direccion, String id_departamento, String id_area, String id_seccion, String id_puesto, String es_plantilla_puesto, String us_creacion, String fe_creacion, String us_modificacion, String fe_modificacion) {
        this.id_plantilla_puesto = id_plantilla_puesto;
        this.id_plantilla_contractual = id_plantilla_contractual;
        this.id_direccion = id_direccion;
        this.id_departamento = id_departamento;
        this.id_area = id_area;
        this.id_seccion = id_seccion;
        this.id_puesto = id_puesto;
        this.es_plantilla_puesto = es_plantilla_puesto;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modificacion = us_modificacion;
        this.fe_modificacion = fe_modificacion;
    }

    public Plantilla_Puesto() {
        this.id_plantilla_puesto = "";
        this.id_plantilla_contractual = "";
        this.id_direccion = "";
        this.id_departamento = "";
        this.id_area = "";
        this.id_seccion = "";
        this.id_puesto = "";
        this.es_plantilla_puesto = "";
        this.us_creacion = "";
        this.fe_creacion = "";
        this.us_modificacion = "";
        this.fe_modificacion = "";
    }

    public String getId_plantilla_puesto() {
        return id_plantilla_puesto;
    }

    public void setId_plantilla_puesto(String id_plantilla_puesto) {
        this.id_plantilla_puesto = id_plantilla_puesto;
    }

    public String getId_plantilla_contractual() {
        return id_plantilla_contractual;
    }

    public void setId_plantilla_contractual(String id_plantilla_contractual) {
        this.id_plantilla_contractual = id_plantilla_contractual;
    }

    public String getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(String id_direccion) {
        this.id_direccion = id_direccion;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getId_area() {
        return id_area;
    }

    public void setId_area(String id_area) {
        this.id_area = id_area;
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getEs_plantilla_puesto() {
        return es_plantilla_puesto;
    }

    public void setEs_plantilla_puesto(String es_plantilla_puesto) {
        this.es_plantilla_puesto = es_plantilla_puesto;
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
