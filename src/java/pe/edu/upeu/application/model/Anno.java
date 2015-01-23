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
public class Anno {

    private String id_anno;
    private String no_anno;
    private String de_anno;
    private String fe_desde;
    private String fe_hasta;
    private String de_observacion;
    private String id_contrato;

    public Anno(String id_anno, String no_anno, String de_anno, String fe_desde, String fe_hasta, String de_observacion, String id_contrato) {
        this.id_anno = id_anno;
        this.no_anno = no_anno;
        this.de_anno = de_anno;
        this.fe_desde = fe_desde;
        this.fe_hasta = fe_hasta;
        this.de_observacion = de_observacion;
        this.id_contrato = id_contrato;
    }

    public Anno() {
        this.id_anno = "";
        this.no_anno = "";
        this.de_anno = "";
        this.fe_desde = "";
        this.fe_hasta = "";
        this.de_observacion = "";
        this.id_contrato = "";
    }

    public String getId_anno() {
        return id_anno;
    }

    public void setId_anno(String id_anno) {
        this.id_anno = id_anno;
    }

    public String getNo_anno() {
        return no_anno;
    }

    public void setNo_anno(String no_anno) {
        this.no_anno = no_anno;
    }

    public String getDe_anno() {
        return de_anno;
    }

    public void setDe_anno(String de_anno) {
        this.de_anno = de_anno;
    }

    public String getFe_desde() {
        return fe_desde;
    }

    public void setFe_desde(String fe_desde) {
        this.fe_desde = fe_desde;
    }

    public String getFe_hasta() {
        return fe_hasta;
    }

    public void setFe_hasta(String fe_hasta) {
        this.fe_hasta = fe_hasta;
    }

    public String getDe_observacion() {
        return de_observacion;
    }

    public void setDe_observacion(String de_observacion) {
        this.de_observacion = de_observacion;
    }

    public String getId_contrato() {
        return id_contrato;
    }

    public void setId_contrato(String id_contrato) {
        this.id_contrato = id_contrato;
    }
    
    

}
