/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.SQLException;
import pe.edu.upeu.application.dao_imp.InterfaceDetalle_PrivilegioDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author joserodrigo
 */
public class Detalle_PrivilegioDAO implements InterfaceDetalle_PrivilegioDAO{
    private ConexionBD conn;

    @Override
    public void Registrar_Detalle_Priv(String id_rol, String nu_orden, String id_priv, String es_detalle_priv) {
         CallableStatement cst;
        try {
            String id_det_priv="";
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_DET_PRIV(?,?,?,?,?)}");
            cst.setString(1, id_det_priv.trim());
            cst.setString(2, id_rol.trim());
            cst.setString(3, nu_orden.trim());
            cst.setString(4, id_priv.trim());
            cst.setString(5, es_detalle_priv.trim());
            cst.execute();
        } catch (SQLException ex) {
        } finally {
            this.conn.close();
        }
    }

    @Override
    public void Mod_Detalle_Priv(String id_rol, String nu_orden, String id_priv, String es_detalle_priv) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void Elim_Detalle_Priv(String id_rol, String nu_orden, String id_priv, String es_detalle_priv) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
