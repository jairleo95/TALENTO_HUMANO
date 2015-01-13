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
            cst.setString(1,null);
            cst.setString(2,NO_HORARIO);
            cst.setString(3,DE_HORARIO);
            cst.setString(4,ES_HORARIO);
            cst.setDouble(5,CA_HORAS);
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
    
}
