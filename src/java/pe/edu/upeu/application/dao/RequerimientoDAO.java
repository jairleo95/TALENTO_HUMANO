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
import pe.edu.upeu.application.dao_imp.InterfaceRequerimientoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Requerimiento;

/**
 *
 * @author Admin
 */
public class RequerimientoDAO implements InterfaceRequerimientoDAO {

    ConexionBD conn;

    @Override
    public List<Requerimiento> Listar_Requerimiento() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtr_requerimiento ";
        List<Requerimiento> list = new ArrayList<Requerimiento>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Requerimiento r = new Requerimiento();
                r.setId_requerimiento(rs.getString("id_requerimiento"));
                r.setNo_req(rs.getString("no_req"));
                r.setId_tipo_planilla(rs.getString("id_tipo_planilla"));
                list.add(r);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public String id_det_req_proc(String iddgp) {
        String Id = "";
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        try {
            CallableStatement sentencia = this.conn.conex.prepareCall("{?=call RHFU_REQ_PRO_ID_DGP(?)}");
            sentencia.registerOutParameter(1, Types.VARCHAR);
            sentencia.setString(2, iddgp);
            sentencia.executeQuery();
            Id = sentencia.getString(1);
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Id;
    }



}
