/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfacePlazo_DgpDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author JAIR
 */
public class Plazo_DgpDAO implements InterfacePlazo_DgpDAO {

    ConexionBD conn;
    CConversion c = new CConversion();

    @Override
    public List<Map<String, ?>> List_Plazo(String t_List) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select id_plazo,no_plazo,det_alerta ,to_char(fe_desde,'yyyy-mm-dd')  as fe_desde ,to_char(fe_hasta,'yyyy-mm-dd')  as fe_hasta  from rhtr_plazo where es_plazo ='1'";
            sql += (t_List != null) ? "" : " and SYSDATE BETWEEN FE_DESDE AND FE_HASTA";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {

                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_plazo"));
                rec.put("nom", rs.getString("no_plazo"));
                rec.put("det", rs.getString("DET_ALERTA"));
                rec.put("desde", rs.getString("FE_DESDE"));
                rec.put("hasta", rs.getString("FE_HASTA"));
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

    @Override
    public void INSERT_PLAZO(String ID_PLAZO, String NO_PLAZO, String DET_ALERTA, String FE_DESDE, String FE_HASTA, String ES_PLAZO) {
        try {

            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PLAZO( ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, NO_PLAZO);
            cst.setString(3, DET_ALERTA);
            cst.setString(4, c.convertFecha(FE_DESDE));
            cst.setString(5, c.convertFecha(FE_HASTA));
            cst.setString(6, "1");
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.conn.close();
        }
    }

    @Override
    public void UPDATE_PLAZO(String ID_PLAZO, String NO_PLAZO, String DET_ALERTA, String FE_DESDE, String FE_HASTA, String ES_PLAZO) {
        try {

            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_UPDATE_PLAZO( ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, ID_PLAZO);
            cst.setString(2, NO_PLAZO);
            cst.setString(3, DET_ALERTA);
            cst.setString(4, c.convertFecha(FE_DESDE));
            cst.setString(5, c.convertFecha(FE_HASTA));
            cst.setString(6, "1");
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.conn.close();
        }
    }

    @Override
    public void REMOVE_PLAZO(String ID_PLAZO) {

        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = " DELETE FROM RHTR_PLAZO WHERE ID_PLAZO='" + ID_PLAZO.trim() + "'";
            this.conn.ejecutar(sql);
        } catch (Exception e) {
            this.conn.close();
        }

    }

}
