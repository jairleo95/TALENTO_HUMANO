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
public class Departamento {

    private String id_departamento;
    private String no_dep;
    private String no_corto_dep;
    private String es_departamento;
    private String id_direccion;

    public Departamento(String id_departamento, String no_dep, String no_corto_dep, String es_departamento, String id_direccion) {
        this.id_departamento = id_departamento;
        this.no_dep = no_dep;
        this.no_corto_dep = no_corto_dep;
        this.es_departamento = es_departamento;
        this.id_direccion = id_direccion;
    }

    public Departamento() {
        this.id_departamento = "";
        this.no_dep = "";
        this.no_corto_dep = "";
        this.es_departamento = "";
        this.id_direccion = "";
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getNo_dep() {
        return no_dep;
    }

    public void setNo_dep(String no_dep) {
        this.no_dep = no_dep;
    }

    public String getNo_corto_dep() {
        return no_corto_dep;
    }

    public void setNo_corto_dep(String no_corto_dep) {
        this.no_corto_dep = no_corto_dep;
    }

    public String getEs_departamento() {
        return es_departamento;
    }

    public void setEs_departamento(String es_departamento) {
        this.es_departamento = es_departamento;
    }

    public String getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(String id_direccion) {
        this.id_direccion = id_direccion;
    }
    

    
}
