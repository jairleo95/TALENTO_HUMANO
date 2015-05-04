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
import pe.edu.upeu.application.dao_imp.InterfaceSolicitud_RequerimientoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.V_Solicitud_Requerimiento;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author ALFA 3
 */
public class Solicitud_RequerimientoDAO implements InterfaceSolicitud_RequerimientoDAO {

    ConexionBD conn;
    CConversion c = new CConversion();

    @Override
    public List<V_Solicitud_Requerimiento> Listar_solicitud() {
        List<V_Solicitud_Requerimiento> lista = new ArrayList<>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select *  from RHVD_SOLICITUD_REQUERIMIENTO";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Solicitud_Requerimiento v = new V_Solicitud_Requerimiento();

                v.setNo_dep(rs.getString("no_dep"));
                v.setNo_area(rs.getString("no_area"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setId_solicitud_dgp(rs.getString("id_solicitud_dgp"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setNo_usuario_sol(rs.getString("no_usuario_sol"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setId_plazo(rs.getString("id_plazo"));
                v.setNo_plazo(rs.getString("no_plazo"));
                v.setDet_alerta(rs.getString("det_alerta"));
                v.setFe_desde_p(rs.getString("fe_desde_p"));
                v.setNo_usuario_modif(rs.getString("no_usuario_modif"));
                v.setNo_req(rs.getString("no_req"));
                v.setDe_solicitud(rs.getString("de_solicitud"));
                v.setEs_autorizar(rs.getString("es_autorizar"));
                v.setEs_solicitud_dgp(rs.getString("es_solicitud_dgp"));
                v.setTi_plazo(rs.getString("ti_plazo"));
                v.setFe_desde_s(rs.getString("fe_desde_s"));
                lista.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
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
    public List<V_Solicitud_Requerimiento> Listar_solicitud_id(String id_solicitud) {
        List<V_Solicitud_Requerimiento> lista = new ArrayList<>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select *  from RHVD_SOLICITUD_REQUERIMIENTO where  id_solicitud_dgp='" + id_solicitud.trim() + "'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Solicitud_Requerimiento v = new V_Solicitud_Requerimiento();

                v.setNo_dep(rs.getString("no_dep"));
                v.setNo_area(rs.getString("no_area"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setId_solicitud_dgp(rs.getString("id_solicitud_dgp"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setNo_usuario_sol(rs.getString("no_usuario_sol"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setId_plazo(rs.getString("id_plazo"));
                v.setNo_plazo(rs.getString("no_plazo"));
                v.setDet_alerta(rs.getString("det_alerta"));
                v.setFe_desde_p(rs.getString("fe_desde_p"));
                v.setNo_usuario_modif(rs.getString("no_usuario_modif"));
                v.setNo_req(rs.getString("no_req"));
                v.setDe_solicitud(rs.getString("de_solicitud"));
                v.setEs_autorizar(rs.getString("es_autorizar"));
                v.setEs_solicitud_dgp(rs.getString("es_solicitud_dgp"));
                v.setTi_plazo(rs.getString("ti_plazo"));
                v.setFe_desde_s(rs.getString("fe_desde_s"));
                lista.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
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
    public String INSERT_SOLICITUD_DGP(String ID_SOLICITUD_DGP, String FE_DESDE, String ID_DGP, String ID_PLAZO, String DE_SOLICITUD, String ES_AUTORIZAR, String ES_SOLICITUD_DGP, String IP_USUARIO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String NO_USUARIO) {
        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_SOLICITUD_DGP( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,? )} ");
            cst.setString(1, null);
            cst.setString(2, c.convertFecha(FE_DESDE));
            cst.setString(3, ID_DGP);
            cst.setString(4, ID_PLAZO);
            cst.setString(5, DE_SOLICITUD);
            cst.setString(6, "0");
            cst.setString(7, "1");
            cst.setString(8, IP_USUARIO);
            cst.setString(9, US_CREACION);
            cst.setString(10, FE_CREACION);
            cst.setString(11, US_MODIF);
            cst.setString(12, FE_MODIF);
            cst.setString(13, NO_USUARIO);
            cst.registerOutParameter(14, Types.CHAR);
            cst.execute();
            id = cst.getString(14);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return id;
    }

    @Override
    public List<V_Solicitud_Requerimiento> Listar_solicitud_id_us(String id_us) {
        List<V_Solicitud_Requerimiento> lista = new ArrayList<>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select *  from RHVD_SOLICITUD_REQUERIMIENTO where  US_CREACION='" + id_us.trim() + "'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Solicitud_Requerimiento v = new V_Solicitud_Requerimiento();

                v.setNo_dep(rs.getString("no_dep"));
                v.setNo_area(rs.getString("no_area"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setId_dgp(rs.getString("id_dgp"));
                v.setId_solicitud_dgp(rs.getString("id_solicitud_dgp"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setNo_usuario_sol(rs.getString("no_usuario_sol"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setId_plazo(rs.getString("id_plazo"));
                v.setNo_plazo(rs.getString("no_plazo"));
                v.setDet_alerta(rs.getString("det_alerta"));
                v.setFe_desde_p(rs.getString("fe_desde_p"));
                v.setNo_usuario_modif(rs.getString("no_usuario_modif"));
                v.setNo_req(rs.getString("no_req"));
                v.setDe_solicitud(rs.getString("de_solicitud"));
                v.setEs_autorizar(rs.getString("es_autorizar"));
                v.setEs_solicitud_dgp(rs.getString("es_solicitud_dgp"));
                v.setTi_plazo(rs.getString("ti_plazo"));
                v.setFe_desde_s(rs.getString("fe_desde_s"));
                v.setUs_creacion(rs.getString("us_creacion"));
                lista.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!");
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
    public List<Map<String, ?>> List_solicitud_id(String id) {
        List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select *  from RHVD_SOLICITUD_REQUERIMIENTO where  id_solicitud_dgp='" + id.trim() + "'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("nombre", rs.getString("NO_TRABAJADOR"));
                rec.put("ap_p", rs.getString("AP_MATERNO"));
                rec.put("ap_m", rs.getString("AP_PATERNO"));
                rec.put("ti_plazo", rs.getString("TI_PLAZO").trim());
                rec.put("plazo", rs.getString("NO_PLAZO"));
                rec.put("detalle_plazo", rs.getString("DET_ALERTA"));
                rec.put("fecha_plazo", rs.getString("fe_desde_s"));
                rec.put("id", rs.getString("ID_SOLICITUD_DGP"));
                rec.put("req", rs.getString("NO_REQ"));
                rec.put("solicitud", rs.getString("DE_SOLICITUD"));
                rec.put("mes", rs.getString("mes_s"));
                lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR: ...");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {

            }
        }
        return lista;
    }

    @Override
    public void procesar_solicitud(String tipo, String id_sol, String fecha, String usuario) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL rhsp_procesar_solicitud( ?, ?, ?, ?, ? )} ");
            cst.setString(1, tipo.trim());
            cst.setString(2, id_sol);
            cst.setString(3, fecha);
            cst.setString(4, FactoryConnectionDB.detalle_ip());
            cst.setString(5, usuario);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

}
