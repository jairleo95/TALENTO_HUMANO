/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author JAIR
 */
public class SituacionEspecial {

    private String idSituacionEspecial;
    private String deSituacionEspecial;

    public SituacionEspecial(String idSituacionEspecial, String deSituacionEspecial) {
        this.idSituacionEspecial = idSituacionEspecial;
        this.deSituacionEspecial = deSituacionEspecial;
    }

    public SituacionEspecial() {
        this.idSituacionEspecial = "";
        this.deSituacionEspecial = "";
    }

    public String getIdSituacionEspecial() {
        return idSituacionEspecial;
    }

    public void setIdSituacionEspecial(String idSituacionEspecial) {
        this.idSituacionEspecial = idSituacionEspecial;
    }

    public String getDeSituacionEspecial() {
        return deSituacionEspecial;
    }

    public void setDeSituacionEspecial(String deSituacionEspecial) {
        this.deSituacionEspecial = deSituacionEspecial;
    }

}
