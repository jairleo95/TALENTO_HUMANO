/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceSituacionEducativaDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Situacion_Educativa;

/**
 *
 * @author joserodrigo
 */
public class SituacionEducativaDAO implements InterfaceSituacionEducativaDAO{
    ConexionBD conn;
    @Override
    public List<Situacion_Educativa> List_SituacionEducativa() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT NO_S_EDUCATIVA,ID_SITUACION_EDUCATIVA,ES_S_EDUCATIVA FROM RHTX_SITUACION_EDUCATIVA";
        List<Situacion_Educativa> list = new ArrayList<Situacion_Educativa>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Situacion_Educativa a = new Situacion_Educativa();
                a.setNo_s_educativa(rs.getString("NO_S_EDUCATIVA"));
                a.setId_situacion_educativa(rs.getString("ID_SITUACION_EDUCATIVA"));
                a.setEs_s_educativa(rs.getString("ES_S_EDUCATIVA"));
                list.add(a);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }
    
}
