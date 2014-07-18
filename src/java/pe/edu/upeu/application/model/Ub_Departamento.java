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
public class Ub_Departamento {

    private String id_departamento;
    private String no_departamento;

    public Ub_Departamento(String id_departamento, String no_departamento) {
        this.id_departamento = id_departamento;
        this.no_departamento = no_departamento;
    }

    public Ub_Departamento() {
        this.id_departamento = "";
        this.no_departamento = "";
    }

    public String getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(String id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getNo_departamento() {
        return no_departamento;
    }

    public void setNo_departamento(String no_departamento) {
        this.no_departamento = no_departamento;
    }

}
