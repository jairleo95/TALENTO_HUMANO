/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author ALFA 3
 */
public class Carga_AcademicaDAO implements InterfaceCarga_AcademicaDAO {

    ConexionBD conn;

    @Override
    public String DNI_ID_TRABAJADOR(String dni) {

        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String idtr = "";
        String sql = "select *  from rhtm_trabajador  where  trim(NU_DOC)='" + dni.trim() + "'";

        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                idtr = rs.getString("id_trabajador");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR: "+e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                 throw new RuntimeException(e.getMessage());
                
            }
        }
        return idtr;

    }

}
