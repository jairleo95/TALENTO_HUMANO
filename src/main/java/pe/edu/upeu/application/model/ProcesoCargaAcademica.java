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
public class ProcesoCargaAcademica {

    private String idProcesoCargaAc;
    private String esProcesoCargaAc;
    private TipoHoraPago idTipoHoraPago;
    private Double caTotalHl;
    private String feDesde;
    private String feHasta;
    private String esProcesado;
    private String usCreacion;
    private String feCreacion;
    private String usModif;
    private String feModif;
    private String ipUsuario;
    private String noUsuairo;
    private DGP idDgp;

    public String getIdProcesoCargaAc() {
        return idProcesoCargaAc;
    }

    public void setIdProcesoCargaAc(String idProcesoCargaAc) {
        this.idProcesoCargaAc = idProcesoCargaAc;
    }

    public String getEsProcesoCargaAc() {
        return esProcesoCargaAc;
    }

    public void setEsProcesoCargaAc(String esProcesoCargaAc) {
        this.esProcesoCargaAc = esProcesoCargaAc;
    }

    public TipoHoraPago getIdTipoHoraPago() {
        return idTipoHoraPago;
    }

    public void setIdTipoHoraPago(TipoHoraPago idTipoHoraPago) {
        this.idTipoHoraPago = idTipoHoraPago;
    }

    public Double getCaTotalHl() {
        return caTotalHl;
    }

    public void setCaTotalHl(Double caTotalHl) {
        this.caTotalHl = caTotalHl;
    }

    public String getFeDesde() {
        return feDesde;
    }

    public void setFeDesde(String feDesde) {
        this.feDesde = feDesde;
    }

    public String getFeHasta() {
        return feHasta;
    }

    public void setFeHasta(String feHasta) {
        this.feHasta = feHasta;
    }

    public String getEsProcesado() {
        return esProcesado;
    }

    public void setEsProcesado(String esProcesado) {
        this.esProcesado = esProcesado;
    }

    public String getUsCreacion() {
        return usCreacion;
    }

    public void setUsCreacion(String usCreacion) {
        this.usCreacion = usCreacion;
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

    public String getNoUsuairo() {
        return noUsuairo;
    }

    public void setNoUsuairo(String noUsuairo) {
        this.noUsuairo = noUsuairo;
    }

    public DGP getIdDgp() {
        return idDgp;
    }

    public void setIdDgp(DGP idDgp) {
        this.idDgp = idDgp;
    }

    public ProcesoCargaAcademica() {
        idTipoHoraPago = new TipoHoraPago();
        idDgp = new DGP();

        this.idProcesoCargaAc = "";
        this.esProcesoCargaAc = "";
        this.caTotalHl = 0.0;
        this.feDesde = "";
        this.feHasta = "";
        this.esProcesado = "";
        this.usCreacion = "";
        this.feCreacion = "";
        this.usModif = "";
        this.feModif = "";
        this.ipUsuario = "";
        this.noUsuairo = "";
    }

    public ProcesoCargaAcademica(String idProcesoCargaAc, String esProcesoCargaAc, TipoHoraPago idTipoHoraPago, Double caTotalHl, String feDesde, String feHasta, String esProcesado, String usCreacion, String feCreacion, String usModif, String feModif, String ipUsuario, String noUsuairo, DGP idDgp) {
        this.idProcesoCargaAc = idProcesoCargaAc;
        this.esProcesoCargaAc = esProcesoCargaAc;
        this.idTipoHoraPago = idTipoHoraPago;
        this.caTotalHl = caTotalHl;
        this.feDesde = feDesde;
        this.feHasta = feHasta;
        this.esProcesado = esProcesado;
        this.usCreacion = usCreacion;
        this.feCreacion = feCreacion;
        this.usModif = usModif;
        this.feModif = feModif;
        this.ipUsuario = ipUsuario;
        this.noUsuairo = noUsuairo;
        this.idDgp = idDgp;
    }

}
