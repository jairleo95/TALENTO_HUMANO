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
public class V_Ubigeo {

    private String id_distrito;
    private String no_distrito;
    private String no_provincia;
    private String no_departamento;

    public V_Ubigeo(String id_distrito, String no_distrito, String no_provincia, String no_departamento) {
        this.id_distrito = id_distrito;
        this.no_distrito = no_distrito;
        this.no_provincia = no_provincia;
        this.no_departamento = no_departamento;
    }

    public V_Ubigeo() {
        this.id_distrito = "";
        this.no_distrito = "";
        this.no_provincia = "";
        this.no_departamento = "";
    }

    public String getId_distrito() {
        return id_distrito;
    }

    public void setId_distrito(String id_distrito) {
        this.id_distrito = id_distrito;
    }

    public String getNo_distrito() {
        return no_distrito;
    }

    public void setNo_distrito(String no_distrito) {
        this.no_distrito = no_distrito;
    }

    public String getNo_provincia() {
        return no_provincia;
    }

    public void setNo_provincia(String no_provincia) {
        this.no_provincia = no_provincia;
    }

    public String getNo_departamento() {
        return no_departamento;
    }

    public void setNo_departamento(String no_departamento) {
        this.no_departamento = no_departamento;
    }
    
    
    
    
}
