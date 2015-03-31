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
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Puesto;
import pe.edu.upeu.application.model.V_Puesto_Direccion;

/**
 *
 * @author Admin
 */
public class PuestoDAO implements InterfacePuestoDAO {

    ConexionBD conn;

    @Override
    public boolean Guardar_Puesto() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Eliminar_Puesto() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Puesto> List_Puesto() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_puesto,no_puesto,no_corto_pu,es_puesto,id_seccion,co_grupo from rhtr_puesto ORDER BY no_puesto ASC";
        List<Puesto> list = new ArrayList<Puesto>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Puesto p = new Puesto();
                p.setCo_grupo(rs.getString("co_grupo"));
                p.setEs_puesto(rs.getString("es_puesto"));
                p.setId_puesto(rs.getString("id_puesto"));
                p.setId_seccion(rs.getString("id_seccion"));
                p.setNo_corto_pu(rs.getString("no_corto_pu"));
                p.setNo_puesto(rs.getString("no_puesto"));
                list.add(p);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<V_Puesto_Direccion> List_Puesto_Dep(String id_departamento) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select  * from RHVD_PUESTO_DIRECCION where id_departamento='" + id_departamento.trim() + "' ORDER BY no_puesto,no_seccion,no_area ASC";
        List<V_Puesto_Direccion> list = new ArrayList<V_Puesto_Direccion>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Puesto_Direccion p = new V_Puesto_Direccion();
                p.setNo_direccion(rs.getString("no_direccion"));
                p.setId_direccion(rs.getString("id_direccion"));
                p.setNo_dep(rs.getString("no_dep"));
                p.setId_departamento(rs.getString("id_departamento"));
                p.setNo_area(rs.getString("no_area"));
                p.setId_area(rs.getString("id_area"));
                p.setNo_seccion(rs.getString("no_seccion"));
                p.setId_seccion(rs.getString("id_seccion"));
                p.setNo_puesto(rs.getString("no_puesto"));
                p.setId_puesto(rs.getString("id_puesto"));
                list.add(p);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<V_Puesto_Direccion> List_Det_Puesto() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select  * from RHVD_PUESTO_DIRECCION ";
        List<V_Puesto_Direccion> list = new ArrayList<V_Puesto_Direccion>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Puesto_Direccion p = new V_Puesto_Direccion();
                p.setId_area(rs.getString("id_area"));
                p.setId_departamento(rs.getString("id_departamento"));
                p.setId_direccion(rs.getString("id_direccion"));
                p.setId_puesto(rs.getString("id_puesto"));
                p.setId_seccion(rs.getString("id_seccion"));
                p.setNo_area(rs.getString("no_area"));
                p.setNo_dep(rs.getString("no_dep"));
                p.setNo_direccion(rs.getString("no_direccion"));
                p.setNo_puesto(rs.getString("no_puesto"));
                p.setNo_seccion(rs.getString("no_seccion"));

