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
import pe.edu.upeu.application.dao_imp.InterfaceCentroCosto;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author Andres
 */
public class CentroCostoDAO implements InterfaceCentroCosto {

    ConexionBD cnn;
    String sql;

    @Override
    public List<Map<String, ?>> listarCcosto() {
        sql = "SELECT * FROM RHVD_CENTRO_COSTO";
        List<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<>();
                rec.put("ID_CENTRO_COSTO", rs.getString("ID_CENTRO_COSTO"));
                rec.put("CO_CENTRO_COSTO", rs.getString("CO_CENTRO_COSTO"));
                rec.put("DE_CENTRO_COSTO", rs.getString("DE_CENTRO_COSTO"));
                rec.put("ID_DEPARTAMENTO", rs.getString("ID_DEPARTAMENTO"));
                rec.put("NO_DEP", rs.getString("NO_DEP"));
                rec.put("ID_AREA", rs.getString("ID_AREA"));
                rec.put("NO_AREA", rs.getString("NO_AREA"));
                lista.add(rec);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            this.cnn.close();
        }
        return lista;
    }

    @Override
    public List<Map<String, ?>> listarCcosto(String idCCosto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Map<String, ?>> listarCcostoxdep(String idDep) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Map<String, ?>> listarCcostoxarea(String idArea) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean crearCCosto(String CO_CENTRO_COSTO, String DE_CENTRO_COSTO, String ID_DEPARTAMENTO, String ID_AREA) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean editarCCosto(String ID_CENTRO_COSTO, String CO_CENTRO_COSTO, String DE_CENTRO_COSTO, String ID_DEPARTAMENTO, String ID_AREA) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarCCosto(String ID_CENTRO_COSTO) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Map<String, ?>> List_Direccion() {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            sql = "select id_direccion,no_direccion from rhtx_direccion where ES_DIRECCION='1' order by NO_DIRECCION";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_direccion"));
                rec.put("nombre", rs.getString("no_direccion"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al cargar la lista de direcciones...");
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return lista;
    }

    @Override
    public List<Map<String, ?>> List_Depxdir(String iddep) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            sql = "SELECT E.ID_DEPARTAMENTO, E.NO_DEP FROM RHTX_DEPARTAMENTO E, RHTX_DIRECCION I\n"
                    + "WHERE E.ID_DIRECCION=I.ID_DIRECCION AND E.ID_DIRECCION='"+iddep+"'";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_DEPARTAMENTO"));
                rec.put("nombre", rs.getString("NO_DEP"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al cargar la lista de direcciones...");
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return lista;
    }

}
