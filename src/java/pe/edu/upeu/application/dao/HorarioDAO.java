/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.dao_imp.InterfaceHorarioDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.V_Horario;

/**
 *
 * @author Admin
 */
public class HorarioDAO implements InterfaceHorarioDAO {

    ConexionBD conn;

    @Override
    public String Max_id_Detalle_Horario() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT 'DHO-'||MAX (SUBSTR(ID_DETALLE_HORARIO,5,10)) FROM RHTD_DETALLE_HORARIO";
        String Max = "";
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Max = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Max;
    }

    @Override
    public List<V_Horario> List_V_Horario(String iddgp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhvd_horario where id_dgp='" + iddgp + "' order by id_horario asc";
        List<V_Horario> list = new ArrayList<V_Horario>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Horario Vh = new V_Horario();
                Vh.setDia_horario(rs.getString("dia_horario"));
                Vh.setHo_desde(rs.getString("ho_desde"));
                Vh.setHo_hasta(rs.getString("ho_hasta"));
                Vh.setId_detalle_horario(rs.getString("id_detalle_horario"));
                Vh.setId_dgp(rs.getString("id_dgp"));
                Vh.setId_horario(rs.getString("id_horario"));
                list.add(Vh);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public void Insert_Horario(String ID_HOR, String HO_DESDE, String HO_HASTA, String DIA_HOR, String ES_HOR, String ID_DET_HOR) {

        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_HORARIO( ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, HO_DESDE);
            cst.setString(3, HO_HASTA);
            cst.setString(4, DIA_HOR);
            cst.setString(5, ES_HOR);
            cst.setString(6, ID_DET_HOR);
            cst.execute();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(AutorizacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.conn.close();
        }
    }

    @Override
    public void Insert_Det_Hor_Casos_Esp(String ID_DET_HOR, String ID_DGP, String ES_DE_HOR, String US_CRE, String FE_CRE, String US_MODIF, String FE_MODIF, String ID_TIPO_HORARIO, String ES_MOD_FORMATO) {
        try {

            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_DETALLE_HORARIO( ?, ?, ?, ?,?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, ID_DGP);
            cst.setString(3, ES_DE_HOR);
            cst.setString(4, US_CRE);
            cst.setString(5, US_MODIF);
            cst.setString(6, FE_CRE);
            cst.setString(7, FE_MODIF);
            cst.setString(8, ID_TIPO_HORARIO);
            cst.setString(9, ES_MOD_FORMATO);
            cst.execute();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            this.conn.close();
        }
    }

    @Override
    public String Insert_Detalle_Horario(String ID_DET_HOR, String ID_DGP, String ES_DE_HOR, String US_CRE, String FE_CRE, String US_MODIF, String FE_MODIF, String ID_TIPO_HORARIO, String ES_MOD_FORMATO, Double ca_h_total) {
        String id="";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_DETALLE_HORARIO( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,? )}");
            cst.setString(1, null);
            cst.setString(2, ID_DGP);
            cst.setString(3, ES_DE_HOR);
            cst.setString(4, US_CRE);
            cst.setString(5, US_MODIF);
            cst.setString(6, FE_CRE);
            cst.setString(7, FE_MODIF);
            cst.setString(8, ID_TIPO_HORARIO);
            cst.setString(9, ES_MOD_FORMATO);
            cst.setDouble(10, ca_h_total);
            cst.registerOutParameter(11, Types.CHAR);
            cst.execute();
            id = cst.getString(11);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(AutorizacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.conn.close();
        }
        return id;
    }

}
