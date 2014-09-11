/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.factory.Conexion;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Autorizacion;
import pe.edu.upeu.application.model.V_Autorizar_Dgp;
import pe.edu.upeu.application.model.X_List_De_Autorizacion;
import pe.edu.upeu.application.web.controller.CConversion;

/**
 *
 * @author Admin
 */
public class AutorizacionDAO implements InterfaceAutorizacionDAO {

    CConversion c = new CConversion();
    ConexionBD conn;

    @Override
    public boolean Guardar_Autorizacion(String id_autorizacion, String id_dgp, String id_proceso, String estado, String detalle, String nu_pasos) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Max_Id_Autorizacion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<X_List_De_Autorizacion> List_Detalle_Autorizacion(String iddgp, String idrp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select  pu.NO_PUESTO,a.co_pasos,a.DE_PASOS,a.es_autorizacion,a.fe_creacion,a.id_autorizacion,a.id_departamento,a.id_detalle_pasos,a.id_detalle_req_proceso,a.id_dgp,a.id_direccion,a.id_pasos,a.id_proceso,a.id_puesto,a.id_requerimiento,a.no_proceso,a.nu_pasos,a.us_creacion ,  dt.AP_PATERNO,dt.AP_MATERNO,dt.NO_TRABAJADOR,dgp.CA_SUELDO, du.AP_PATERNO as us_ap_p,du.AP_MATERNO as us_ap_mat ,du.NO_TRABAJADOR as  us_no_tr,du.NO_PUESTO as us_no_puesto,du.NO_AREA as us_no_area,du.NO_DEP as us_no_dep   from ( select a.id_detalle_req_proceso,a.id_dgp, a.id_pasos,d.id_proceso,d.id_detalle_pasos , d.DE_PASOS,d.NU_PASOS,d.CO_PASOS , d.no_proceso ,d.id_puesto,d.id_direccion,d.id_departamento , d.id_requerimiento ,a.id_autorizacion,a.fe_creacion,a.es_autorizacion,a.us_creacion from ( select * from rhvd_req_paso_pu where id_detalle_req_proceso='" + idrp.trim() + "') d left outer join rhtv_autorizacion a on ( a.id_pasos=d.id_pasos and a.id_dgp='" + iddgp.trim() + "' and d.id_pasos=a.id_pasos and d.id_puesto=a.id_puesto) ) a ,rhtm_dgp dgp , rhtm_trabajador dt , rhvd_usuario du ,rhvd_puesto_direccion pu where dgp.id_dgp=a.id_dgp and dt.id_trabajador = dgp.id_trabajador and du.id_usuario=a.us_creacion  and dgp.id_puesto=pu.id_puesto order by a.id_pasos asc";
        List<X_List_De_Autorizacion> list = new ArrayList<X_List_De_Autorizacion>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                X_List_De_Autorizacion x = new X_List_De_Autorizacion();
                x.setCo_pasos(rs.getString("co_pasos"));
                x.setDe_pasos(rs.getString("de_pasos"));
                x.setEs_autorizacion(rs.getString("es_autorizacion"));
                x.setFe_creacion(rs.getString("fe_creacion"));
                x.setId_autorizacion(rs.getString("id_autorizacion"));
                x.setId_departamento(rs.getString("id_departamento"));
                x.setId_detalle_pasos(rs.getString("id_detalle_pasos"));
                x.setId_detalle_req_proceso(rs.getString("id_detalle_req_proceso"));
                x.setId_dgp(rs.getString("id_dgp"));
                x.setId_direccion(rs.getString("id_direccion"));
                x.setId_pasos(rs.getString("id_pasos"));
                x.setId_proceso(rs.getString("id_proceso"));
                x.setId_puesto(rs.getString("id_puesto"));
                x.setId_requerimiento(rs.getString("id_requerimiento"));
                x.setNo_proceso(rs.getString("no_proceso"));
                x.setNu_pasos(rs.getString("nu_pasos"));
                x.setUs_creacion(rs.getString("us_creacion"));
                x.setAP_PATERNO(rs.getString("ap_paterno"));
                x.setAP_MATERNO(rs.getString("ap_materno"));
                x.setNO_TRABAJADOR(rs.getString("no_trabajador"));
                x.setCA_SUELDO(rs.getString("ca_sueldo"));
                x.setUs_ap_p(rs.getString("us_ap_p"));
                x.setUs_ap_mat(rs.getString("us_ap_mat"));
                x.setUs_no_tr(rs.getString("us_no_tr"));
                x.setUs_no_puesto(rs.getString("us_no_puesto"));
                x.setUs_no_area(rs.getString("us_no_area"));
                x.setUs_no_dep(rs.getString("us_no_dep"));
                x.setNo_puesto(rs.getString("no_puesto"));

                list.add(x);
            }

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;
    }

    @Override
    public List<V_Autorizar_Dgp> List_id_Autorizacion(String id, String id_user) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select *  from rhvd_autorizar_dgp where id_puesto='" + id + "'";
        sql += (!"".equals(id_user)) ? " and id_usuario='" + id_user + "'" : "";

        List<V_Autorizar_Dgp> list = new ArrayList<V_Autorizar_Dgp>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Autorizar_Dgp x = new V_Autorizar_Dgp();
                x.setId_trabajador(rs.getString("id_trabajador"));
                x.setNo_trabajador(rs.getString("no_trabajador"));
                x.setAp_paterno(rs.getString("ap_paterno"));
                x.setAp_materno(rs.getString("ap_materno"));
                x.setNo_puesto(rs.getString("no_puesto"));
                x.setNu_pasos(rs.getString("nu_pasos"));
                x.setId_dgp(rs.getString("id_dgp"));
                x.setCo_pasos(rs.getString("co_pasos"));
                x.setId_detalle_req_proceso(rs.getString("id_detalle_req_proceso"));
                x.setDe_pasos(rs.getString("de_pasos"));
                x.setId_departamento(rs.getString("id_departamento"));
                x.setId_puesto(rs.getString("id_puesto"));
                x.setId_requerimiento(rs.getString("id_requerimiento"));
                x.setId_tipo_planilla(rs.getString("id_tipo_planilla"));
                x.setNo_req(rs.getString("no_req"));
                x.setId_pasos(rs.getString("id_pasos"));
                x.setNo_usuario(rs.getString("no_usuario"));
                x.setNo_seccion(rs.getString("no_seccion"));
                x.setNo_area(rs.getString("no_area"));
                list.add(x);
            }

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Autorizacion> NO_List_DGP() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Elim_Aut(String id_Autorizacion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int Val_Aut_DGP_M(String id_dgp) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<String> Det_Autorizacion(String id_rpp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhvd_req_paso_pu where id_detalle_req_proceso ='" + id_rpp.trim() + "' and trim(nu_pasos)='P1'";
        List<String> list = new ArrayList<String>();
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            list.add(rs.getString("id_pasos"));
             list.add(rs.getString("id_puesto"));
           /* list.add(rs.getString("id_proceso"));
            list.add(rs.getString("id_detalle_req_proceso"));
            list.add(rs.getString("id_detalle_pasos"));
            list.add(rs.getString("de_pasos"));
            list.add(rs.getString("nu_pasos"));
            list.add(rs.getString("co_pasos"));
            list.add(rs.getString("no_proceso"));
           
            list.add(rs.getString("id_direccion"));
            list.add(rs.getString("id_departamento"));
            list.add(rs.getString("id_requerimiento"));*/

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public void Insert_Autorizacion(String ID_AUTORIZACION, String ID_DGP, String ES_AUTORIZACION, String NU_PASOS, String IP_USUARIO, String US_CREACION, String US_MODIF, String FE_MODIF, String CO_PUESTO, String ID_PUESTO, String ID_DETALLE_REQ_PROCESO, String ID_PASOS) {
        CallableStatement cst;

        try {

            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_INSERT_AUTORIZACION( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, ID_DGP);
            cst.setString(3, ES_AUTORIZACION);
            cst.setString(4, NU_PASOS);
            cst.setString(5, IP_USUARIO);
            cst.setString(6, US_CREACION);
            cst.setString(7, US_MODIF);
            cst.setString(8, FE_MODIF);
            cst.setString(9, CO_PUESTO);
            cst.setString(10, ID_PUESTO);
            cst.setString(11, ID_DETALLE_REQ_PROCESO);
            cst.setString(12, ID_PASOS);
            cst.execute();

        } catch (SQLException e) {
            // System.out.println(e.getMessage());
        } catch (Exception ex) {
            // Logger.getLogger(AutorizacionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.conn.close();
        }
    }

}
