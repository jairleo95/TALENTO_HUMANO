/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author Jair
 */
public class Tipo_Contrato {

    private String id_tipo_contrato;
    private String co_tipo_contrato;
    private String de_ti_contrato;
    private String de_abrev;

    public String getId_tipo_contrato() {
        return id_tipo_contrato;
    }

    public void setId_tipo_contrato(String id_tipo_contrato) {
        this.id_tipo_contrato = id_tipo_contrato;
    }

    public String getCo_tipo_contrato() {
        return co_tipo_contrato;
    }

    public void setCo_tipo_contrato(String co_tipo_contrato) {
        this.co_tipo_contrato = co_tipo_contrato;
    }

    public String getDe_ti_contrato() {
        return de_ti_contrato;
    }

    public void setDe_ti_contrato(String de_ti_contrato) {
        this.de_ti_contrato = de_ti_contrato;
    }

    public String getDe_abrev() {
        return de_abrev;
    }

    public void setDe_abrev(String de_abrev) {
        this.de_abrev = de_abrev;
    }

    public Tipo_Contrato(String id_tipo_contrato, String co_tipo_contrato, String de_ti_contrato, String de_abrev) {
        this.id_tipo_contrato = id_tipo_contrato;
        this.co_tipo_contrato = co_tipo_contrato;
        this.de_ti_contrato = de_ti_contrato;
        this.de_abrev = de_abrev;
    }

    public Tipo_Contrato() {
        this.id_tipo_contrato = "";
        this.co_tipo_contrato = "";
        this.de_ti_contrato = "";
        this.de_abrev = "";
    }

}
