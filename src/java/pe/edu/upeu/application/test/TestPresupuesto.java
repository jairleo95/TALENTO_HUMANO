/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.test;

import pe.edu.upeu.application.dao.PresupuestoDAO;

/**
 *
 * @author Leandro Burgos
 */
public class TestPresupuesto {

    /**
     * @param args the command line arguments
     */
    static PresupuestoDAO pD = new PresupuestoDAO();

    public static void main(String[] args) {
        PresupuestoActual("ARE-0006");
    }

    public static void PresupuestoActual(String idArea) {
        try {
            System.out.println(pD.pActual(idArea));
        } catch (Exception e) {
            System.out.println("Error : " + e);
        }

    }

}
