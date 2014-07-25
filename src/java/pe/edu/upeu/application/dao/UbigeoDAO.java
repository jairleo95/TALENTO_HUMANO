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
import pe.edu.upeu.application.dao_imp.InterfaceUbigeoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Ub_Departamento;
import pe.edu.upeu.application.model.Ub_Provincia;
import pe.edu.upeu.application.model.V_Ubigeo;

/**
 *
 * @author Admin
 */
public class UbigeoDAO implements InterfaceUbigeoDAO {

    ConexionBD conn;

    @Override
    public List<V_Ubigeo> List_Distrito() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhvd_Ubigeo ";
        List<V_Ubigeo> list = new ArrayList<V_Ubigeo>();
        try {
            ResultSet rs = this.conn.query(sql);
            V_Ubigeo vp = new V_Ubigeo();
            while (rs.next()) {
                vp.setId_distrito(rs.getString("id_distrito"));
                vp.setNo_departamento(rs.getString("no_departamento"));
                vp.setNo_distrito(rs.getString("no_distrito"));
                vp.setNo_provincia(rs.getString("no_provincia"));
                list.add(vp);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Ub_Provincia> List_Provincia() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtx_ub_provincia order by no_provincia";
        List<Ub_Provincia> list = new ArrayList<Ub_Provincia>();
        try {
            ResultSet rs = this.conn.query(sql);
            Ub_Provincia p = new Ub_Provincia();
            while (rs.next()) {
                p.setId_departamento(rs.getString("id_departamento"));
                p.setId_provincia(rs.getString("id_provincia"));
                p.setNo_provincia(rs.getString("no_provincia"));
                list.add(p);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Ub_Departamento> List_Departamento() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtx_ub_departamento order by no_departamento";
        List<Ub_Departamento> list = new ArrayList<Ub_Departamento>();
        try {
            ResultSet rs = this.conn.query(sql);
            Ub_Departamento d = new Ub_Departamento();
            while (rs.next()) {
               d.setId_departamento(rs.getString("id_departamento"));
               d.setNo_departamento(rs.getString("no_departamento"));
                list.add(d);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }
}
