/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;
import pe.edu.upeu.application.dao_imp.InterfaceDetalle_Centro_Costo;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author JAIR
 */
public class Detalle_Centro_Costo_DAO implements InterfaceDetalle_Centro_Costo {

    ConexionBD conn;
    CConversion c = new CConversion();

    @Override
    public String INSERT_DETALLE_CENTRO_COSTO(String ID_DETALLE_CENTRO_COSTO,
          //  String ID_CENTRO_COSTO, 
            String ID_DGP, double CA_PORCENTAJE, String ES_DETALLE_CC, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String ID_CONTRATO, String ID_DEPART_CENTRO_COSTO) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_DETALLE_CC( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )} ");
            cst.setString(1, null);
           // cst.setString(2, ID_CENTRO_COSTO);
            cst.setString(2, ID_DGP);
            cst.setDouble(3, CA_PORCENTAJE);
            cst.setString(4, ES_DETALLE_CC);
            cst.setString(5, US_CREACION);
            cst.setString(6, FE_CREACION);
            cst.setString(7, US_MODIF);
            cst.setString(8, FE_MODIF);
            cst.setString(9, IP_USUARIO);
            cst.setString(10, ID_CONTRATO);
            cst.setString(11, ID_DEPART_CENTRO_COSTO);
            cst.registerOutParameter(12, Types.CHAR);
            cst.execute();
            id = cst.getString(12);
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
        return id;
    }

    @Override
    public void Modificar_Centro_Costo_porc(String id_dcc, Double porc, String id_user) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MOD_POR_D_CEN_C( ?, ?, ?)}");
            cst.setString(1, id_dcc.trim());
            cst.setDouble(2, porc);
            cst.setString(3, id_user.trim());
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }
}
