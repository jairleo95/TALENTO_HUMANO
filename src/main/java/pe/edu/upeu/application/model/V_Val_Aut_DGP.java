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
public class V_Val_Aut_DGP {

    private String nu_pasos;
    private String id_detalle_req_proceso;
    private String id_dgp;

    public V_Val_Aut_DGP(String nu_pasos, String id_detalle_req_proceso, String id_dgp) {
        this.nu_pasos = nu_pasos;
        this.id_detalle_req_proceso = id_detalle_req_proceso;
        this.id_dgp = id_dgp;
    }

    public V_Val_Aut_DGP() {
        this.nu_pasos = "";
        this.id_detalle_req_proceso = "";
        this.id_dgp = "";
    }

    public String getNu_pasos() {
        return nu_pasos;
    }

    public void setNu_pasos(String nu_pasos) {
        this.nu_pasos = nu_pasos;
    }

    public String getId_detalle_req_proceso() {
        return id_detalle_req_proceso;
    }

    public void setId_detalle_req_proceso(String id_detalle_req_proceso) {
        this.id_detalle_req_proceso = id_detalle_req_proceso;
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }
    

    
}
