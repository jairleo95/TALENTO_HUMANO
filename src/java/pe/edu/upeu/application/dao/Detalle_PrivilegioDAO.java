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
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceDetalle_PrivilegioDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Detalle_Privilegio;
import pe.edu.upeu.application.model.X_Detalle_Privilegio;

/**
 *
 * @author joserodrigo
 */
public class Detalle_PrivilegioDAO implements InterfaceDetalle_PrivilegioDAO {

    private ConexionBD conn;

    @Override
    public void Registrar_Detalle_Priv(String id_rol, String nu_orden, String id_priv, String es_detalle_priv) {
        CallableStatement cst;
        try {
            String id_det_priv = "";
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_DET_PRIV(?,?,?,?,?)}");
            cst.setString(1, id_det_priv.trim());
            cst.setString(2, id_rol.trim());
            cst.setString(3, nu_orden.trim());
            cst.setString(4, id_priv.trim());
            cst.setString(5, es_detalle_priv.trim());
            cst.execute();
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
    }

    @Override
    public void Mod_Detalle_Priv(String id_det_pri, int nu_orden, String id_priv, String es_detalle_priv) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_DET_PRIV(?,?,?,?)}");
            cst.setString(1, id_det_pri);
            cst.setString(2, id_priv);
            cst.setInt(3, nu_orden);
            cst.setString(4, es_detalle_priv);
            cst.execute();
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
    }

    @Override
    public void Elim_Detalle_Priv(String ID_pri_rol) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_ELIMINAR_DET_PRI(?)}");
            cst.setString(1, ID_pri_rol);
            cst.execute();
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
    }

    @Override
    public List<Detalle_Privilegio> List_det_pr_id(String id_pr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHTD_DETALLE_PRIVILEGIO where ID_DETALLE_PRIVILEGIO ='" + id_pr + "'";
        List<Detalle_Privilegio> list = new ArrayList<Detalle_Privilegio>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Detalle_Privilegio icd = new Detalle_Privilegio();
                icd.setId_detalle_privilegio(rs.getString("id_detalle_privilegio"));
                icd.setId_rol(rs.getString("id_rol"));
                icd.setNu_orden(rs.getInt("nu_orden"));
                icd.setId_privilegio(rs.getString("id_privilegio"));
                icd.setEs_detalle_privilegio(rs.getString("es_detalle_privilegio"));
                list.add(icd);
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
    public List<X_Detalle_Privilegio> List_det_pri_id(String id_pr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select d.*,r.NO_ROL from RHTD_DETALLE_PRIVILEGIO d, RHTR_ROL r where d.ID_ROL=r.ID_ROL and d.ID_DETALLE_PRIVILEGIO ='" + id_pr + "'";
        List<X_Detalle_Privilegio> list = new ArrayList<X_Detalle_Privilegio>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                X_Detalle_Privilegio x = new X_Detalle_Privilegio();
                x.setId_detalle_privilegio(rs.getString("Id_detalle_privilegio"));
                x.setEs_datalle_privilegio(rs.getString("ES_DETALLE_PRIVILEGIO"));
                x.setNu_orden(rs.getInt("Nu_orden"));
                x.setNo_rol(rs.getString("No_rol"));
                x.setId_rol(rs.getString("Id_rol"));
                x.setId_privilegio(rs.getString("Id_privilegio"));
                list.add(x);
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
    public void Desc_r_pr(String id_pr_r) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_DESACTIVAR_DET_PRI(?)}");
            cst.setString(1, id_pr_r);
            cst.execute();
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
    }

    @Override
    public void Act_r_pr(String id_pr_r) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_ACTIVAR_DET_PRI(?)}");
            cst.setString(1, id_pr_r);
            cst.execute();
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
    }

}
