
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
public class V_Usuario {

    private String id_trabajador;
    private String id_usuario;
    private String id_rol;
    private String id_empleado;
    private String no_usuario;
    private String pw_usuario;
    private String no_puesto;
    private String id_puesto;
    private String no_area;
    private String id_area;
    private String no_dep;
    private String id_departamento;
    private String no_direccion;
    private String id_direccion;
    private String id_seccion;
    private String no_seccion;
    private String no_trabajador;
    private String ap_paterno;
    private String ap_materno;
    private String fe_creacion;

    public V_Usuario(String id_trabajador, String id_usuario, String id_rol, String id_empleado, String no_usuario, String pw_usuario, String no_puesto, String id_puesto, String no_area, String id_area, String no_dep, String id_departamento, String no_direccion, String id_direccion, String id_seccion, String no_seccion, String no_trabajador, String ap_paterno, String ap_materno, String fe_creacion) {
        this.id_trabajador = id_trabajador;
        this.id_usuario = id_usuario;
        this.id_rol = id_rol;
        this.id_empleado = id_empleado;
        this.no_usuario = no_usuario;
        this.pw_usuario = pw_usuario;
        this.no_puesto = no_puesto;
        this.id_puesto = id_puesto;
        this.no_area = no_area;
        this.id_area = id_area;
        this.no_dep = no_dep;
        this.id_departamento = id_departamento;
        this.no_direccion = no_direccion;
        this.id_direccion = id_direccion;
        this.id_seccion = id_seccion;
        this.no_seccion = no_seccion;
        this.no_trabajador = no_trabajador;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.fe_creacion = fe_creacion;
    }
    
    public V_Usuario() {
        this.id_trabajador = "";
        this.id_usuario = "";
        this.id_rol = "";
        this.id_empleado = "";
        this.no_usuario = "";
        this.pw_usuario = "";
        this.no_puesto = "";
        this.id_puesto = "";
        this.no_area = "";
        this.id_area = "";
        this.no_dep = "";
        this.id_departamento = "";
        this.no_direccion = "";
        this.id_direccion = "";
        this.id_seccion = "";
        this.no_seccion = "";
        this.no_trabajador = "";
        this.ap_paterno = "";
        this.ap_materno = "";
        this.fe_creacion = "";
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getId_rol() {
        return id_rol;
    }

    public void setId_rol(String id_rol) {
        this.id_rol = id_rol;
    }

    public String getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(String id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getNo_usuario() {
        return no_usuario;
    }

    public void setNo_usuario(String no_usuario) {
        this.no_usuario = no_usuario;
    }

    public String getPw_usuario() {
        return pw_usuario;
    }

    public void setPw_usuario(String pw_usuario) {
        this.pw_usuario = pw_usuario;
    }

    public String getNo_puesto() {
        return no_puesto;
    }

    public void setNo_puesto(String no_puesto) {
        this.no_puesto = no_puesto;
    }

    public String getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(String id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getNo_area() {
        return no_area;
    }

    public void setNo_area(String no_area) {
        this.no_area = no_area;
    }

    public String getId_area() {
        return id_area;
    }

    public void setId_area(String id_area) {
        this.id_area = id_area;
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

    public String getNo_direccion() {
        return no_direccion;
    }

    public void setNo_direccion(String no_direccion) {
        this.no_direccion = no_direccion;
    }

    public String getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(String id_direccion) {
        this.id_direccion = id_direccion;
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getNo_seccion() {
        return no_seccion;
    }

    public void setNo_seccion(String no_seccion) {
        this.no_seccion = no_seccion;
    }

    public String getNo_trabajador() {
        return no_trabajador;
    }

    public void setNo_trabajador(String no_trabajador) {
        this.no_trabajador = no_trabajador;
    }

    public String getAp_paterno() {
        return ap_paterno;
    }

    public void setAp_paterno(String ap_paterno) {
        this.ap_paterno = ap_paterno;
    }

    public String getAp_materno() {
        return ap_materno;
    }

    public void setAp_materno(String ap_materno) {
        this.ap_materno = ap_materno;
    }

    public String getFe_creacion() {
        return fe_creacion;
    }

    public void setFe_creacion(String fe_creacion) {
        this.fe_creacion = fe_creacion;
    }
    
}
