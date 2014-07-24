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
import pe.edu.upeu.application.dao_imp.InterfaceHorarioDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Horario;

/**
 *
 * @author Admin
 */
public class HorarioDAO implements InterfaceHorarioDAO{
    ConexionBD conn;

    @Override
    public boolean Insert_Horario() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Insert_Detalle_Horatio() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Max_id_Horatio() {
         this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql="select max(id_detalle_horario) from rhtd_detalle_horario";
        String Max = "" ;
        try {
             ResultSet rs = this.conn.query(sql);
             while (rs.next()) {
                Max=rs.getString(1);
             }
        } catch (SQLException e) {
        }finally{
         this.conn.close();
         }
        return Max;
    }

    @Override
    public List<Horario> List_Horario() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql="select max(id_detalle_horario) from rhtd_detalle_horario";
        List<Horario> list= new ArrayList<Horario>();
        try {
             ResultSet rs = this.conn.query(sql);
             Horario h = new Horario();
             while (rs.next()) {
                h.setDia_horario(rs.getString("dia_horario"));
                h.setEs_horario(rs.getString("es_horario"));
                h.setHo_desde(rs.getString("ho_desde"));
                h.setHo_hasta(rs.getString("ho_hasta"));
                h.setId_detalle_horario(rs.getString("id_detalle_horario"));
                h.setId_horario(rs.getString("id_horario"));
             }
        } catch (SQLException e) {
        }finally{
         this.conn.close();
         }
        return list;
    }
    
}
