/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author Alfa.sistemas
 */
public class Situacion_Educativa {

    private String id_situacion_educativa;
    private String no_s_educativa;

    public Situacion_Educativa(String id_situacion_educativa, String no_s_educativa, String es_s_educativa) {
        this.id_situacion_educativa = id_situacion_educativa;
        this.no_s_educativa = no_s_educativa;
        this.es_s_educativa = es_s_educativa;
    }

    public Situacion_Educativa() {
        this.id_situacion_educativa = "";
        this.no_s_educativa = "";
        this.es_s_educativa = "";
    }
    private String es_s_educativa;

    public String getId_situacion_educativa() {
        return id_situacion_educativa;
    }

    public void setId_situacion_educativa(String id_situacion_educativa) {
        this.id_situacion_educativa = id_situacion_educativa;
    }

    public String getNo_s_educativa() {
        return no_s_educativa;
    }

    public void setNo_s_educativa(String no_s_educativa) {
        this.no_s_educativa = no_s_educativa;
    }

    public String getEs_s_educativa() {
        return es_s_educativa;
    }

    public void setEs_s_educativa(String es_s_educativa) {
        this.es_s_educativa = es_s_educativa;
    }

}
