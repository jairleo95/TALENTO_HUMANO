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
public class Direccion {

    private String id_direccion;
    private String no_direccion;
    private String no_corto_dir;
    private String es_direccion;
    private String id_filial;

    public Direccion(String id_direccion, String no_direccion, String no_corto_dir, String es_direccion, String id_filial) {
        this.id_direccion = id_direccion;
        this.no_direccion = no_direccion;
        this.no_corto_dir = no_corto_dir;
        this.es_direccion = es_direccion;
        this.id_filial = id_filial;
    }

    public Direccion() {
        this.id_direccion = "";
        this.no_direccion = "";
        this.no_corto_dir = "";
        this.es_direccion = "";
        this.id_filial = "";
    }

    public String getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(String id_direccion) {
        this.id_direccion = id_direccion;
    }

    public String getNo_direccion() {
        return no_direccion;
    }

    public void setNo_direccion(String no_direccion) {
        this.no_direccion = no_direccion;
    }

    public String getNo_corto_dir() {
        return no_corto_dir;
    }

    public void setNo_corto_dir(String no_corto_dir) {
        this.no_corto_dir = no_corto_dir;
    }

    public String getEs_direccion() {
        return es_direccion;
    }

    public void setEs_direccion(String es_direccion) {
        this.es_direccion = es_direccion;
    }

    public String getId_filial() {
        return id_filial;
    }

    public void setId_filial(String id_filial) {
        this.id_filial = id_filial;
    }

}
