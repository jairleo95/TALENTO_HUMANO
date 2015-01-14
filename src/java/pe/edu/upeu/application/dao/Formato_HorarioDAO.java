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
import java.util.List;
import org.eclipse.jdt.internal.compiler.apt.model.Factory;
import pe.edu.upeu.application.dao_imp.InterfaceFormato_HorarioDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Formato_Horario;
import pe.edu.upeu.application.model.Tipo_Horario;

/**
 *
 * @author Alex
 */
public class Formato_HorarioDAO implements InterfaceFormato_HorarioDAO {

    ConexionBD conn;

    @Override
    public void Insert_Horario(String ID_TIPO_HORARIO, String NO_HORARIO, String DE_HORARIO, String ES_HORARIO, Double CA_HORAS) {

        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_TIPO_HORARIO (?,?,?,?,?)}");
            cst.setString(1, null);
            cst.setString(2, NO_HORARIO);
            cst.setString(3, DE_HORARIO);
            cst.setString(4, ES_HORARIO);
            cst.setDouble(5, CA_HORAS);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } finally {
            this.conn.close();
        }
    }

    @Override
    public List<Tipo_Horario> Listar_Tipo_Horario() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHTR_TIPO_HORARIO ";
        List<Tipo_Horario> list = new ArrayList<Tipo_Horario>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Tipo_Horario tih = new Tipo_Horario();
                tih.setId_tipo_horario(rs.getString("id_tipo_horario"));
                tih.setNo_horario(rs.getString("no_horario"));
                tih.setDe_horario(rs.getString("de_horario"));
                tih.setEs_horario(rs.getString("es_horario"));
                tih.setCa_horas(rs.getDouble("ca_horas"));
                list.add(tih);
            }
        } catch (Exception e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public void Insert_Formato_Horario(String ID_FORMATO_HORARIO, String NO_TURNO, String NO_DIA, String HO_DESDE, String HO_HASTA, String ES_F_HORARIO, String ID_TIPO_HORARIO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_FORMATO_HORARIO (?,?,?,?,?,?,?)}");
            cst.setString(1, null);
            cst.setString(2, NO_TURNO);
            cst.setString(3, NO_DIA);
            cst.setString(4, HO_DESDE);
            cst.setString(5, HO_HASTA);
            cst.setString(6, ES_F_HORARIO);
            cst.setString(7, ID_TIPO_HORARIO);
            cst.execute();
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } finally {
            this.conn.close();
        }
    }

    @Override
    public List<Formato_Horario> Listar_Formato_Horario(String idth) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from RHTR_FORMATO_HORARIO  where ID_TIPO_HORARIO ='"+idth+"' ";
        List<Formato_Horario> list = new ArrayList<Formato_Horario>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Formato_Horario fh = new Formato_Horario();
                fh.setId_formato_horario(rs.getString("id_formato_horario"));
                fh.setEs_f_horario(rs.getString("es_f_horario"));
                fh.setHo_desde(rs.getString("ho_desde"));
                fh.setHo_hasta(rs.getString("ho_hasta"));
                fh.setId_tipo_horario(rs.getString("id_tipo_horario"));
                fh.setNo_turno(rs.getString("no_turno"));
                fh.setNo_dia(rs.getString("no_dia"));
                list.add(fh);
            }
        } catch (Exception e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

}
