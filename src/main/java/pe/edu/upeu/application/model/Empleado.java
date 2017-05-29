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
public class Empleado {

    private String id_empleado;
    private String es_empleado;
    private String id_trabajador;
    private String co_aps;
    private String co_huella_digital;

    public Empleado(String id_empleado, String es_empleado, String id_trabajador, String co_aps,String co_huella_digital) {
        this.id_empleado = id_empleado;
        this.es_empleado = es_empleado;
        this.id_trabajador = id_trabajador;
        this.co_aps = co_aps;
        this.co_huella_digital = co_huella_digital;
    }

    public Empleado() {
        this.id_empleado = "";
        this.es_empleado = "";
        this.id_trabajador = "";
        this.co_aps = "";
        this.co_huella_digital = "";
    }

    public String getCo_huella_digital() {
        return co_huella_digital;
    }

    public void setCo_huella_digital(String co_huella_digital) {
        this.co_huella_digital = co_huella_digital;
    }

    public String getCo_aps() {
        return co_aps;
    }

    public void setCo_aps(String co_aps) {
        this.co_aps = co_aps;
    }

    public String getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(String id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getEs_empleado() {
        return es_empleado;
    }

    public void setEs_empleado(String es_empleado) {
        this.es_empleado = es_empleado;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }
    
    
    
}
