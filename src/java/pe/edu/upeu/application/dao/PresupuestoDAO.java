/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfacePresupuestoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author Leandro Burgos
 */
public class PresupuestoDAO implements InterfacePresupuestoDAO {

    String sql;
    ConexionBD cnn;
    PreparedStatement ps;
    ResultSet rs;
    CallableStatement cs;

    @Override
    public boolean Reg_PresupuestoArea(Object s) {
        boolean p = false;
        sql = "{CALL INSERT_PRESUPUESTO (?,?,?,?,?)}";
        Map<String, Object> m = (Map<String, Object>) s;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cs = this.cnn.conex.prepareCall(sql);
            cs.setString(1, m.get("idA").toString());
            cs.setDouble(2, Double.parseDouble(m.get("PA").toString()));
            cs.setString(3, m.get("f_i").toString());
            cs.setString(4, m.get("f_fin").toString());
            cs.setInt(5, Integer.parseInt(m.get("NT").toString()));
            int r = cs.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Error al agregar Presupuesto " + e);
            p = false;
        } finally {
            this.cnn.close();
        }
        return p;
    }

    @Override
    public ArrayList<Map<String, ?>> comprobar(String idArea) {
        sql = "select count(dgp.ID_TRABAJADOR) ntr,sum(dgp.CA_SUELDO*12) nsu "
                + "from rhtm_contrato rc,rhtm_dgp dgp,rhtr_puesto rp,rhtr_seccion rs,rhtd_area ra,presupuesto pr "
                + "where dgp.ID_DGP=rc.ID_DGP "
                + "and dgp.ID_PUESTO=rp.ID_PUESTO "
                + "and rs.ID_SECCION=rp.ID_SECCION "
                + "and rs.ID_AREA=ra.ID_AREA "
                + "and pr.FE_DESDE < rc.FE_DESDE "
                + "and pr.F_HASTA > rc.FE_HASTA "
                + "and pr.IDAREA=ra.ID_AREA "
                + "and ra.ID_AREA=? ";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idArea);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("ntrabajadores", rs.getInt("ntr"));
                m.put("monto", rs.getDouble("nsu"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error al listar Condiciones Presupuestado " + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    @Override
    public ArrayList<Map<String, ?>> dataPresupuesto(String idArea) {
        sql = "select * from PRESUPUESTO where  sysdate BETWEEN FE_DESDE  and F_HASTA and IDAREA=?";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idArea);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("ntrabajadores", rs.getInt("n_trabajadores"));
                m.put("saldo", rs.getDouble("saldo"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error al listar Condiciones Presupuestado " + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    
    
}
