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
public class Universidad {

    private String id_universidad;
    private String no_universidad;
    private String co_universidad;
    private String id_tipo_institucion;

    public Universidad(String id_universidad, String no_universidad, String co_universidad, String id_tipo_institucion) {
        this.id_universidad = id_universidad;
        this.no_universidad = no_universidad;
        this.co_universidad = co_universidad;
        this.id_tipo_institucion = id_tipo_institucion;
    }

    public Universidad() {
        this.id_universidad = "";
        this.no_universidad = "";
        this.co_universidad = "";
        this.id_tipo_institucion = "";
    }

    public String getId_universidad() {
        return id_universidad;
    }

    public void setId_universidad(String id_universidad) {
        this.id_universidad = id_universidad;
    }

    public String getNo_universidad() {
        return no_universidad;
    }

    public void setNo_universidad(String no_universidad) {
        this.no_universidad = no_universidad;
    }

    public String getCo_universidad() {
        return co_universidad;
    }

    public void setCo_universidad(String co_universidad) {
        this.co_universidad = co_universidad;
    }

    public String getId_tipo_institucion() {
        return id_tipo_institucion;
    }

    public void setId_tipo_institucion(String id_tipo_institucion) {
        this.id_tipo_institucion = id_tipo_institucion;
    }
    

}
