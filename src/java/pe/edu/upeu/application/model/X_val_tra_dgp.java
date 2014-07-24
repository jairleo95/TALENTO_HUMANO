/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.model;

/**
 *
 * @author Jose
 */
public class X_val_tra_dgp {
    private String total;
    private String id_dgp;

    public X_val_tra_dgp(String total, String id_dgp) {
        this.total = total;
        this.id_dgp = id_dgp;
    }
    public X_val_tra_dgp() {
        this.total = "";
        this.id_dgp = "";
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getId_dgp() {
        return id_dgp;
    }

    public void setId_dgp(String id_dgp) {
        this.id_dgp = id_dgp;
    }
    
    
    
}
