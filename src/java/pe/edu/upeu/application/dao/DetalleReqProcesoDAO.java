/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceDetalleReqProcesoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.DetalleReqProceso;
import pe.edu.upeu.application.util.DateFormat;

/**
 *
 * @author ALPHA
 */
public class DetalleReqProcesoDAO implements InterfaceDetalleReqProcesoDAO {

    DateFormat c = new DateFormat();
    ConexionBD conn;

    @Override
    public String insertDetalleReqProceso(DetalleReqProceso detalleReqProceso) {
        CallableStatement cst;
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_DETALLE_REQ_PROC( ?,?,?,?,?,?,?)}");
            cst.setString(1, detalleReqProceso.getIdProceso());
            cst.setString(2, detalleReqProceso.getEsReqProceso());
            cst.setString(3, detalleReqProceso.getIdDireccion());
            cst.setString(4, detalleReqProceso.getIdDepartamento());
            cst.setString(5, detalleReqProceso.getIdArea());
            cst.setString(6, detalleReqProceso.getIdRequerimiento());
            cst.registerOutParameter(7, Types.CHAR);
            cst.execute();
            id = cst.getString(7);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!" + e.getMessage());
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
    public Boolean deleteDetalleReqProceso(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Boolean updateDetalleReqProceso(DetalleReqProceso detalleReqProceso) {

        CallableStatement cst;
        Boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_UPDATE_DETALLE_REQ_PROC( ?,?,?,?,?,?,?,?)}");
            cst.setString(1, detalleReqProceso.getIdDetalleReqProceso());
            cst.setString(2, detalleReqProceso.getIdProceso());
            cst.setString(3, detalleReqProceso.getEsReqProceso());
            cst.setString(4, detalleReqProceso.getIdDireccion());
            cst.setString(5, detalleReqProceso.getIdDepartamento());
            cst.setString(6, detalleReqProceso.getIdArea());
            cst.setString(7, detalleReqProceso.getIdRequerimiento());
            cst.registerOutParameter(8, Types.BOOLEAN);
            cst.execute();
            x = cst.getBoolean(8);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;
    }

    @Override
    public List<DetalleReqProceso> listDetalleReqProceso() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
