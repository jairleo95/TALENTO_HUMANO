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

    //ARCHIVOS LOCALES
    public static final String url = "E:/Projects/TALENTO_HUMANO/web/Archivo/";
    public static final String url_archivos = "http://localhost:8084/TALENTO_HUMANO/Archivo/";
    //SERVIDOR 192.168.13.52
    //public static final String url_archivos = "http://gth.upeu.edu.pe/TALENTO_HUMANO/Archivo/";
    //public static final String url = "/usr/share/tomcat7/webapps/TALENTO_HUMANO/Archivo/";
    //SERVIDOR 192.168.15.20
    //public static final String url_archivos = "http://gth.upeu.edu.pe/TALENTO_HUMANO/Archivo/";
    //public static final String url = "//u01/tomcat/gth_webapps/DATA_GTH/Archivo/";

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
