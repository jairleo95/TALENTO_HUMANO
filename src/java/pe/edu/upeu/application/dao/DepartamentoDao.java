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
import pe.edu.upeu.application.dao_imp.InterfaceDepartamentoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Departamento;

/**
 *
 * @author Admin
 */
public class DepartamentoDao implements InterfaceDepartamentoDAO{
    ConexionBD conn;
    
    @Override
    public List<Departamento> List_Departamento() {
        this.conn= FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtx_departamento";
        List<Departamento> list = new ArrayList<Departamento>();
        try {
            ResultSet rs = this.conn.query(sql);
            Departamento d = new Departamento();
            while (rs.next()) {                
                d.setEs_departamento(rs.getString("es_departamento"));
                d.setId_departamento(rs.getString("id_departamento"));
                d.setId_direccion(rs.getString("id_direccion"));
                d.setNo_corto_dep(rs.getString("no_corto_dep"));
                d.setNo_dep(rs.getString("no_dep"));
            }
        } catch (SQLException e) {
        }finally{
        this.conn.close();
        }
        return list;
    }
    
}
