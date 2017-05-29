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
import javax.swing.JOptionPane;

import pe.edu.upeu.application.dao_imp.InterfaceAreaDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Area;

/**
 *
 * @author Admin
 */
public class AreaDAO implements InterfaceAreaDAO {

    ConexionBD conn;

    @Override
    public Area getAreaById(String idArea) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from rhtd_area where id_area='" + idArea + "'";
        Area a = new Area();
        try {
            ResultSet rs = this.conn.query(sql);
            if (rs.next()) {
                a.setId_area(rs.getString("id_area"));
                a.setEs_area(rs.getString("es_area"));
                a.setId_departamento(rs.getString("id_departamento"));
                a.setNo_area(rs.getString("no_area"));
                a.setNo_corto_area(rs.getString("no_corto_area"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return a;
    }

    @Override
    public List<Area> List_Area() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from rhtd_area ";
        List<Area> list = new ArrayList<Area>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Area a = new Area();
                a.setId_area(rs.getString("id_area"));
                a.setEs_area(rs.getString("es_area"));
                a.setId_departamento(rs.getString("id_departamento"));
                a.setNo_area(rs.getString("no_area"));
                a.setNo_corto_area(rs.getString("no_corto_area"));
                list.add(a);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public List<Area> List_Area_ID(String id_departamento) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from rhtd_area ";
        sql += (id_departamento != "") ? "where id_departamento='" + id_departamento + "'" : "";
        List<Area> list = new ArrayList<Area>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Area a = new Area();
                a.setId_area(rs.getString("id_area"));
                a.setEs_area(rs.getString("es_area"));
                a.setId_departamento(rs.getString("id_departamento"));
                a.setNo_area(rs.getString("no_area"));
                a.setNo_corto_area(rs.getString("no_corto_area"));
                list.add(a);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public List<Map<String, ?>> List_area_id_json(String id_dep) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "Select * from rhtd_area where id_departamento='" + id_dep.trim() + "' order by no_area";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_AREA"));
                rec.put("nom", rs.getString("NO_AREA"));
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
    public List<Map<String, ?>> selec_area(String id_pu) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT ID_AREA FROM RHTR_SECCION where ID_SECCION=(SELECT ID_SECCION from RHTR_PUESTO where ID_PUESTO='" + id_pu.trim() + "')";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_area"));
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
    public List<Map<String, ?>> List_area_id_d(String id_dep) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "Select * from rhtd_area where id_departamento='" + id_dep.trim() + "' order by no_area";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_AREA"));
                rec.put("nombre", rs.getString("NO_AREA"));
                rec.put("ncorto", rs.getString("NO_CORTO_AREA"));
                rec.put("estado", rs.getString("ES_AREA"));
                rec.put("dep", rs.getString("ID_DEPARTAMENTO"));
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
    public List<Area> List_Area_Lima() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT NO_AREA FROM RHVD_PUESTO_DIRECCION where ID_DIRECCION='DIR-0002' OR ID_DIRECCION='DIR-0001' OR ID_DIRECCION='DIR-0003' OR ID_DIRECCION='DIR-0004' GROUP BY NO_AREA ORDER by NO_AREA";
        List<Area> list = new ArrayList<Area>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Area a = new Area();
                a.setNo_area(rs.getString("no_area"));
                list.add(a);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public boolean crear_area(String nombre, String ncorto, String estado, String idDep) {
        boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_AREA( ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, nombre);
            cst.setString(3, ncorto);
            cst.setString(4, estado);
            cst.setString(5, idDep);
            x = cst.execute();
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
    public boolean editar_area(String idArea, String nombre, String ncorto, String estado, String idDep) {
        boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MOD_AREA( ?, ?, ?, ?, ?)}");
            cst.setString(1, idArea);
            cst.setString(2, nombre);
            cst.setString(3, ncorto);
            cst.setString(4, estado);
            cst.setString(5, idDep);
            x = cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
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
    public boolean activar_area(String idArea) {
        boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_ACTIVAR_AREA(?)}");
            cst.setString(1, idArea);
            x = cst.execute();
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
    public boolean desactivar_area(String idArea) {
        boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_DESACTIVAR_AREA(?)}");
            cst.setString(1, idArea);
            x = cst.execute();
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
    public boolean eliminar_area(String idArea) {
        boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_ELIMINAR_AREA(?)}");
            cst.setString(1, idArea);
            x = cst.execute();
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
    public List<Map<String, ?>> List_area_es(String idDep) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "Select * from rhtd_area where id_departamento='" + idDep.trim() + "' and ES_AREA='1' order by no_area";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_AREA"));
                rec.put("nombre", rs.getString("NO_AREA"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error :" + e.getMessage());
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
