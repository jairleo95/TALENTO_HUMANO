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
import pe.edu.upeu.application.dao_imp.InterfaceSituacionEspecialDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.SituacionEspecial;

/**
 *
 * @author JAIR
 */
public class SituacionEspecialDAO implements InterfaceSituacionEspecialDAO {
    ConexionBD conn;
    @Override
    public List<SituacionEspecial> list() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM rhtr_situacion_especial";
        List<SituacionEspecial> list = new ArrayList<>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                SituacionEspecial us = new SituacionEspecial();
                us.setIdSituacionEspecial(rs.getString("ID_SITUACION_ESPECIAL"));
                us.setDeSituacionEspecial(rs.getString("DE_SITUACION_ESPECIAL"));
                list.add(us);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("error : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }
}
