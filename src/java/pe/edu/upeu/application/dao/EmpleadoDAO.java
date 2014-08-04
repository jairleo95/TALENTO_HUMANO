/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author Alfa.sistemas
 */
public class EmpleadoDAO implements InterfaceEmpleadoDAO {

    ConexionBD conn;

    @Override
    public String Id_Puesto_Personal(String ide) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_puesto from RHVD_EMP_PU_DIR_DEP WHERE ID_EMPLEADO='"+ide+"'";
        String id = null;
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            id = rs.getString("id_puesto");
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return id;
    }

    @Override
    public void VALIDAR_EMPLEADO(String id_tra) {
       
        CallableStatement cst;
        try {
             this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst=conn.conex.prepareCall("{CALL RHSP_VAL_EMP ( ? )}");
            cst.setString(1,id_tra);
            cst.execute();
        } catch (SQLException e) {
        }finally{
            this.conn.close();
        }

    }

}
