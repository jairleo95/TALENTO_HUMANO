/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.factory;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Docente
 */
public class FactoryConnectionDB {

    public static final int MYSQL = 1;
    public static final int ORACLE = 2;

    public static String[] configMYSQL = {"bd_almacen", "root", "root"};

    public static String[] configORACLE = {"procesosrh", "rrhh", "192.168.21.4", "1521", "xe"};

        public static final String url = "C:\\Users\\Estrella\\Documents\\NetBeansProjects\\TALENTO_HUMANO\\web\\Archivo\\";
    //public static final String url = "E:\\Projects\\TH\\th 1\\TALENTO_HUMANO\\web\\Archivo";  ESTE URL CAMBIA DE ACUERDO A LA MAQUINA
    public static final String url_archivos = "http://localhost:8089/TALENTO_HUMANO/Archivo/Archivo";

    //  public static String[] configORACLE = {"procesosrh", "rrhh", "procesrh-db.upeu", "1521", "upeu"};
//public static final String url = "/usr/share/tomcat7/webapps/TALENTO_HUMANO/Archivo/";
// public static final String url_archivos = "http://procesosrh-app.upeu/TALENTO_HUMANO/Archivo/";

    /* WebService Carga Academica*/
    public static final String keyApp = "4a7c88ee0791cad24a15d43a525982f8";
    public static final String keyID = "d57d9c1cd0cfdec68805a5055388177b";
    public static final String serverURI = "https://webapp.upeu.edu.pe/";
    public static final String service = "https://webapp.upeu.edu.pe/webservices/wsdl4rrhh/";

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

    public static String detalle_ip() {
        String x = "";
        InetAddress ip;
        try {
            ip = InetAddress.getLocalHost();
            NetworkInterface network = NetworkInterface.getByInetAddress(ip);
            byte[] mac = network.getHardwareAddress();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < mac.length; i++) {
                sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
            }
            x = ip.getHostAddress() + "*" + ip.getCanonicalHostName() + "*" + sb.toString();

        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (SocketException e) {
            e.printStackTrace();
        }
        return x;
    }

    public static String convertFecha(String fecha) throws ParseException {

        String nueva_fecha = null;
        if (fecha != null) {
            if (!fecha.equals("")) {
                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
                nueva_fecha = new SimpleDateFormat("dd-MMM-yy").format(date).toUpperCase();
            } else {
                nueva_fecha = null;
            }
        } else if (fecha == null) {
            nueva_fecha = null;
        }
        return nueva_fecha;

    }

    public static String convertFecha2(String fecha) {
        String f[] = fecha.split("/");
        return f[0] + "-" + f[1] + "-" + f[2];
    }

    public static String convertFecha3(String fecha) {
        String f[] = fecha.split("/");
        return f[2] + "-" + f[1] + "-" + f[0];
    }
}
