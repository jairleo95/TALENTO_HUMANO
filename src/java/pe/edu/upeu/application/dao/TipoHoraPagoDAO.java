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
import pe.edu.upeu.application.dao_imp.InterfaceTipoHoraPagoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.TipoHoraPago;
import pe.edu.upeu.application.web.controller.CCriptografiar;

/**
 *
 * @author ALPHA
 */
public class TipoHoraPagoDAO implements InterfaceTipoHoraPagoDAO {

    ConexionBD conn;

    @Override
    public List<TipoHoraPago> listTiHoraPagoByIdTrabajador(String idtr) {

        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select *  from  RHTD_TI_HORA_PAGO where id_trabajador='" + idtr + "'";
        List<TipoHoraPago> Lista = new ArrayList<TipoHoraPago>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                TipoHoraPago x = new TipoHoraPago();
                x.setIdTiHoraPago(rs.getString("ID_TI_HORA_PAGO"));
                x.setIdTrabajador(CCriptografiar.Encriptar(rs.getString("id_trabajador")));
                x.setCaTiHoraPago(rs.getDouble("CA_TI_HORA_PAGO"));
                x.getUsCreacion().setNo_usuario(rs.getString("US_CREACION"));
                x.setFeCreacion(rs.getString("FE_CREACION"));
                x.getUsModdif().setNo_usuario(rs.getString("US_MODIF"));
                x.setFeModdif(rs.getString("FE_MODIF"));
                x.setIpUsuario(rs.getString("IP_USUARIO"));
                Lista.add(x);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;
    }

}
