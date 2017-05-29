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
public class Modulo {
    private String id_Modulo;
    private String no_modulo;
    private String de_Modulo;
    private String es_Modulo;
    private String ic_Modulo;

    public Modulo(String id_Modulo, String no_modulo, String de_Modulo, String es_Modulo, String ic_Modulo) {
        this.id_Modulo = id_Modulo;
        this.no_modulo = no_modulo;
        this.de_Modulo = de_Modulo;
        this.es_Modulo = es_Modulo;
        this.ic_Modulo = ic_Modulo;
    }
    public Modulo() {
        this.id_Modulo = "";
        this.no_modulo = "";
        this.de_Modulo = "";
        this.es_Modulo = "";
        this.es_Modulo = "";
        this.ic_Modulo = "";
    }

    public String getId_Modulo() {
        return id_Modulo;
    }

    public void setId_Modulo(String id_Modulo) {
        this.id_Modulo = id_Modulo;
    }

    public String getNo_modulo() {
        return no_modulo;
    }

    public void setNo_modulo(String no_modulo) {
        this.no_modulo = no_modulo;
    }

    public String getDe_Modulo() {
        return de_Modulo;
    }

    public void setDe_Modulo(String de_Modulo) {
        this.de_Modulo = de_Modulo;
    }

    public String getEs_Modulo() {
        return es_Modulo;
    }

    public void setEs_Modulo(String es_Modulo) {
        this.es_Modulo = es_Modulo;
    }

    public String getIc_Modulo() {
        return ic_Modulo;
    }

    public void setIc_Modulo(String ic_Modulo) {
        this.ic_Modulo = ic_Modulo;
    }
    
}
