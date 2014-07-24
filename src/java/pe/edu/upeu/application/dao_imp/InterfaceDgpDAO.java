/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.X_List_det_dgp;
import pe.edu.upeu.application.model.X_User_dgp;
import pe.edu.upeu.application.model.x_List_Id_Trab_Dgp;

/**
 *
 * @author Jose
 */
public interface InterfaceDgpDAO {
    public List<X_User_dgp> USER_DGP(String id_dgp);
    public boolean INSERT_DETALLE_DGP(String IDDETALLE_DGP , 
        String FEC_DESDE , 
        String FEC_HASTA , 
        String SUELDO , 
        String DIAS_TRABAJO , 
        String HORARIO , 
        String IDPUESTO ,   
        String IDREQUERIMIENTO , 
        String IDDATOS_TRABAJADOR , 
        String RUC , 
        String LUGAR_SERVICIO , 
        String DESCRIPCION_SERVICIO , 
        String PERIODO_PAGO , 
        String DOMICILIO_FISCAL , 
        String SUBVENCION , 
        String HORARIO_CAPACITACION , 
        String HORARIO_REFRIGERIO , 
        String DIAS_CAPACITACION , 
        String ESTADO , 
        String USER_CREACION , 
        String FECHA_CREACION , 
        String USER_MODIF , 
        String FECHA_MODIF , 
        String USUARIO_IP , 
        String BONO_ALIMENTARIO , 
        String BEV , 
        String CENTRO_COSTOS , 
        String ANTECEDENTES_POLICIALES , 
        String CERTIFICADO_SALUD , 
        String MONTO_HONORARIO );
  public List<x_List_Id_Trab_Dgp> LIST_ID_TRAB_DGP(String id);
  public List<X_List_det_dgp>LIST_DET_DGP(String id_dep);
}
