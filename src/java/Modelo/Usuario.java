/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Alfa.sistemas
 */
public class Usuario {

    private String id_usuario;
    private String no_usuario;
    private String pw_usuario;
        private String id_empleado;
    private String id_rol;

    public Usuario(String id_usuario, String no_usuario, String pw_usuario, String id_empleado, String id_rol) {
        this.id_usuario = id_usuario;
        this.no_usuario = no_usuario;
        this.pw_usuario = pw_usuario;
        this.id_empleado = id_empleado;
        this.id_rol = id_rol;
    }

    public Usuario() {
        this.id_usuario = "";
        this.no_usuario = "";
        this.pw_usuario = "";
        this.id_empleado = "";
        this.id_rol = "";
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

    public String getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(String id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getId_rol() {
        return id_rol;
    }

    public void setId_rol(String id_rol) {
        this.id_rol = id_rol;
    }

}
