/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
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
        sql = "SELECT * FROM RHVD_CENTRO_COSTO where es_centro_costo='1'";
        List<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<>();
                rec.put("ID_CENTRO_COSTO", rs.getString("ID_CENTRO_COSTO"));
                rec.put("CO_CENTRO_COSTO", rs.getString("CO_CENTRO_COSTO"));
                rec.put("DE_CENTRO_COSTO", rs.getString("DE_CENTRO_COSTO"));
                rec.put("ID_DIRECCION", rs.getString("ID_DIRECCION"));
                rec.put("NO_DIRECCION", rs.getString("NO_DIRECCION"));
                rec.put("ID_DEPARTAMENTO", rs.getString("ID_DEPARTAMENTO"));
                rec.put("NO_DEP", rs.getString("NO_DEP"));
                rec.put("ID_AREA", rs.getString("ID_AREA"));
                rec.put("NO_AREA", rs.getString("NO_AREA"));
                rec.put("ID_SECCION", rs.getString("ID_SECCION"));
                rec.put("NO_SECCION", rs.getString("NO_SECCION"));
                rec.put("id_det_cc", rs.getString("ID_DEPART_CENTRO_COSTO"));
                lista.add(rec);
            }
       } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
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
    public List<Map<String, ?>> listarCcosto(String idCCosto) {

        sql = "SELECT * FROM RHVD_CENTRO_COSTO where id_centro_costo='" + idCCosto + "' and es_centro_costo ='1'";
        List<Map<String, ?>> lista = new ArrayList<>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<>();
                rec.put("ID_CENTRO_COSTO", rs.getString("ID_CENTRO_COSTO"));
                rec.put("CO_CENTRO_COSTO", rs.getString("CO_CENTRO_COSTO"));
                rec.put("DE_CENTRO_COSTO", rs.getString("DE_CENTRO_COSTO"));
                rec.put("ID_DIRECCION", rs.getString("ID_DIRECCION"));
                rec.put("NO_DIRECCION", rs.getString("NO_DIRECCION"));
                rec.put("ID_DEPARTAMENTO", rs.getString("ID_DEPARTAMENTO"));
                rec.put("NO_DEP", rs.getString("NO_DEP"));
                rec.put("ID_AREA", rs.getString("ID_AREA"));
                rec.put("NO_AREA", rs.getString("NO_AREA"));
                rec.put("ID_SECCION", rs.getString("ID_SECCION"));
                rec.put("NO_SECCION", rs.getString("NO_SECCION"));
                rec.put("id_det_cc", rs.getString("ID_DEPART_CENTRO_COSTO"));
                lista.add(rec);
            }
      } catch (SQLException ex) {
            throw new RuntimeException(ex.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
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
    public boolean crearCCosto(String CO_CENTRO_COSTO, String DE_CENTRO_COSTO, String ID_DEPARTAMENTO, String ID_AREA, String ID_SECCION) {
        boolean x = false;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.cnn.conex.prepareCall("{CALL RHSP_INSERT_CENTRO_COSTO( ?, ?, ?, ?, ?)}");
            cst.setString(1, CO_CENTRO_COSTO);
            cst.setString(2, DE_CENTRO_COSTO);
            cst.setString(3, ID_DEPARTAMENTO);
            cst.setString(4, ID_AREA);
            cst.setString(5, ID_SECCION);
            x = cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al REGISTRAR CENTRO DE COSTOS...");
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;
    }

    @Override
    public boolean editarCCosto(String ID_CENTRO_COSTO, String CO_CENTRO_COSTO, String DE_CENTRO_COSTO, String ID_DEPARTAMENTO, String ID_AREA, String ID_SECCION, String id_det_cc) {
        boolean x = true;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            System.out.println(ID_CENTRO_COSTO+" "+CO_CENTRO_COSTO+" "+DE_CENTRO_COSTO+" "+ID_DEPARTAMENTO+" "+ID_AREA+" "+ID_SECCION+" "+id_det_cc);
            CallableStatement cst = this.cnn.conex.prepareCall("{CALL RHSP_MOD_CENTRO_COSTO( ?, ?, ?, ?, ?, ?,?)}");
            
            cst.setString(1, ID_CENTRO_COSTO);
            cst.setString(2, CO_CENTRO_COSTO);
            cst.setString(3, DE_CENTRO_COSTO);
            cst.setString(4, ID_DEPARTAMENTO);
            cst.setString(5, ID_AREA);
            cst.setString(6, ID_SECCION);
            cst.setString(7, id_det_cc);
            cst.execute();
        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;
    }

    @Override
    public boolean eliminarCCosto(String ID_CENTRO_COSTO) {
        boolean x = true;
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.cnn.conex.prepareCall("{CALL RHSP_ELIMINAR_CENTRO_COSTO( ?)}");
            cst.setString(1, ID_CENTRO_COSTO);
            cst.execute();
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
        return x;
    }

    @Override
    public boolean AsignarCentroCosto(String ID_CENTRO_COSTO, String id_departamento, String id_area, String id_seccion) {
        boolean x = true;
        String id = "";
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.cnn.conex.prepareCall("{CALL RHSP_INSERT_DEPART_CENTRO_C( ?,?,?,?,?,?,?)}");
            cst.setString(1, null);
            cst.setString(2, id_departamento);
            cst.setString(3, id_area);
            cst.setString(4, id_seccion);
            cst.setString(5, null);
            cst.setString(6, ID_CENTRO_COSTO);
            cst.registerOutParameter(7, Types.CHAR);
            cst.execute();
            id = cst.getString(7);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error...");
        } finally {
            try {
                this.cnn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;
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
                    + "WHERE E.ID_DIRECCION=I.ID_DIRECCION AND E.ID_DIRECCION='" + iddep + "'";
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

    @Override
    public List<Map<String, ?>> List_Arxdep(String iddep) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            sql = "SELECT A.ID_AREA,A.NO_AREA\n"
                    + "FROM RHTD_AREA A, RHTX_DEPARTAMENTO D\n"
                    + "WHERE A.ID_DEPARTAMENTO=D.ID_DEPARTAMENTO\n"
                    + "AND D.ID_DEPARTAMENTO='" + iddep + "'";
            ResultSet rs = this.cnn.query(sql);
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
    public List<Map<String, ?>> List_SecxArea(String idArea) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            sql = "SELECT S.ID_SECCION, S.NO_SECCION\n"
                    + "FROM RHTR_SECCION S,RHTD_AREA R\n"
                    + "WHERE S.ID_AREA= R.ID_AREA\n"
                    + "AND R.ID_AREA='" + idArea + "'";
            ResultSet rs = this.cnn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("id", rs.getString("ID_SECCION"));
                rec.put("nombre", rs.getString("NO_SECCION"));
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
