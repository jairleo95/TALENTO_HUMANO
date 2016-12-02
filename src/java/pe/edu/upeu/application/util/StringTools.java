/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.util;

/**
 *
 * @author Andres
 */
public class StringTools {
    public static String getString(String s){
        if (s!=null) {
            if (!s.equals("")) {
                return s.trim();
            }
        }
        return null;
    }
}
