/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.test;

import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.util.WebServiceClient;

/**
 *
 * @author JAIR
 */
public class testingWebService {

    public static void main(String[] args) {
        
        FactoryConnectionDB.open(2);
    }
}
