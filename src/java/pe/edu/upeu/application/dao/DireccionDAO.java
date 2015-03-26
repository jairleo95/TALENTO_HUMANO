/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Direccion;
import pe.edu.upeu.application.model.Via;
import pe.edu.upeu.application.model.Zona;

/**
 *
 * @author joserodrigo
 */
public class DireccionDAO implements InterfaceDireccionDAO {

    ConexionBD conn;

    @Override
    public List<Direccion> Listar_Direccion() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select * from RHTX_DIRECCION order by NO_DIRECCION";
        List<Direccion> Lista = new ArrayList<Direccion>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Direccion x = new Direccion();
                x.setId_direccion(rs.getString("id_direccion"));
                x.setNo_direccion(rs.getString("no_direccion"));
                x.setNo_corto_dir(rs.getString("no_corto_dir"));
                x.setId_filial(rs.getString("id_filial"));
                x.setEs_direccion(rs.getString("es_direccion"));
                Lista.add(x);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public List<Via> Listar_via() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select * from RHTX_VIA";
        List<Via> Lista = new ArrayList<Via>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Via x = new Via();
                x.setId_via(rs.getString("id_via"));
                x.setDe_via(rs.getString("de_via"));
                x.setCo_via(rs.getString("co_via"));
                Lista.add(x);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public List<Zona> Listar_zona() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " select * from RHTX_ZONA";
        List<Zona> Lista = new ArrayList<Zona>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Zona x = new Zona();
                x.setId_zona(rs.getString("id_zona"));
                x.setDe_zona(rs.getString("de_zona"));
                x.setCo_zona(rs.getString("co_zona"));
                Lista.add(x);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            this.conn.close();
        }
        return Lista;
    }

    @Override
    public List<Map<String, ?>> List_Direccion() {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select * from rhtx_direccion order by NO_DIRECCION";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_direccion"));
                rec.put("nombre", rs.getString("no_direccion"));
                rec.put("nom_corto", rs.getString("no_corto_dir"));
                rec.put("filial", rs.getString("id_filial"));
                rec.put("estado", rs.getString("es_direccion"));
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

    @Override
    public boolean Editar_Direccion(String id, String nombre, String ncorto, String estado, String filial) {
        boolean x=false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MOD_DIRECCION( ?, ?, ?, ?, ?)}");
            cst.setString(1, id);
            cst.setString(2, nombre);
            cst.setString(3, ncorto);
            cst.setString(4, estado);
            cst.setString(5, filial);
            x=cst.execute();
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
        return x;
    }

    @Override
    public boolean Crear_Direccion(String nombre, String ncorto, String estado, String filial) {
        boolean x=false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_DIRECCION( ?, ?, ?, ?)}");
            cst.setString(1, nombre);
            cst.setString(2, ncorto);
            cst.setString(3, estado);
            cst.setString(4, filial);
            x=cst.execute();
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
        return x;
    }

    @Override
    public boolean Eliminar_Direccion(String id) {
        boolean x=false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_ELIMINAR_DIRECCION(?)}");
            cst.setString(1, id);
            x=cst.execute();
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
        return x;
    }

    @Override
    public boolean Activar_Direccion(String id) {
        boolean x=false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_ACTIVAR_DIRECCION(?)}");
            cst.setString(1, id);
            x=cst.execute();
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
        return x;
    }

    @Override
    public boolean Desactivar_Direccion(String id) {
        boolean x=false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_DESACTIVAR_DIRECCION(?)}");
            cst.setString(1, id);
            x=cst.execute();
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
        return x;
    }

    @Override
    public List<Map<String, ?>> List_Direccion_estado() {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select * from rhtx_direccion where ES_DIRECCION='1' order by NO_DIRECCION";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_direccion"));
                rec.put("nombre", rs.getString("no_direccion"));
                rec.put("nom_corto", rs.getString("no_corto_dir"));
                rec.put("filial", rs.getString("id_filial"));
                rec.put("estado", rs.getString("es_direccion"));
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
