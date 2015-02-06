/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.factory;

/**
 *
 * @author Docente
 */
public class FactoryConnectionDB {

    public static final int MYSQL = 1;
    public static final int ORACLE = 2;
    public static String[] configMYSQL = {"bd_almacen", "root", "root"};
    public static String[] configORACLE = {"procesosrh", "gestionrrhh", "procesrh-db.upeu", "1521", "upeu"};

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
