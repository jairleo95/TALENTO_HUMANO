/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model;

/**
 *
 * @author ALPHA
 */
public class TipoHoraPago {

    private String idTiHoraPago;
    private String idTrabajador;
    private Double caTiHoraPago;
    private Usuario usCreacion;
    private String FeCreacion;
    private Usuario usModdif;
    private String feModdif;
    private String ipUsuario;

    public String getIdTiHoraPago() {
        return idTiHoraPago;
    }

    public void setIdTiHoraPago(String idTiHoraPago) {
        this.idTiHoraPago = idTiHoraPago;
    }

    public String getIdTrabajador() {
        return idTrabajador;
    }

    public void setIdTrabajador(String idTrabajador) {
        this.idTrabajador = idTrabajador;
    }

    public Double getCaTiHoraPago() {
        return caTiHoraPago;
    }

    public void setCaTiHoraPago(Double caTiHoraPago) {
        this.caTiHoraPago = caTiHoraPago;
    }

    public Usuario getUsCreacion() {
        return usCreacion;
    }

    public void setUsCreacion(Usuario usCreacion) {
        this.usCreacion = usCreacion;
    }

    public String getFeCreacion() {
        return FeCreacion;
    }

    public void setFeCreacion(String FeCreacion) {
        this.FeCreacion = FeCreacion;
    }

    public Usuario getUsModdif() {
        return usModdif;
    }

    public void setUsModdif(Usuario usModdif) {
        this.usModdif = usModdif;
    }

    public String getFeModdif() {
        return feModdif;
    }

    public void setFeModdif(String feModdif) {
        this.feModdif = feModdif;
    }

    public String getIpUsuario() {
        return ipUsuario;
    }

    public void setIpUsuario(String ipUsuario) {
        this.ipUsuario = ipUsuario;
    }

    public TipoHoraPago(String idTiHoraPago, String idTrabajador, Double caTiHoraPago, Usuario usCreacion, String FeCreacion, Usuario usModdif, String feModdif, String ipUsuario) {
        this.idTiHoraPago = idTiHoraPago;
        this.idTrabajador = idTrabajador;
        this.caTiHoraPago = caTiHoraPago;
        this.usCreacion = usCreacion;
        this.FeCreacion = FeCreacion;
        this.usModdif = usModdif;
        this.feModdif = feModdif;
        this.ipUsuario = ipUsuario;
    }

    public TipoHoraPago() {
        this.idTiHoraPago = "";
        this.idTrabajador = "";
        this.caTiHoraPago = 0.0;
        this.usCreacion = new Usuario();
        this.FeCreacion = "";
        this.usModdif = new Usuario();
        this.feModdif = "";
        this.ipUsuario = "";
    }

}
