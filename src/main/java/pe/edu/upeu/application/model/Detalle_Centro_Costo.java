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
public class Detalle_Centro_Costo {
    
    private String id_dgp;
    private String id_centro_costo;
    private String id_direccion;
    private String id_departamento;
    private String id_area;
    private Double ca_porcentaje;
    private String de_centro_costo;
    private String co_centro_costo;

    public Detalle_Centro_Costo(String id_dgp, String id_centro_costo, String id_direccion, String id_departamento, String id_area, Double ca_porcentaje, String de_centro_costo ,String co_centro_costo) {
        this.id_dgp = id_dgp;
        this.id_centro_costo = id_centro_costo;
        this.id_direccion = id_direccion;
        this.id_departamento = id_departamento;
        this.id_area = id_area;
        this.ca_porcentaje = ca_porcentaje;
        this.de_centro_costo = de_centro_costo;
        this.co_centro_costo=co_centro_costo;
    }
    
    public Detalle_Centro_Costo() {
        this.id_dgp = "";
        this.id_centro_costo = "";
        this.id_direccion = "";
        this.id_departamento = "";
        this.id_area = "";
        this.ca_porcentaje = 0.0;
        this.de_centro_costo = "";
        this.co_centro_costo="";
    }

    public String getDe_centro_costo() {
        return de_centro_costo;
    }

    public void setDe_centro_costo(String de_centro_costo) {
        this.de_centro_costo = de_centro_costo;
    }

    
    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getId_centro_costo() {
        return id_centro_costo;
    }

    public void setId_centro_costo(String id_centro_costo) {
        this.id_centro_costo = id_centro_costo;
    }

    public String getId_direccion() {
        return id_direccion;
    }

    public void setId_direccion(String id_direccion) {
        this.id_direccion = id_direccion;
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

    public Double getCa_porcentaje() {
        return ca_porcentaje;
    }

    public void setCa_porcentaje(Double ca_porcentaje) {
        this.ca_porcentaje = ca_porcentaje;
    }

    public String getCo_centro_costo() {
        return co_centro_costo;
    }

    public void setCo_centro_costo(String co_centro_costo) {
        this.co_centro_costo = co_centro_costo;
    }
    
    
}
