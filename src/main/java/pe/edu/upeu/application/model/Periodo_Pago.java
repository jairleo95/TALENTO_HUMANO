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
public class Periodo_Pago {
    private String id_periodo_pago;
    private Double nu_cuota;
    private String fe_pagar;
    private Double ca_monto;
    private String id_dgp;
    private String es_per_pago;

    public Periodo_Pago(String id_periodo_pago, Double nu_cuenta, String fe_pagar, Double ca_monto, String id_dgp, String es_per_pago) {
        this.id_periodo_pago = id_periodo_pago;
        this.nu_cuota = nu_cuenta;
        this.fe_pagar = fe_pagar;
        this.ca_monto = ca_monto;
        this.id_dgp = id_dgp;
        this.es_per_pago = es_per_pago;
    }

    public Periodo_Pago() {
        this.id_periodo_pago = "";
        this.nu_cuota = 0.0;
        this.fe_pagar = "";
        this.ca_monto = 0.0;
        this.id_dgp = "";
        this.es_per_pago = "";
    }
    
    public String getId_periodo_pago() {
        return id_periodo_pago;
    }

    public void setId_periodo_pago(String id_periodo_pago) {
        this.id_periodo_pago = id_periodo_pago;
    }

    public Double getNu_cuenta() {
        return nu_cuota;
    }

    public void setNu_cuenta(Double nu_cuenta) {
        this.nu_cuota = nu_cuenta;
    }

    public String getFe_pagar() {
        return fe_pagar;
    }

    public void setFe_pagar(String fe_pagar) {
        this.fe_pagar = fe_pagar;
    }

    public Double getCa_monto() {
        return ca_monto;
    }

    public void setCa_monto(Double ca_monto) {
        this.ca_monto = ca_monto;
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getEs_per_pago() {
        return es_per_pago;
    }

    public void setEs_per_pago(String es_per_pago) {
        this.es_per_pago = es_per_pago;
    }
    
    
}
