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
public class Proceso {

    private String id_proceso;
    private String no_proceso;
    private String de_proceso;

    public Proceso(String id_proceso, String no_proceso, String de_proceso) {
        this.id_proceso = id_proceso;
        this.no_proceso = no_proceso;
        this.de_proceso = de_proceso;
    }

    public Proceso() {
        this.id_proceso = "";
        this.no_proceso = "";
        this.de_proceso = "";
    }

    public String getId_proceso() {
        return id_proceso;
    }

    public void setId_proceso(String id_proceso) {
        this.id_proceso = id_proceso;
    }

    public String getNo_proceso() {
        return no_proceso;
    }

    public void setNo_proceso(String no_proceso) {
        this.no_proceso = no_proceso;
    }

    public String getDe_proceso() {
        return de_proceso;
    }

    public void setDe_proceso(String de_proceso) {
        this.de_proceso = de_proceso;
    }

    
}
