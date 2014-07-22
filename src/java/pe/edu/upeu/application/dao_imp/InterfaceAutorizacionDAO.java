/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;


/**
 *
 * @author Admin
 */
public interface InterfaceAutorizacionDAO {
    
    public boolean Guardar_Autorizacion(String id_autorizacion,String id_dgp,String id_proceso, String estado,String detalle,String nu_pasos);
    public boolean Insert_Autorizacion(String id_autorizacion, String id_dgp,String estado, String nu_pasos, String ip_usuario, String user_creacion,String FECHA_CREACION,String USER_MODIF,String FECHA_MODIF,String COD,String id_puesto,String ID_DETALLE_REQ_PROCESO,String IDPASOS);

}
