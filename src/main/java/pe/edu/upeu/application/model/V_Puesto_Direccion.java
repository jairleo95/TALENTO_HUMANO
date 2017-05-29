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
public class V_Puesto_Direccion {

    private String no_direccion;
    private String id_direccion;
    private String no_dep;
    private String id_departamento;
    private String no_area;
    private String id_area;
    private String no_seccion;
    private String id_seccion;
    private String no_puesto;
    private String id_puesto;

    public V_Puesto_Direccion(String no_direccion, String id_direccion, String no_dep, String id_departamento, String no_area, String id_area, String no_seccion, String id_seccion, String no_puesto, String id_puesto) {
        this.no_direccion = no_direccion;
        this.id_direccion = id_direccion;
        this.no_dep = no_dep;
        this.id_departamento = id_departamento;
        this.no_area = no_area;
        this.id_area = id_area;
        this.no_seccion = no_seccion;
        this.id_seccion = id_seccion;
        this.no_puesto = no_puesto;
        this.id_puesto = id_puesto;
    }
    
    public V_Puesto_Direccion() {
        this.no_direccion = "";
        this.id_direccion = "";
        this.no_dep = "";
        this.id_departamento = "";
        this.no_area = "";
        this.id_area = "";
        this.no_seccion = "";
        this.id_seccion = "";
        this.no_puesto = "";
        this.id_puesto = "";
    }

    public String getNo_direccion() {
        return no_direccion;
    }

    public void setNo_direccion(String no_direccion) {
        this.no_direccion = no_direccion;
    }

    public String getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(String id_direccion) {
        this.id_direccion = id_direccion;
    }

    public String getNo_dep() {
        return no_dep;
    }

    public void setNo_dep(String no_dep) {
        this.no_dep = no_dep;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getNo_area() {
        return no_area;
    }

    public void setNo_area(String no_area) {
        this.no_area = no_area;
    }

    public String getId_area() {
        return id_area;
    }

    public void setId_area(String id_area) {
        this.id_area = id_area;
    }

    public String getNo_seccion() {
        return no_seccion;
    }

    public void setNo_seccion(String no_seccion) {
        this.no_seccion = no_seccion;
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getNo_puesto() {
        return no_puesto;
    }

    public void setNo_puesto(String no_puesto) {
        this.no_puesto = no_puesto;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }
    
    
}
