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
import pe.edu.upeu.application.dao_imp.InterfaceDepartamentoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Departamento;

/**
 *
 * @author Admin
 */
public class DepartamentoDao implements InterfaceDepartamentoDAO {

    ConexionBD conn;

    @Override
    public List<Departamento> List_Departamento() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtx_departamento ORDER BY NO_DEP";
        List<Departamento> list = new ArrayList<Departamento>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Departamento d = new Departamento();
                d.setEs_departamento(rs.getString("es_departamento"));
                d.setId_departamento(rs.getString("id_departamento"));
                d.setId_direccion(rs.getString("id_direccion"));
                d.setNo_corto_dep(rs.getString("no_corto_dep"));
                d.setNo_dep(rs.getString("no_dep"));
                list.add(d);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Map<String, ?>> List_departamento_2() {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select * from rhtx_departamento order by no_dep";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_departamento"));
                rec.put("nom", rs.getString("no_dep"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }

    @Override
    public List<Map<String, ?>> dep_id(String id_pu) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT ID_DEPARTAMENTO FROM RHVD_PUESTO_DIRECCION where ID_PUESTO='"+id_pu.trim()+"'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_DEPARTAMENTO"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return lista;
    }

    @Override
    public List<Map<String, ?>> Listar_dep_id(String id) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT ID_DEPARTAMENTO, NO_DEP FROM RHVD_PUESTO_DIRECCION WHERE ID_DIRECCION='"+id+"' GROUP BY ID_DEPARTAMENTO, NO_DEP ORDER BY NO_DEP";
            ResultSet rs = this.conn.query(sql);
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
            throw new RuntimeException("Error al cargar la lista de deparatamentos");
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
    public List<Departamento> List_Departamento_Lima() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT NO_DEP FROM RHVD_PUESTO_DIRECCION where ID_DIRECCION='DIR-0002' OR ID_DIRECCION='DIR-0001' OR ID_DIRECCION='DIR-0003' OR ID_DIRECCION='DIR-0004' GROUP BY NO_DEP ORDER by NO_DEP";
        List<Departamento> list = new ArrayList<Departamento>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Departamento d = new Departamento();
                d.setNo_dep(rs.getString("no_dep"));
                list.add(d);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Map<String, ?>> Listar_dep_x_dir(String id_de) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select  d.NO_DEP, d.NO_CORTO_DEP, d.ES_DEPARTAMENTO, d.ID_DEPARTAMENTO\n" +
                            "from rhtx_departamento d, rhtx_direccion r\n" +
                            "where d.ID_DIRECCION=r.ID_DIRECCION and d.ID_DIRECCION='"+id_de.trim()+"' and r.ES_DIRECCION='1'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_DEPARTAMENTO"));
                rec.put("nombre", rs.getString("NO_DEP"));
                rec.put("ncorto", rs.getString("NO_CORTO_DEP"));
                rec.put("estado", rs.getString("ES_DEPARTAMENTO"));
                Lista.add(rec);
    }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
            }
        }
        return Lista;
    }

    @Override
    public boolean Editar_Dep(String id, String nombre, String ncorto, String estado) {
        boolean x=false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MOD_DEPARTAMENTO( ?, ?, ?, ?)}");
            cst.setString(1, id);
            cst.setString(2, nombre);
            cst.setString(3, ncorto);
            cst.setString(4, estado);
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
    public boolean Crear_Dep(String nombre, String ncorto, String estado, String idDir) {
        boolean x=false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_DEPARTAMENTO( ?, ?, ?, ?)}");
            cst.setString(1, nombre);
            cst.setString(2, ncorto);
            cst.setString(3, estado);
            cst.setString(4, idDir);
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
    public boolean Eliminar_Dep(String id) {
        boolean x=false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_ELIMINAR_DEPARTAMENTO(?)}");
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
    public boolean Activar_Dep(String id) {
        boolean x=false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_ACTIVAR_DEPARTAMENTO(?)}");
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
    public boolean Desactivar_Dep(String id) {
         boolean x=false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_DESACTIVAR_DEPARTAMENTO(?)}");
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


}
