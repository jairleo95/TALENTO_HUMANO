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

    public Empleado(String id_empleado, String es_empleado, String id_trabajador) {
        this.id_empleado = id_empleado;
        this.es_empleado = es_empleado;
        this.id_trabajador = id_trabajador;
    }

    public Empleado() {
        this.id_empleado = "";
        this.es_empleado = "";
        this.id_trabajador = "";
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
