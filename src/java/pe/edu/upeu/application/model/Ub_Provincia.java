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
public class Ub_Provincia {

    private String id_provincia;
    private String no_provincia;
    private String id_departamento;
    private String co_provincia;

    public Ub_Provincia(String id_provincia, String no_provincia, String id_departamento, String co_provincia) {
        this.id_provincia = id_provincia;
        this.no_provincia = no_provincia;
        this.id_departamento = id_departamento;
        this.co_provincia = co_provincia;
    }

    public Ub_Provincia() {
        this.id_provincia = "";
        this.no_provincia = "";
        this.id_departamento = "";
        this.co_provincia = "";
    }

    public String getId_provincia() {
        return id_provincia;
    }

    public void setId_provincia(String id_provincia) {
        this.id_provincia = id_provincia;
    }

    public String getNo_provincia() {
        return no_provincia;
    }

    public void setNo_provincia(String no_provincia) {
        this.no_provincia = no_provincia;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getCo_provincia() {
        return co_provincia;
    }

    public void setCo_provincia(String co_provincia) {
        this.co_provincia = co_provincia;
    }

  
    
}
