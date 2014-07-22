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
public class V_Emp_Pu_Dir_Dep {

    private String id_direccion;
    private String no_dep;
    private String id_departamento;
    private String id_area;
    private String id_seccion;
    private String id_puesto;
    private String id_empleado;
    private String id_trabajador;

    public V_Emp_Pu_Dir_Dep(String id_direccion, String no_dep, String id_departamento, String id_area, String id_seccion, String id_puesto, String id_empleado, String id_trabajador) {
        this.id_direccion = id_direccion;
        this.no_dep = no_dep;
        this.id_departamento = id_departamento;
        this.id_area = id_area;
        this.id_seccion = id_seccion;
        this.id_puesto = id_puesto;
        this.id_empleado = id_empleado;
        this.id_trabajador = id_trabajador;
    }

    public V_Emp_Pu_Dir_Dep() {
        this.id_direccion = "";
        this.no_dep = "";
        this.id_departamento = "";
        this.id_area = "";
        this.id_seccion = "";
        this.id_puesto = "";
        this.id_empleado = "";
        this.id_trabajador = "";
    }

    public String getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(String id_direccion) {
        this.id_direccion = id_direccion;
    }

    public String getNo_dep() {
        return no_dep;
    }

    public void setNo_dep(String no_dep) {
        this.no_dep = no_dep;
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getId_area() {
        return id_area;
    }

    public void setId_area(String id_area) {
        this.id_area = id_area;
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(String id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }
    
    
    
}
