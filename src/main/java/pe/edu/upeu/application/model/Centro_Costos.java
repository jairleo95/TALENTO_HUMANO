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
    public class Centro_Costos {
    private String id_centro_costo;
    private String co_centro_costo;
    private String de_centro_costo;
    private String id_departamento;
    private String us_creacion;
    private String fe_creacion;
    private String us_modif;
    private String fe_modif;
    private String ca_porcentaje;

    public Centro_Costos(String id_centro_costo, String co_centro_costo, String de_centro_costo, String id_departamento, String us_creacion, String fe_creacion, String us_modif, String fe_modif,String ca_porcentaje) {
        this.id_centro_costo = id_centro_costo;
        this.co_centro_costo = co_centro_costo;
        this.de_centro_costo = de_centro_costo;
        this.id_departamento = id_departamento;
        this.us_creacion = us_creacion;
        this.fe_creacion = fe_creacion;
        this.us_modif = us_modif;
        this.fe_modif = fe_modif;
        this.ca_porcentaje = ca_porcentaje;
    }
    public Centro_Costos() {
        this.id_centro_costo = "";
        this.co_centro_costo = "";
        this.de_centro_costo = "";
        this.id_departamento = "";
        this.us_creacion = "";
        this.fe_creacion = "";
        this.us_modif = "";
        this.fe_modif = "";
        this.ca_porcentaje = "";
    }

    public String getCa_porcentaje() {
        return ca_porcentaje;
    }

    public void setCa_porcentaje(String ca_porcentaje) {
        this.ca_porcentaje = ca_porcentaje;
    }

    public String getId_centro_costo() {
        return id_centro_costo;
    }

    public void setId_centro_costo(String id_centro_costo) {
        this.id_centro_costo = id_centro_costo;
    }

    public String getCo_centro_costo() {
        return co_centro_costo;
    }

    public void setCo_centro_costo(String co_centro_costo) {
        this.co_centro_costo = co_centro_costo;
    }

    public String getDe_centro_costo() {
        return de_centro_costo;
    }

    public void setDe_centro_costo(String de_centro_costo) {
        this.de_centro_costo = de_centro_costo;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getUs_creacion() {
        return us_creacion;
    }

    public void setUs_creacion(String us_creacion) {
        this.us_creacion = us_creacion;
    }

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }

    public String getUs_modif() {
        return us_modif;
    }

    public void setUs_modif(String us_modif) {
        this.us_modif = us_modif;
    }

    public String getFe_modif() {
        return fe_modif;
    }

    public void setFe_modif(String fe_modif) {
        this.fe_modif = fe_modif;
    }
    
}
