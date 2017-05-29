/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfaceSub_ModalidadDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Sub_Modalidad;

/**
 *
 * @author joserodrigo
 */
public class Sub_ModalidadDAO implements InterfaceSub_ModalidadDAO{
    ConexionBD conn;
    @Override
    public List<Sub_Modalidad> Listar_Sub_mo() {
         this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select * from RHTX_SUB_MODALIDAD";
        List<Sub_Modalidad> Lista = new ArrayList<Sub_Modalidad>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Sub_Modalidad x = new Sub_Modalidad();
                x.setId_sub_modalidad(rs.getString("id_sub_modalidad"));
                x.setDe_sub_modalidad(rs.getString("de_sub_modalidad"));
                x.setCo_sub_modalidad(rs.getString("co_sub_modalidad"));
                x.setId_modalidad(rs.getString("id_modalidad"));
                Lista.add(x);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public String id_mod_x_id_con(String id_con) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT ID_MODALIDAD FROM RHTX_SUB_MODALIDAD WHERE ID_SUB_MODALIDAD=(SELECT ID_SUB_MODALIDAD FROM  RHTM_CONTRATO where ID_CONTRATO='"+id_con.trim()+"')";
        String id_mod = null;
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            id_mod = rs.getString("ID_MODALIDAD");
        } catch (Exception e) {
        } finally {
            this.conn.close();
        }
        return id_mod;
    }

    @Override
    public List<Map<String, ?>> Listar_Sub_mo_x_mod(String id_mod) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT * FROM RHTX_SUB_MODALIDAD where ID_MODALIDAD='"+id_mod.trim()+"'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_SUB_MODALIDAD"));
                rec.put("nombre", rs.getString("DE_SUB_MODALIDAD"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al cargar la lista de direcciones...");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return lista;
    }
    
}
