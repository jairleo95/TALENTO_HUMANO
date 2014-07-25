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
import oracle.net.aso.d;
import pe.edu.upeu.application.dao_imp.InterfaceImagenDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Fotos_Trabajador;

/**
 *
 * @author Admin
 */
public class ImagenDAO implements InterfaceImagenDAO {

    ConexionBD conn;

    @Override
    public List<Fotos_Trabajador> List_Foto_Trab(String id_trab) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_foto from rhtr_fotos_trabajador where id_trabajador='" + id_trab + "' ";
        List<Fotos_Trabajador> list = new ArrayList<Fotos_Trabajador>();
        try {
            ResultSet rs = this.conn.query(sql);
            Fotos_Trabajador ft = new Fotos_Trabajador();
            while (rs.next()) {
                ft.setId_foto(rs.getString("id_foto"));
                ft.setDe_foto(rs.getString("de_foto"));
                ft.setAr_foto(rs.getString("ar_foto"));
                ft.setNo_ar_foto(rs.getString("no_ar_foto"));
                ft.setTa_ar_foto(rs.getString("ta_ar_foto"));
                ft.setTi_ar_foto(rs.getString("ti_ar_foto"));
                ft.setId_trabajador(rs.getString("id_trabajador"));
                list.add(ft);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }
}
