/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.test;

import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.dao.Carga_AcademicaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO;
import pe.edu.upeu.application.properties.globalProperties;
import pe.edu.upeu.application.util.WebServiceClient;

/**
 *
 * @author JAIR
 */
public class testingWebService {

    public static void main(String[] args) {
        
        System.out.println(":::::test");
        InterfaceCarga_AcademicaDAO a = new Carga_AcademicaDAO();
        try {
            a.syncupCargaAcademica("2017-1", globalProperties.DOCENTESXCURSO_METHOD);
        } catch (Exception ex) {
            Logger.getLogger(testingWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
