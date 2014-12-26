/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.factory;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.logging.Logger;

/**
 *
 * @author JAIR
 */
public class Session_System implements HttpSessionListener{
private final static Logger logger = Logger.getLogger(Session_System.class.getName()); 
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        	System.out.println("A new session is created");
              logger.info("session created : " );
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
