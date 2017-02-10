/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.test;

import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.util.WSClienteAcademico;

/**
 *
 * @author JAIR
 */
public class testingWebService {

    public static void main(String[] args) {
        
        System.out.println("testing...");
        System.out.println(":::::noww");
            WSClienteAcademico a = new WSClienteAcademico();
        try {
            a.startWsAcademico("2016-1");
        } catch (Exception ex) {
            Logger.getLogger(testingWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
