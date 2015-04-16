/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.SQLException;
import pe.edu.upeu.application.dao_imp.InterfaceHist_Estado_CivilDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author Alex
 */
public class Hist_Estado_CivilDAO implements InterfaceHist_Estado_CivilDAO{

     ConexionBD conn;
     
    @Override
    public void INSERT_HIST_ESTADO_CIVIL(String ID_ESTADO_CIVIL, String LI_ESTADO_CIVIL, String FE_MODIFICACION, String US_MODIFICACION, String ID_TRABAJADOR ) {
         try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_ESTADO_CIVIL( ?, ?, ?, ?, ?)} ");
            cst.setString(1, null);
            cst.setString(2, LI_ESTADO_CIVIL);
            cst.setString(3, FE_MODIFICACION);
            cst.setString(4, US_MODIFICACION);
            cst.setString(5, ID_TRABAJADOR);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }
    
  
    
}
