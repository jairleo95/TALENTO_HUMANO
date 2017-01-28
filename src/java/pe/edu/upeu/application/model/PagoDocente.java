/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author JAIR
 */
public class PagoDocente {

    private String idPagoDocente;
    private Integer nuCuota;
    private Double caCuota;
    private String fePago;
    private String esPagoDocente;
    private String idProcesoCargaAc;
    private String feCreacion;
    private String usModif;
    private String feModif;
    private String ipUsuario;
    private String noUsuario;

    public PagoDocente(String idPagoDocente, Integer nuCuota, Double caCuota, String fePago, String esPagoDocente, 
            String idProcesoCargaAc, String feCreacion, String usModif, String feModif, String ipUsuario, String noUsuario) {
        this.idPagoDocente = idPagoDocente;
        this.nuCuota = nuCuota;
        this.caCuota = caCuota;
        this.fePago = fePago;
        this.esPagoDocente = esPagoDocente;
        this.idProcesoCargaAc = idProcesoCargaAc;
        this.feCreacion = feCreacion;
        this.usModif = usModif;
        this.feModif = feModif;
        this.ipUsuario = ipUsuario;
        this.noUsuario = noUsuario;
    }

    public PagoDocente() {
        this.idPagoDocente = "";
        this.nuCuota = 0;
        this.caCuota = 0.0;
        this.fePago = "";
        this.esPagoDocente = "";
        this.idProcesoCargaAc = "";
        this.feCreacion = "";
        this.usModif = "";
        this.feModif = "";
        this.ipUsuario = "";
        this.noUsuario = "";
    }

    public String getIdPagoDocente() {
        return idPagoDocente;
    }

    public void setIdPagoDocente(String idPagoDocente) {
        this.idPagoDocente = idPagoDocente;
    }

    public Integer getNuCuota() {
        return nuCuota;
    }

    public void setNuCuota(Integer nuCuota) {
        this.nuCuota = nuCuota;
    }

    public Double getCaCuota() {
        return caCuota;
    }

    public void setCaCuota(Double caCuota) {
        this.caCuota = caCuota;
    }

    public String getFePago() {
        return fePago;
    }

    public void setFePago(String fePago) {
        this.fePago = fePago;
    }

    public String getEsPagoDocente() {
        return esPagoDocente;
    }

    public void setEsPagoDocente(String esPagoDocente) {
        this.esPagoDocente = esPagoDocente;
    }

    public String getIdProcesoCargaAc() {
        return idProcesoCargaAc;
    }

    public void setIdProcesoCargaAc(String idProcesoCargaAc) {
        this.idProcesoCargaAc = idProcesoCargaAc;
    }

    public String getFeCreacion() {
        return feCreacion;
    }

    public void setFeCreacion(String feCreacion) {
        this.feCreacion = feCreacion;
    }

    public String getUsModif() {
        return usModif;
    }

    public void setUsModif(String usModif) {
        this.usModif = usModif;
    }

    public String getFeModif() {
        return feModif;
    }

    public void setFeModif(String feModif) {
        this.feModif = feModif;
    }

    public String getIpUsuario() {
        return ipUsuario;
    }

    public void setIpUsuario(String ipUsuario) {
        this.ipUsuario = ipUsuario;
    }

    public String getNoUsuario() {
        return noUsuario;
    }

    public void setNoUsuario(String noUsuario) {
        this.noUsuario = noUsuario;
    }

}
