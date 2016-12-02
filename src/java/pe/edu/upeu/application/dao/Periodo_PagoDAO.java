/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.dao_imp.InterfacePeriodo_PagoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.util.DateFormat;

/**
 *
 * @author Alex
 */
public class Periodo_PagoDAO implements InterfacePeriodo_PagoDAO{
    ConexionBD conn;
    DateFormat c = new DateFormat();

    @Override
    public void InsetarPeriodo_Pago(String ID_PERIODO_PAGO, Double NU_CUOTA, String FE_PAGAR, Double CA_MONTO, String ID_DGP, String ES_PER_PAGO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement pp = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PERIODO_PAGO(?, ?, ?, ?, ?, ? )}");
            pp.setString(1, null);
            pp.setDouble(2, NU_CUOTA);
            pp.setString(3, DateFormat.toFormat1(FE_PAGAR));
            pp.setDouble(4, CA_MONTO);
            pp.setString(5, ID_DGP );
            pp.setString(6, ES_PER_PAGO);
            pp.execute();

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (ParseException ex) {
            Logger.getLogger(Periodo_PagoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.conn.close();
        }
    }
    
}
