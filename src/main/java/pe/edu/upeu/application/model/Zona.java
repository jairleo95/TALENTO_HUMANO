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
public class Zona {
    private String id_zona;
    private String de_zona;
    private String co_zona;

    public Zona(String id_zona, String de_zona, String co_zona) {
        this.id_zona = id_zona;
        this.de_zona = de_zona;
        this.co_zona = co_zona;
    }
    public Zona() {
        this.id_zona = "";
        this.de_zona = "";
        this.co_zona = "";
    }

    public String getId_zona() {
        return id_zona;
    }

    public void setId_zona(String id_zona) {
        this.id_zona = id_zona;
    }

    public String getDe_zona() {
        return de_zona;
    }

    public void setDe_zona(String de_zona) {
        this.de_zona = de_zona;
    }

    public String getCo_zona() {
        return co_zona;
    }

    public void setCo_zona(String co_zona) {
        this.co_zona = co_zona;
    }
    
}
