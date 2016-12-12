/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.factory;

import pe.edu.upeu.application.properties.globalProperties;

/**
 *
 * @author Docente
 */
public class FactoryConnectionDB {

    public static final int MYSQL = 1;
    public static final int ORACLE = 2;

    public static String[] configMYSQL = {"bd_almacen", "root", "root"};

    public static String[] configORACLE = {globalProperties.USER, globalProperties.USER_PWD, globalProperties.HOSTNAME, globalProperties.PORT, globalProperties.SID};
    // public static final String url = "/opt/tomcat8/webapps/files/";
   
//public static final String url = "C:\\Users\\ALPHA\\Documents\\NetBeansProjects\\TALENTO_HUMANO\\web\\Archivo\\";
//public static final String url = "E:\\Projects\\TH\\th 1\\TALENTO_HUMANO\\web\\Archivo";  ESTE URL CAMBIA DE ACUERDO A LA MAQUINA
  //  public static final String url_archivos = "http://localhost:8082/fileSystemServer/filesSystemTalentoHumano/";
 //  
  public static final String url = "/usr/share/tomcat7/webapps/TALENTO_HUMANO/Archivo/";
    // public static final String url_archivos = "http://procesosrh-gth.upeu/fileSystemServer/filesSystemTalentoHumano/";
    
    
  //  public static String[] configORACLE = {"procesosrh", "gestionrrhh", "procesrh-db.upeu", "1521", "upeu"};
    public static final String url_archivos = "http://procesosrh-app.upeu/TALENTO_HUMANO/Archivo/";
   // public static final String url = "/usr/share/tomcat7/webapps/TALENTO_HUMANO/Archivo/";
 

    public static ConexionBD open(int typeDB) {
        switch (typeDB) {
            case FactoryConnectionDB.MYSQL:
                return new MYSQLConnectionDB(configMYSQL);

            case FactoryConnectionDB.ORACLE:
                return new ORACLEConnectionDB(configORACLE);
            default:
                return null;
        }
    }

 
}
