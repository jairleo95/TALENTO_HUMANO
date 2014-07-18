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
public class Pasos {

    private String id_pasos;
    private String id_proceso;
    private String de_pasos;
    private String nu_pasos;
    private String co_pasos;

    public Pasos(String id_pasos, String id_proceso, String de_pasos, String nu_pasos, String co_pasos) {
        this.id_pasos = id_pasos;
        this.id_proceso = id_proceso;
        this.de_pasos = de_pasos;
        this.nu_pasos = nu_pasos;
        this.co_pasos = co_pasos;
    }

    public Pasos() {
        this.id_pasos = "";
        this.id_proceso = "";
        this.de_pasos = "";
        this.nu_pasos = "";
        this.co_pasos = "";
    }

    public String getId_pasos() {
        return id_pasos;
    }

    public void setId_pasos(String id_pasos) {
        this.id_pasos = id_pasos;
    }

    public String getId_proceso() {
        return id_proceso;
    }

    public void setId_proceso(String id_proceso) {
        this.id_proceso = id_proceso;
    }

    public String getDe_pasos() {
        return de_pasos;
    }

    public void setDe_pasos(String de_pasos) {
        this.de_pasos = de_pasos;
    }

    public String getNu_pasos() {
        return nu_pasos;
    }

    public void setNu_pasos(String nu_pasos) {
        this.nu_pasos = nu_pasos;
    }

    public String getCo_pasos() {
        return co_pasos;
    }

    public void setCo_pasos(String co_pasos) {
        this.co_pasos = co_pasos;
    }
    
    
}
