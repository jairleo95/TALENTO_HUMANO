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
import pe.edu.upeu.application.dao_imp.InterfaceSeccionDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Seccion;

/**
 *
 * @author Jose
 */
public class SeccionDAO implements InterfaceSeccionDAO{
    ConexionBD conn;
    @Override
    public List<Seccion> LISTA_RH_SECCION() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHTR_SECCION ORDER BY ID_SECCION ASC";
        List<Seccion> list = new ArrayList<Seccion>();
        try {
            ResultSet rs = this.conn.query(sql);
          
            while (rs.next()) {
                  Seccion n = new Seccion();
                n.setId_seccion(rs.getString("id_seccion"));
                n.setId_area(rs.getString("id_area"));
                n.setEs_seccion(rs.getString("es_seccion"));
                n.setNo_seccion(rs.getString("no_seccion"));
                n.setNo_corto_sec(rs.getString("No_corto_sec"));
                list.add(n);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public String ID_SECCION(String id_puesto) {
        this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql="select ID_SECCION from   RHTR_PUESTO  where ID_PUESTO='"+ id_puesto.trim() +"'";
        String id_sec = null;
        try {
            ResultSet rs=this.conn.query(sql);
            while(rs.next()){
                id_sec=rs.getString("ID_SECCION");
            }
        } catch (SQLException e) {
        }finally{
            this.conn.close();
        }
        return id_sec;
    }
    
}
