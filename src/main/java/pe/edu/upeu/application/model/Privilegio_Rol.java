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
public class Privilegio_Rol {
    String no_link;
    String es_detalle_privilegio;
    String id_detalle_privilegio;

    public Privilegio_Rol(String no_link, String es_detalle_privilegio, String id_detalle_privilegio) {
        this.no_link = no_link;
        this.es_detalle_privilegio = es_detalle_privilegio;
        this.id_detalle_privilegio = id_detalle_privilegio;
    }
    public Privilegio_Rol() {
        this.no_link = "";
        this.es_detalle_privilegio = "";
        this.id_detalle_privilegio = "";
    }

    public String getNo_link() {
        return no_link;
    }

    public void setNo_link(String no_link) {
        this.no_link = no_link;
    }

    public String getEs_detalle_privilegio() {
        return es_detalle_privilegio;
    }

    public void setEs_detalle_privilegio(String es_detalle_privilegio) {
        this.es_detalle_privilegio = es_detalle_privilegio;
    }

    public String getId_detalle_privilegio() {
        return id_detalle_privilegio;
    }

    public void setId_detalle_privilegio(String id_detalle_privilegio) {
        this.id_detalle_privilegio = id_detalle_privilegio;
    }
    
}
