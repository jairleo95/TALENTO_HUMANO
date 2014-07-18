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
public class Privilegio {

    private String id_privilegio;
    private String no_link;
    private String di_url;
    private String es_privilegio;

    public Privilegio(String id_privilegio, String no_link, String di_url, String es_privilegio) {
        this.id_privilegio = id_privilegio;
        this.no_link = no_link;
        this.di_url = di_url;
        this.es_privilegio = es_privilegio;
    }

    public Privilegio() {
        this.id_privilegio = "";
        this.no_link = "";
        this.di_url = "";
        this.es_privilegio = "";
    }

    public String getId_privilegio() {
        return id_privilegio;
    }

    public void setId_privilegio(String id_privilegio) {
        this.id_privilegio = id_privilegio;
    }

    public String getNo_link() {
        return no_link;
    }

    public void setNo_link(String no_link) {
        this.no_link = no_link;
    }

    public String getDi_url() {
        return di_url;
    }

    public void setDi_url(String di_url) {
        this.di_url = di_url;
    }

    public String getEs_privilegio() {
        return es_privilegio;
    }

    public void setEs_privilegio(String es_privilegio) {
        this.es_privilegio = es_privilegio;
    }

    
}
