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
public class X_List_Anno_Id_Tr_DGP {
    private String id_anno;
    private String no_anno;
    private String id_dgp;
    private String id_trabajador;

    public X_List_Anno_Id_Tr_DGP(String id_anno, String no_anno, String id_dgp, String id_trabajador) {
        this.id_anno = id_anno;
        this.no_anno = no_anno;
        this.id_dgp = id_dgp;
        this.id_trabajador = id_trabajador;
    }

    public X_List_Anno_Id_Tr_DGP() {
        this.id_anno = "";
        this.no_anno = "";
        this.id_dgp = "";
        this.id_trabajador = "";
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

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }

    public String getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(String id_trabajador) {
        this.id_trabajador = id_trabajador;
    }
     
}
