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
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.dao_imp.InterfaceAnnoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Anno;
import pe.edu.upeu.application.model.Contrato;

/**
 *
 * @author Admin
 */
public class AnnoDAO implements InterfaceAnnoDAO {

    ConexionBD conn;

    @Override
    public List<Anno> List_Anno() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtr_anno order by id_anno desc";
        List<Anno> list = new ArrayList<Anno>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Anno a = new Anno();
                a.setId_anno(rs.getString("id_anno"));
                a.setNo_anno(rs.getString("no_anno"));
                a.setDe_anno(rs.getString("de_anno"));
                a.setFe_desde(rs.getString("fe_desde"));
                a.setFe_hasta(rs.getString("fe_hasta"));
                a.setDe_observacion(rs.getString("de_observacion"));
                list.add(a);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public String List_Anno_Max_Cont(String id_Trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select d.id_anno from (select a.id_anno,rhc.id_contrato,rhc.id_dgp ,rhc.id_trabajador from rhtm_contrato rhc ,  rhtr_año a where  rhc.id_anno=a.id_anno and a.no_anno =( select max(no_anno) from año)) d left outer join detalle_dgp dgp on (d.id_dgp = dgp.id_dgp) where d.i_trabajador='" + id_Trabajador + "'";
        ResultSet rs = this.conn.query(sql);
        String id = "";

        try {
            rs.next();
            id = rs.getString(1);
        } catch (SQLException ex) {
            //Logger.getLogger(AnnoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.conn.close();
        }

        return id;

    }

    @Override
    public List<Contrato> List_A_Cont(String id_dgp) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