                list.add(p);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Puesto> List_Id_Puesto(String id_puesto) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from rhtr_puesto where id_puesto = '" + id_puesto + "' ";
        List<Puesto> list = new ArrayList<Puesto>();
        try {
            ResultSet rs = this.conn.query(sql);
            Puesto p = new Puesto();
            while (rs.next()) {
                p.setCo_grupo(rs.getString("co_grupo"));
                p.setEs_puesto(rs.getString("es_puesto"));
                p.setId_puesto(rs.getString("id_puesto"));
                p.setId_seccion(rs.getString("id_seccion"));
                p.setNo_corto_pu(rs.getString("no_corto_pu"));
                p.setNo_puesto(rs.getString("no_puesto"));
                list.add(p);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public boolean Modif_Puesto(String id_puesto, String no_puesto, String no_corto_pu, String es_puesto, String id_seccion, String co_grupo) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "update rhtr_puesto set no_puesto = '" + no_puesto + ", no_corto_pu'= '" + no_corto_pu + ",es_puesto = '" + es_puesto + ",id_seccion = '" + id_seccion + " where id_puesto == '" + id_puesto + " ";
        try {
            ResultSet rs = this.conn.query("sql");
            rs.next();
            boolean modif = false;
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return true;
    }

    @Override
    public List<Map<String, ?>> Listar_Puesto_id(String id) {

        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = " select  *  from rhtr_puesto where id_seccion='" + id.trim() + "' order by no_puesto";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_puesto"));
                rec.put("nombre", rs.getString("no_puesto"));
                rec.put("ncorto", rs.getString("NO_CORTO_PU"));
                rec.put("estado", rs.getString("ES_PUESTO"));
                rec.put("cgrupo", rs.getString("CO_GRUPO"));

                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al cargar la lista de puestos");
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
    public List<Map<String, ?>> List_puesto() {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = " select  *  from rhtr_puesto order by no_puesto";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("id_puesto"));
                rec.put("nombre", rs.getString("no_puesto"));

                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al cargar la lista de puestos");
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
    public String List_Puesto_x_iddgp(String id_dgp) {

        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT v.ID_DIRECCION FROM RHVD_PUESTO_DIRECCION v where v.ID_PUESTO=(SELECT d.ID_PUESTO FROM RHTM_DGP d where d.id_dgp='" + id_dgp.trim() + "')";
        String Maxdgp = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Maxdgp = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Maxdgp;
    }
    @Override
    public List<Puesto> List_Puesto_lima() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT NO_PUESTO FROM RHVD_PUESTO_DIRECCION where ID_DIRECCION='DIR-0002' OR ID_DIRECCION='DIR-0001' OR ID_DIRECCION='DIR-0003' OR ID_DIRECCION='DIR-0004' GROUP BY NO_PUESTO ORDER by NO_PUESTO";
        List<Puesto> list = new ArrayList<Puesto>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Puesto p = new Puesto();
                p.setNo_puesto(rs.getString("NO_PUESTO"));
                list.add(p);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }
    @Override
    public void Registrar_Puesto_Paso(String ID_DETALLE_PASOS, String ID_PASOS, String ID_PUESTO, String ES_DETALLE_PASOS, String CO_PUESTO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_DETALLE_PASOS( ?, ?, ?, ?, ? )} ");
            cst.setString(1, null);
            cst.setString(2, ID_PASOS);
            cst.setString(3, ID_PUESTO);
            cst.setString(4, null);
            cst.setString(5, CO_PUESTO);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }
    @Override
    public String puesto(String id_cto) {
      this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT ID_PUESTO FROM RHTM_CONTRATO where ID_CONTRATO='"+id_cto.trim()+"'";
        ResultSet rs = this.conn.query(sql);
        String id = null;
        try {
            rs.next();
            id = rs.getString(1);
        } catch (SQLException ex) {
            //Logger.getLogger(AnnoDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.conn.close();
        }
        return id;
    }

    @Override
    public String List_Puesto_x_id_con(String id_contrato) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT v.ID_DIRECCION FROM RHVD_PUESTO_DIRECCION v where v.ID_PUESTO=(SELECT d.ID_PUESTO FROM RHTM_CONTRATO d where d.ID_CONTRATO='"+id_contrato.trim()+"')";
        String Maxdgp = null;
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Maxdgp = rs.getString(1);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return Maxdgp;
    }

    @Override
    public boolean crear_puesto(String nombre, String ncorto, String estado, String cgrupo, String idSec) {
        boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_PUESTO( ?, ?, ?, ?, ?,?)}");
            cst.setString(1, null);
            cst.setString(2, nombre);
            cst.setString(3, ncorto);
            cst.setString(4, estado);
            cst.setString(5, idSec);
            cst.setString(6, cgrupo);
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
    public boolean editar_puesto(String id, String nombre, String ncorto, String estado, String cgrupo, String idSec) {
        boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_MOD_PUESTO( ?, ?, ?, ?, ?,?)}");
            cst.setString(1, id);
            cst.setString(2, nombre);
            cst.setString(3, ncorto);
            cst.setString(4, estado);
            cst.setString(5, idSec);
            cst.setString(6, cgrupo);
            x = cst.execute();
        } catch (SQLException e) {
            System.out.println(e);
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
    public boolean activar_puesto(String id) {
        boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_ACTIVAR_PUESTO(?)}");
            cst.setString(1, id);
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
    public boolean desactivar_puesto(String id) {
        boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_DESACTIVAR_PUESTO(?)}");
            cst.setString(1, id);
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
    public boolean eliminar_puesto(String id) {
        boolean x = false;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_ELIMINAR_PUESTO(?)}");
            cst.setString(1, id);
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
}
