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
        sql = "{CALL INSERT_PRESUPUESTO (?,?,?,?,?,?,?,?,?,?,?)}";
        Map<String, Object> m = (Map<String, Object>) s;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cs = this.cnn.conex.prepareCall(sql);
            cs.setString(1, m.get("idCC").toString());
            cs.setString(2, m.get("idUSER").toString());
            cs.setString(3, m.get("idDes").toString());
            cs.setInt(4, Integer.parseInt(m.get("SB").toString()));
            cs.setInt(5, Integer.parseInt(m.get("AF").toString()));
            cs.setInt(6, Integer.parseInt(m.get("BA").toString()));
            cs.setInt(7, Integer.parseInt(m.get("BO").toString()));
            cs.setString(8, m.get("f_i").toString());
            cs.setString(9, m.get("f_fin").toString());
            cs.setInt(10, Integer.parseInt(m.get("NT").toString()));
            cs.setString(11, m.get("tipo").toString());
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
                + "and pr.FE_HASTA > rc.FE_HASTA "
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
    public ArrayList<Map<String, ?>> dataPresupuesto(String idDestino) {
        sql = "select * from PRESUPUESTO where  sysdate BETWEEN FE_DESDE  and F_HASTA and IDDESTINO=?";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
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

    @Override
    public ArrayList<Map<String, ?>> pActual(String id) {
        sql = "select * from PRESUPUESTO p,DET_PRESUPUESTO d "
                + "where p.IDPRESUPUESTO=d.IDPRESUPUESTO  "
                + "and p.IDDESTINO=? "
                + "and sysdate BETWEEN p.FE_DESDE and p.FE_HASTA "
                + "and p.ESTADO='1' ";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("idpresupuesto", rs.getString("IDPRESUPUESTO"));
                m.put("iddestino", rs.getString("IDDESTINO"));
                m.put("idccosto", rs.getString("ID_CENTRO_COSTO"));
                m.put("fe_desde", rs.getString("FE_DESDE"));
                m.put("fe_hasta", rs.getString("FE_HASTA"));
                m.put("n_trabajadores", rs.getString("N_TRABAJADORES"));
                m.put("iddet_presupuesto", rs.getString("IDDET_PRESUPUESTO"));
                m.put("f_modif", rs.getString("F_MODIF"));
                m.put("operacion", rs.getString("OPERACION"));
                m.put("mtrabajador", rs.getString("MTRABAJADOR"));  
                m.put("tipo", rs.getString("TIPO"));  
                
                m.put("sbgeneral", rs.getString("SBASICO"));
                m.put("afgeneral", rs.getString("AFAMILIAR"));
                m.put("bageneral", rs.getString("BONOAL"));
                m.put("bogeneral", rs.getString("BONIFICACION"));
                
                m.put("sbdet", rs.getString(19));
                m.put("afdet", rs.getString(20));
                m.put("badet", rs.getString(21));
                m.put("bodet", rs.getString(22));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar Presupuestado " + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    @Override
    public boolean statusPresupuesto(String idDestino) {
        boolean s = false;
        sql = "select * from PRESUPUESTO where ESTADO=1 and IDDESTINO=?";
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, idDestino);
            rs = ps.executeQuery();
            while (rs.next()) {
                s = true;
            }
        } catch (SQLException e) {
            System.out.println("Error al listar Estado de Presupuestado " + e);
        } finally {
            this.cnn.close();
        }
        return s;
    }

    @Override
    public ArrayList<Map<String, ?>> CCostos(String id, int tipo) {
        String sr = "";
        if (tipo == 2) {
            sr = "where ID_DEPARTAMENTO=?";
        }
        if (tipo == 1) {
            sr = "where ID_AREA=?";
        }
        sql = "select * from RHVD_CENTRO_COSTO " + sr;
        System.out.println(sql);
        System.out.println(id);
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ps = this.cnn.conex.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("idccosto", rs.getString("ID_CENTRO_COSTO"));
                m.put("codigo", rs.getString("CO_CENTRO_COSTO"));
                m.put("denominacion", rs.getString("DE_CENTRO_COSTO"));
                m.put("iddireccion", rs.getString("ID_DIRECCION"));
                m.put("no_direccion", rs.getString("NO_DIRECCION"));
                m.put("iddepartamento", rs.getString("ID_DEPARTAMENTO"));
                m.put("no_departamento", rs.getString("NO_DEP"));
                m.put("idarea", rs.getString("ID_AREA"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar Centros de Costo " + e);
        } finally {
            this.cnn.close();
        }
        return lista;
    }

}
