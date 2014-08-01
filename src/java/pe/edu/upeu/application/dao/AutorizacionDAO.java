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
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.factory.Conexion;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Autorizacion;
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
    public List<X_List_De_Autorizacion> List_Detalle_Autorizacion() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select  *  from ( select a.iddetalle_req_proceso,a.iddetalle_dgp, a.idpasos,d.idproceso,d.iddetalle_pasos , d.descripcion,d.nropaso\n"
                + ",d.cod , d.nombre ,d.puesto_id,d.direccion_id,d.departamento_id , d.idrequerimiento ,a.idautorizacion,a.fecha_creacion,a.estado \n"
                + ",a.user_creacion from ( select * from det_req_paso_pu where iddetalle_req_proceso='$iddreq') d left outer join autorizacion a \n"
                + "on ( a.idpasos=d.idpasos and a.iddetalle_dgp='$iddgp' and d.idpasos=a.idpasos and d.puesto_id=a.puesto_id) ) a \n"
                + ",detalle_dgp dgp , datos_trabajador dt , det_usuario du ,det_puesto_direccion pu where dgp.iddetalle_dgp=a.iddetalle_dgp \n"
                + "and dt.iddatos_trabajador = dgp.iddatos_trabajador and du.idusuario=a.user_creacion  and dgp.idpuesto=pu.puesto_id order by a.idpasos asc";

        return null;
    }

    @Override
    public List<Autorizacion> List_id_Autorizacion(String id_aurotizacion, String id_user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
        String sql = "select * from rhvd_req_paso_pu where id_detalle_req_proceso ='" + id_rpp + "' and trim(nu_pasos)='P1'";
        List<String> list = new ArrayList<String>();
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next() ;
                list.add(rs.getString("id_pasos"));
                list.add(rs.getString("id_proceso"));
                list.add(rs.getString("id_detalle_req_proceso"));
                list.add(rs.getString("id_detalle_pasos"));
                list.add(rs.getString("de_pasos"));
                list.add(rs.getString("nu_pasos"));
                list.add(rs.getString("co_pasos"));
                list.add(rs.getString("no_proceso"));
                list.add(rs.getString("id_puesto"));
                list.add(rs.getString("id_direccion"));
                list.add(rs.getString("id_departamento"));
                list.add(rs.getString("id_requerimiento"));
            

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public void Insert_Autorizacion(String ID_AUTORIZACION, String ID_DGP, String ES_AUTORIZACION, String NU_PASOS, String IP_USUARIO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String CO_PUESTO, String ID_PUESTO, String ID_DETALLE_REQ_PROCESO, String ID_PASOS) {
        CallableStatement cst;
        
        try {
            
            Connection cx = Conexion.getConex();
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = cx.prepareCall("{CALL RHSP_INSERT_AUTORIZACION( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cst.setString(1, null);
            cst.setString(2, "DGP-000823");
            cst.setString(3, "1");
            cst.setString(4, "P1");
            cst.setString(5, "");
            cst.setString(6, "USR-000057");
            cst.setString(7, "08/08/14");
            cst.setString(8, "");
            cst.setString(9, "");
            cst.setString(10, "SECR");
            cst.setString(11, "PUT-000136");
            cst.setString(12, "DRP-000001");
            cst.setString(13, "PAS-000001");
           cst.execute();
            /*
                cst.setString(1, null);
            cst.setString(2, ID_DGP);
            cst.setString(3, ES_AUTORIZACION);
            cst.setString(4, NU_PASOS);
            cst.setString(5, IP_USUARIO);
            cst.setString(6, US_CREACION);
            cst.setString(7, FE_CREACION);
            cst.setString(8, US_MODIF);
            cst.setString(9, FE_MODIF);
            cst.setString(10, CO_PUESTO);
            cst.setString(11, ID_PUESTO);
            cst.setString(12, ID_DETALLE_REQ_PROCESO);
            cst.setString(13, ID_PASOS);*/
        } catch (SQLException e) {
           // System.out.println(e.getMessage());
        } catch (Exception ex) {
            // Logger.getLogger(AutorizacionDAO.class.getName()).log(Level.SEVERE, null, ex);
         }finally{
            this.conn.close();
        }
    }

}
