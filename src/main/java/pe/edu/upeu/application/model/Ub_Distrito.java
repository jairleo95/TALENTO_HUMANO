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
public class Ub_Distrito {

    private String id_distrito;
    private String no_distrito;
    private String id_provincia;

    public Ub_Distrito(String id_distrito, String no_distrito, String id_provincia) {
        this.id_distrito = id_distrito;
        this.no_distrito = no_distrito;
        this.id_provincia = id_provincia;
    }

    public Ub_Distrito() {
        this.id_distrito = "";
        this.no_distrito = "";
        this.id_provincia = "";
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

    public String getId_provincia() {
        return id_provincia;
    }

    public void setId_provincia(String id_provincia) {
        this.id_provincia = id_provincia;
    }
    
}
