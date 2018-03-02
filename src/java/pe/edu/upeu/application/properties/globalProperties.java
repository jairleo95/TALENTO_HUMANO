/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.properties;

/**
 *
 * @author ALPHA
 */
public class globalProperties {

    /* Enviroment variable*/
    /*change when update server (for cache conflicts)*/
    public static String VERSION_CSS = "2.1.7";
    public static String VERSION_JS = "2.7.7";

    /* WebService Carga Academica*/
    public static final String keyApp = "4a7c88ee0791cad24a15d43a525982f8";
    public static final String keyID = "d57d9c1cd0cfdec68805a5055388177b";
    public static final String serverURI = "https://webapp.upeu.edu.pe/";
    public static final String service = "https://webapp.upeu.edu.pe/webservices/wsdl4rrhh/";

    public static final String DOCENTESXCURSO_METHOD[] = {"DocenteXCurso", "ns1", "ns1:DocenteXCursoResponse"};

    /*oracle bd connection */
    //public static final String HOSTNAME = "192.168.1.18";
    //public static final String HOSTNAME = "192.168.1.18";
    public static final String HOSTNAME = "procesrh-db.upeu";
    public static final String USER = "procesosrh";
    public static final String USER_PWD = "gestionrrhh";
    public static final String PORT = "1521";
    public static final String SID = "upeu";
    
     /*public static final String HOSTNAME = "localhost";
     public static final String USER = "gth";
     public static final String USER_PWD = "123";
     public static final String PORT = "1521";
     public static final String SID = "xe";*/

}
