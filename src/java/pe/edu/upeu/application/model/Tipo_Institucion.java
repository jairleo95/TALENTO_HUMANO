/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.model;

/**
 *
 * @author Alex
 */
public class Tipo_Institucion {
    private String id_tipo_institucion;
    private String no_tipo_institucion;
    private String co_regimen;
    private String de_regimen;
    private String co_ti_institucion;

    public Tipo_Institucion(String id_tipo_institucion, String no_tipo_institucion, String co_regimen, String de_regimen, String co_ti_institucion) {
        this.id_tipo_institucion = id_tipo_institucion;
        this.no_tipo_institucion = no_tipo_institucion;
        this.co_regimen = co_regimen;
        this.de_regimen = de_regimen;
        this.co_ti_institucion = co_ti_institucion;
    }

    public Tipo_Institucion() {
        this.id_tipo_institucion = "";
        this.no_tipo_institucion = "";
        this.co_regimen = "";
        this.de_regimen = "";
        this.co_ti_institucion = "";
    }
    

    public String getId_tipo_institucion() {
        return id_tipo_institucion;
    }

    public void setId_tipo_institucion(String id_tipo_institucion) {
        this.id_tipo_institucion = id_tipo_institucion;
    }

    public String getNo_tipo_institucion() {
        return no_tipo_institucion;
    }

    public void setNo_tipo_institucion(String no_tipo_institucion) {
        this.no_tipo_institucion = no_tipo_institucion;
    }

    public String getCo_regimen() {
        return co_regimen;
    }

    public void setCo_regimen(String co_regimen) {
        this.co_regimen = co_regimen;
    }

    public String getDe_regimen() {
        return de_regimen;
    }

    public void setDe_regimen(String de_regimen) {
        this.de_regimen = de_regimen;
    }

    public String getCo_ti_institucion() {
        return co_ti_institucion;
    }

    public void setCo_ti_institucion(String co_ti_institucion) {
        this.co_ti_institucion = co_ti_institucion;
    }

    
}
