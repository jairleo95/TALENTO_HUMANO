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
public class Grupo_Ocupaciones {
    private String id_grupo_ocupacion;
    private String co_grupo_ocupacion;
    private String de_grupo_ocupacion;

    public Grupo_Ocupaciones(String id_grupo_ocupacion, String co_grupo_ocupacion, String de_grupo_ocupacion) {
        this.id_grupo_ocupacion = id_grupo_ocupacion;
        this.co_grupo_ocupacion = co_grupo_ocupacion;
        this.de_grupo_ocupacion = de_grupo_ocupacion;
    }
    public Grupo_Ocupaciones() {
        this.id_grupo_ocupacion = "";
        this.co_grupo_ocupacion = "";
        this.de_grupo_ocupacion = "";
    }

    public String getId_grupo_ocupacion() {
        return id_grupo_ocupacion;
    }

    public void setId_grupo_ocupacion(String id_grupo_ocupacion) {
        this.id_grupo_ocupacion = id_grupo_ocupacion;
    }

    public String getCo_grupo_ocupacion() {
        return co_grupo_ocupacion;
    }

    public void setCo_grupo_ocupacion(String co_grupo_ocupacion) {
        this.co_grupo_ocupacion = co_grupo_ocupacion;
    }

    public String getDe_grupo_ocupacion() {
        return de_grupo_ocupacion;
    }

    public void setDe_grupo_ocupacion(String de_grupo_ocupacion) {
        this.de_grupo_ocupacion = de_grupo_ocupacion;
    }
    
}
