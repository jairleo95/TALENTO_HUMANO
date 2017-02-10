/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.properties;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author JAIR
 */
public class SessionSystem implements HttpSessionListener {

    public static String num = "";

    @Override
    public void sessionCreated(HttpSessionEvent arg0) {
      //  long unixSeconds = Long.parseLong(arg0.getSession().getCreationTime()+"");
        long unixSeconds =Long.parseLong(String.valueOf("1444503689862"));
        Date date = new Date(unixSeconds * 1000L); // *1000 is to convert seconds to milliseconds
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss z"); // the format of your date
        sdf.setTimeZone(TimeZone.getTimeZone("GMT-5")); // give a timezone reference for formating (see comment at the bottom
        String formattedDate = sdf.format(date);
        num = formattedDate;
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent arg0) {

        System.out.println("sessionDestroyed - deduct one session from counter");
    }

}
