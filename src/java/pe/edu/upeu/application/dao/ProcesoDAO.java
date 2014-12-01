/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfaceProcesoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author ALFA 3
 */
public class ProcesoDAO implements InterfaceProcesoDAO {

    ConexionBD conn;
    CConversion c = new CConversion();

    @Override
    public List<Map<String, ?>> List_Proceso() {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select * from rhtv_proceso";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {

                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_proceso"));
                rec.put("nom", rs.getString("no_proceso"));
                rec.put("des", rs.getString("de_proceso"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;

    }

}
