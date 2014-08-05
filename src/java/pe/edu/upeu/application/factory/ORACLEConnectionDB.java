package pe.edu.upeu.application.factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author Docente
 */
public final class ORACLEConnectionDB extends ConexionBD{

   ORACLEConnectionDB(String[] parametro) {
        this.parametro = parametro;
        this.open();
    }    
    @Override
    Connection open() {
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:" + this.parametro[0] + "/" + this.parametro[1] + "@" + this.parametro[2] + ":" + this.parametro[3] + ":" + this.parametro[4];
       try {
            Class.forName(driver).newInstance();
            this.conex = DriverManager.getConnection(url);
        } catch (Exception e) {
            e.printStackTrace();
        }       
        return this.conex;
    }    
}