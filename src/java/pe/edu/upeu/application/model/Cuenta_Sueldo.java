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
public class Cuenta_Sueldo {
    private String id_cuenta_sueldo;
    private String no_banco;
    private String nu_cuenta;
    private String nu_cuenta_banc;
    private String es_gem_nu_cuenta;
    private String no_banco_otros;
    private String id_trajador;
    private String es_cuenta_sueldo;

    public Cuenta_Sueldo(String id_cuenta_sueldo, String no_banco, String nu_cuenta, String nu_cuenta_banc, String es_gem_nu_cuenta, String no_banco_otros, String id_trajador, String es_cuenta_sueldo) {
        this.id_cuenta_sueldo = id_cuenta_sueldo;
        this.no_banco = no_banco;
        this.nu_cuenta = nu_cuenta;
        this.nu_cuenta_banc = nu_cuenta_banc;
        this.es_gem_nu_cuenta = es_gem_nu_cuenta;
        this.no_banco_otros = no_banco_otros;
        this.id_trajador = id_trajador;
        this.es_cuenta_sueldo = es_cuenta_sueldo;
    }
    
    public Cuenta_Sueldo() {
        this.id_cuenta_sueldo = "";
        this.no_banco = "";
        this.nu_cuenta = "";
        this.nu_cuenta_banc = "";
        this.es_gem_nu_cuenta = "";
        this.no_banco_otros = "";
        this.id_trajador = "";
        this.es_cuenta_sueldo = "";
    }
    
    

    public String getId_cuenta_sueldo() {
        return id_cuenta_sueldo;
    }

    public void setId_cuenta_sueldo(String id_cuenta_sueldo) {
        this.id_cuenta_sueldo = id_cuenta_sueldo;
    }

    public String getNo_banco() {
        return no_banco;
    }

    public void setNo_banco(String no_banco) {
        this.no_banco = no_banco;
    }

    public String getNu_cuenta() {
        return nu_cuenta;
    }

    public void setNu_cuenta(String nu_cuenta) {
        this.nu_cuenta = nu_cuenta;
    }

    public String getNu_cuenta_banc() {
        return nu_cuenta_banc;
    }

    public void setNu_cuenta_banc(String nu_cuenta_banc) {
        this.nu_cuenta_banc = nu_cuenta_banc;
    }

    public String getEs_gem_nu_cuenta() {
        return es_gem_nu_cuenta;
    }

    public void setEs_gem_nu_cuenta(String es_gem_nu_cuenta) {
        this.es_gem_nu_cuenta = es_gem_nu_cuenta;
    }

    public String getNo_banco_otros() {
        return no_banco_otros;
    }

    public void setNo_banco_otros(String no_banco_otros) {
        this.no_banco_otros = no_banco_otros;
    }

    public String getId_trajador() {
        return id_trajador;
    }

    public void setId_trajador(String id_trajador) {
        this.id_trajador = id_trajador;
    }

    public String getEs_cuenta_sueldo() {
        return es_cuenta_sueldo;
    }

    public void setEs_cuenta_sueldo(String es_cuenta_sueldo) {
        this.es_cuenta_sueldo = es_cuenta_sueldo;
    }
    
    
}
