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
public class Via {
    private String id_via;
    private String de_via;
    private String co_via;

    public Via(String id_via, String de_via, String co_via) {
        this.id_via = id_via;
        this.de_via = de_via;
        this.co_via = co_via;
    }
    public Via() {
        this.id_via = "";
        this.de_via = "";
        this.co_via = "";
    }

    public String getId_via() {
        return id_via;
    }

    public void setId_via(String id_via) {
        this.id_via = id_via;
    }

    public String getDe_via() {
        return de_via;
    }

    public void setDe_via(String de_via) {
        this.de_via = de_via;
    }

    public String getCo_via() {
        return co_via;
    }

    public void setCo_via(String co_via) {
        this.co_via = co_via;
    }
    
}
