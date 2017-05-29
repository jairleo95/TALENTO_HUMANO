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
public class Tipo_Planilla {

    private String id_tipo_planilla;
    private String ti_planilla;

    public Tipo_Planilla(String id_tipo_planilla, String ti_planilla) {
        this.id_tipo_planilla = id_tipo_planilla;
        this.ti_planilla = ti_planilla;
    }

    public Tipo_Planilla() {
        this.id_tipo_planilla = "";
        this.ti_planilla = "";
    }

    public String getId_tipo_planilla() {
        return id_tipo_planilla;
    }

    public void setId_tipo_planilla(String id_tipo_planilla) {
        this.id_tipo_planilla = id_tipo_planilla;
    }

    public String getTi_planilla() {
        return ti_planilla;
    }

    public void setTi_planilla(String ti_planilla) {
        this.ti_planilla = ti_planilla;
    }

    
}
