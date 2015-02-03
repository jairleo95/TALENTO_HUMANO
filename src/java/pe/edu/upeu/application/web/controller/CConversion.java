/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class CConversion {

    public String convertFecha(String fecha) throws ParseException {
        String f[] = fecha.split("-");
     /*   if (System.getProperty("sun.desktop").trim().equals("windows")) {
            return f[2] + "/" + f[1] + "/" + f[0];
        } else {*/

            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
            String fecha_convertida = new SimpleDateFormat("dd-MMM-yy").format(date);
            return fecha_convertida.toUpperCase();
       // }

    }

    public String convertFecha2(String fecha) {
        String f[] = fecha.split("/");
        return f[0] + "-" + f[1] + "-" + f[2];
    }

    public String convertFecha3(String fecha) {
        String f[] = fecha.split("-");
        return f[2] + "-" + f[1] + "-" + f[0];
    }
    public String convertFecha4(String fecha) {
        String f[] = fecha.split("-");
        return f[0] + "/" + f[1] + "/" + f[2];
    }

     /*public String convertFecha(String fecha) {
     String f[] = fecha.split("-");
     return "04-JUN-14";
     }

     public String convertFecha2(String fecha) {
     String f[] = fecha.split("/");
     return "04-JUN-14";
     }

     public String convertFecha3(String fecha) {
     String f[] = fecha.split("/");
     return "04-JUN-14";
     }*/
}
