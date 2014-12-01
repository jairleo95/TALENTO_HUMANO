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
public class V_Var_Usuario {
    String id_usuario;
    String no_usuario;
    String pw_usuario;
    String id_trabajador;
    String no_trabajador;
    String ap_paterno;
    String ap_materno;
    String no_rol;
    String id_rol;
    String no_puesto;
    String id_puesto;
    String no_seccion;
    String id_seccion;
    String no_area;
    String id_area;
    String no_dep;
    String id_departamento;
    String es_usuario;

    public V_Var_Usuario(String id_usuario, String no_usuario, String pw_usuario, String id_trabajador, String no_trabajador, String ap_paterno, String ap_materno, String no_rol, String id_rol, String no_puesto, String id_puesto, String no_seccion, String id_seccion, String no_area, String id_area, String no_dep, String id_departamento, String es_usuario) {
        this.id_usuario = id_usuario;
        this.no_usuario = no_usuario;
        this.pw_usuario = pw_usuario;
        this.id_trabajador = id_trabajador;
        this.no_trabajador = no_trabajador;
        this.ap_paterno = ap_paterno;
        this.ap_materno = ap_materno;
        this.no_rol = no_rol;
        this.id_rol = id_rol;
        this.no_puesto = no_puesto;
        this.id_puesto = id_puesto;
        this.no_seccion = no_seccion;
        this.id_seccion = id_seccion;
        this.no_area = no_area;
        this.id_area = id_area;
        this.no_dep = no_dep;
        this.id_departamento = id_departamento;
        this.es_usuario = es_usuario;
    }
    public V_Var_Usuario() {
        this.id_usuario = "";
        this.no_usuario = "";
        this.pw_usuario = "";
        this.id_trabajador = "";
        this.no_trabajador = "";
        this.ap_paterno = "";
        this.ap_materno = "";
        this.no_rol = "";
        this.id_rol = "";
        this.no_puesto = "";
        this.id_puesto = "";
        this.no_seccion = "";
        this.id_seccion = "";
        this.no_area = "";
        this.id_area = "";
        this.no_dep = "";
        this.id_departamento = "";
        this.es_usuario = "";
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
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

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
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

    public String getNo_rol() {
        return no_rol;
    }

    public void setNo_rol(String no_rol) {
        this.no_rol = no_rol;
    }

    public String getId_rol() {
        return id_rol;
    }

    public void setId_rol(String id_rol) {
        this.id_rol = id_rol;
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

    public void setId_puesto(String is_puesto) {
        this.id_puesto = is_puesto;
    }

    public String getNo_seccion() {
        return no_seccion;
    }

    public void setNo_seccion(String no_seccion) {
        this.no_seccion = no_seccion;
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
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
    
    public String getEs_usuario() {
        return es_usuario;
    }

    public void setEs_usuario(String es_usuario) {
        this.es_usuario = es_usuario;
    }
}
