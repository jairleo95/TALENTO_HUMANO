/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class DateFormat {

    

    public static String toFormat1(String fecha) throws ParseException {

        String nueva_fecha = null;
        if (fecha != null) {
            if (!fecha.equals("")) {
                System.out.println("converFecha: " + fecha);
                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
                nueva_fecha = new SimpleDateFormat("dd-MMM-yyyy").format(date).toUpperCase();
                System.out.println("converFecha (nueva fecha): " + nueva_fecha);
            } else {
                nueva_fecha = null;
            }
        } else if (fecha == null) {
            nueva_fecha = null;
        }
        return nueva_fecha;

    }

    public static String toFormat2(String fecha) {
        String f[] = fecha.split("/");
        return f[0] + "-" + f[1] + "-" + f[2];
    }

    public static String toFormat3(String fecha) {
        String nuevaFecha = null;
        if (fecha != null) {
            if (!fecha.equals("")) {
                System.out.println("Fecha :" + fecha);
                String f[] = fecha.split("/");
                nuevaFecha = f[2] + "-" + f[1] + "-" + f[0];
            } else {
                nuevaFecha = null;
            }
        } else if (fecha == null) {
            nuevaFecha = null;
        }
        return nuevaFecha;
    }

    public static String toFormat4(String fecha) {
        System.out.println("Fecha :" + fecha);
        String f[] = fecha.split("-");
        return f[2] + "/" + f[1] + "/" + f[0];
    }

    public static String toFormat5(String fecha) {
        String f[] = fecha.split("-");
        return f[2] + "/" + f[1] + "/" + f[0];
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
