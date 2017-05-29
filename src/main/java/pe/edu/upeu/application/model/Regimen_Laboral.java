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
public class Regimen_Laboral {
    private String id_regimen_laboral;
    private String co_regimen_l;
    private String de_regimen_l;

    public Regimen_Laboral(String id_regimen_laboral, String co_regimen_l, String de_regimen_l) {
        this.id_regimen_laboral = id_regimen_laboral;
        this.co_regimen_l = co_regimen_l;
        this.de_regimen_l = de_regimen_l;
    }
    public Regimen_Laboral() {
        this.id_regimen_laboral = "";
        this.co_regimen_l = "";
        this.de_regimen_l = "";
    }

    public String getId_regimen_laboral() {
        return id_regimen_laboral;
    }

    public void setId_regimen_laboral(String id_regimen_laboral) {
        this.id_regimen_laboral = id_regimen_laboral;
    }

    public String getCo_regimen_l() {
        return co_regimen_l;
    }

    public void setCo_regimen_l(String co_regimen_l) {
        this.co_regimen_l = co_regimen_l;
    }

    public String getDe_regimen_l() {
        return de_regimen_l;
    }

    public void setDe_regimen_l(String de_regimen_l) {
        this.de_regimen_l = de_regimen_l;
    }
    
}
