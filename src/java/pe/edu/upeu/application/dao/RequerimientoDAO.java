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
        String sql = "Select * from rhtd_area ";
        List<Requerimiento> list = new ArrayList<Requerimiento>();
        try {
            ResultSet rs = this.conn.query(sql);
            Requerimiento r = new Requerimiento();
            while (rs.next()) {
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
    public List<Requerimiento> id_det_proc() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Requerimiento> Validar_Req_DGP() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
