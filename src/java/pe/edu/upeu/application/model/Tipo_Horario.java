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
public class Tipo_Horario {

    private String id_tipo_horario;
    private String no_horario;
    private String de_horario;
    private String es_horario;
    private Double ca_horas;
    private String ca_formato;

    public Tipo_Horario(String id_tipo_horario, String no_horario, String de_horario, String es_horario, Double ca_horas, String ca_formato) {
        this.id_tipo_horario = id_tipo_horario;
        this.no_horario = no_horario;
        this.de_horario = de_horario;
        this.es_horario = es_horario;
        this.ca_horas = ca_horas;
        this.ca_formato = ca_formato;
    }

    public Tipo_Horario() {
        this.id_tipo_horario = "";
        this.no_horario = "";
        this.de_horario = "";
        this.es_horario = "";
        this.ca_horas = 0.0;
        this.ca_formato = "";
    }

    public String getId_tipo_horario() {
        return id_tipo_horario;
    }

    public void setId_tipo_horario(String id_tipo_horario) {
        this.id_tipo_horario = id_tipo_horario;
    }

    public String getNo_horario() {
        return no_horario;
    }

    public void setNo_horario(String no_horario) {
        this.no_horario = no_horario;
    }

    public String getDe_horario() {
        return de_horario;
    }

    public void setDe_horario(String de_horario) {
        this.de_horario = de_horario;
    }

    public String getEs_horario() {
        return es_horario;
    }

    public void setEs_horario(String es_horario) {
        this.es_horario = es_horario;
    }

    public Double getCa_horas() {
        return ca_horas;
    }

    public void setCa_horas(Double ca_horas) {
        this.ca_horas = ca_horas;
    }

    public String getCa_formato() {
        return ca_formato;
    }

    public void setCa_formato(String ca_formato) {
        this.ca_formato = ca_formato;
    }

}
