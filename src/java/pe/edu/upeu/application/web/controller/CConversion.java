/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.web.controller;

/**
 *
 * @author Admin
 */
public class CConversion {
     public String convertFecha(String fecha) {
        String f[] = fecha.split("-");
        return f[2] + "/" + f[1] + "/" + f[0];
    }
     public String convertFecha2(String fecha){
         String f[]=fecha.split("/");
         return f[0]+"-"+f[1]+"-"+f[2];
     }

}
