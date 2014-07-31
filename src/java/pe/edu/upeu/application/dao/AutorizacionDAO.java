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
import java.util.logging.Level;
import java.util.logging.Logger;
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Autorizacion;
import pe.edu.upeu.application.model.V_Req_Paso_Pu;
import pe.edu.upeu.application.model.X_List_De_Autorizacion;

/**
 *
 * @author Admin
 */
public class AutorizacionDAO implements InterfaceAutorizacionDAO {

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
    public boolean Insert_Autorizacion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<V_Req_Paso_Pu> Det_Autorizacion(String id_rpp, String nu_pasos) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhvd_req_paso_pu where id_detalle_req_proceso ='" + id_rpp + "' and trim(nu_pasos)='" + nu_pasos + "'";
        List<V_Req_Paso_Pu> list = new ArrayList<V_Req_Paso_Pu>();
        try {
            ResultSet rs = this.conn.query(sql);
            V_Req_Paso_Pu rpp = new V_Req_Paso_Pu();

            while (rs.next()) {
                rpp.setId_pasos(rs.getString("id_pasos"));
                rpp.setId_proceso(rs.getString("id_proceso"));
                rpp.setId_detalle_req_proceso(rs.getString("id_detalle_req_proceso"));
                rpp.setId_detalle_pasos(rs.getString("id_detalle_pasos"));
                rpp.setDe_pasos(rs.getString("de_pasos"));
                rpp.setNu_pasos(rs.getString("nu_pasos"));
                rpp.setCo_pasos(rs.getString("co_pasos"));
                rpp.setNo_proceso(rs.getString("no_proceso"));
                rpp.setId_puesto(rs.getString("id_puesto"));
                rpp.setId_direccion(rs.getString("id_direccion"));
                rpp.setId_departamento(rs.getString("id_departamento"));
                rpp.setId_requerimiento(rs.getString("id_requerimiento"));
                list.add(rpp);
            }

        } catch (SQLException e) {
        }finally{
        this.conn.close();
        }
        return list;
    }

}
