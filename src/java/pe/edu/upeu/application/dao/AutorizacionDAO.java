/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Autorizacion;
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
    public boolean Insert_Autorizacion(String id_autorizacion, String id_dgp, String estado, String nu_pasos, String ip_usuario, String user_creacion, String FECHA_CREACION, String USER_MODIF, String FECHA_MODIF, String COD, String id_puesto, String ID_DETALLE_REQ_PROCESO, String IDPASOS) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Autorizacion> Det_Autorizacion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String Max_Id_Autorizacion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<X_List_De_Autorizacion> List_Detalle_Autorizacion() {
       this.conn=FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select  *  from ( select a.iddetalle_req_proceso,a.iddetalle_dgp, a.idpasos,d.idproceso,d.iddetalle_pasos , d.descripcion,d.nropaso\n" +
    ",d.cod , d.nombre ,d.puesto_id,d.direccion_id,d.departamento_id , d.idrequerimiento ,a.idautorizacion,a.fecha_creacion,a.estado \n" +
    ",a.user_creacion from ( select * from det_req_paso_pu where iddetalle_req_proceso='$iddreq') d left outer join autorizacion a \n" +
    "on ( a.idpasos=d.idpasos and a.iddetalle_dgp='$iddgp' and d.idpasos=a.idpasos and d.puesto_id=a.puesto_id) ) a \n" +
    ",detalle_dgp dgp , datos_trabajador dt , det_usuario du ,det_puesto_direccion pu where dgp.iddetalle_dgp=a.iddetalle_dgp \n" +
    "and dt.iddatos_trabajador = dgp.iddatos_trabajador and du.idusuario=a.user_creacion  and dgp.idpuesto=pu.puesto_id order by a.idpasos asc";
        
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

}
