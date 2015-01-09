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
public class Evaluacion_Emp {

    private String id_evaluacion_emp;
    private String es_evaluacion;
    private String re_evaluacion;
    private String id_empleado;

    public Evaluacion_Emp(String id_evaluacion_emp, String es_evaluacion, String re_evaluacion, String id_empleado) {
        this.id_evaluacion_emp = id_evaluacion_emp;
        this.es_evaluacion = es_evaluacion;
        this.re_evaluacion = re_evaluacion;
        this.id_empleado = id_empleado;
    }

    public Evaluacion_Emp() {
        this.id_evaluacion_emp = id_evaluacion_emp;
        this.es_evaluacion = es_evaluacion;
        this.re_evaluacion = re_evaluacion;
        this.id_empleado = id_empleado;
    }

    public String getId_evaluacion_emp() {
        return id_evaluacion_emp;
    }

    public void setId_evaluacion_emp(String id_evaluacion_emp) {
        this.id_evaluacion_emp = id_evaluacion_emp;
    }

    public String getEs_evaluacion() {
        return es_evaluacion;
    }

    public void setEs_evaluacion(String es_evaluacion) {
        this.es_evaluacion = es_evaluacion;
    }

    public String getRe_evaluacion() {
        return re_evaluacion;
    }

    public void setRe_evaluacion(String re_evaluacion) {
        this.re_evaluacion = re_evaluacion;
    }

    public String getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(String id_empleado) {
        this.id_empleado = id_empleado;
    }

}
