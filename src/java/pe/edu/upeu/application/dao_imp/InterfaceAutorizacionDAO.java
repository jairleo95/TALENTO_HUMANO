/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Autorizacion;
import pe.edu.upeu.application.model.V_Autorizar_Dgp;
import pe.edu.upeu.application.model.X_List_De_Autorizacion;

/**
 *
 * @author Admin
 */
public interface InterfaceAutorizacionDAO {

    public void Insert_Autorizacion(String ID_AUTORIZACION, String ID_DGP, String ES_AUTORIZACION, String NU_PASOS, String IP_USUARIO, String US_CREACION, String US_MODIF, String FE_MODIF, String CO_PUESTO, String ID_PUESTO, String ID_DETALLE_REQ_PROCESO, String ID_PASOS);

    public String Insert_Autorizacion_dev(String ID_AUTORIZACION, String ID_DGP, String ES_AUTORIZACION, String NU_PASOS, String IP_USUARIO, String US_CREACION, String US_MODIF, String FE_MODIF, String CO_PUESTO, String ID_PUESTO, String ID_DETALLE_REQ_PROCESO, String ID_PASOS);

    public List<String> Det_Autorizacion(String id_rpp);

    public List<X_List_De_Autorizacion> List_Detalle_Autorizacion(String iddgp, String idrp);

    public List<V_Autorizar_Dgp> List_id_Autorizacion(String id_aurotizacion, String id_user, String iddgp);

    public List<V_Autorizar_Dgp> List_Autorizacion_Academico(String id_aurotizacion, String id_user, String iddgp);

    public List<Autorizacion> NO_List_DGP();

    public void Elim_Aut(String id_Autorizacion);

    public void Insert_comentario_Aut(String ID_COMENTARIO_DGP_SP, String id_autorizacion, String id_dgp, String us_creacion, String es_comentario, String fe_creacion, String comentario);

    public int Val_Aut_DGP_M(String id_dgp);

    public List<V_Autorizar_Dgp> List_Autorizados(String id_puesto);

    public String Mes_plazo(String id_dgp);

    public List<Map<String, ?>> List_Dgp_Autorizados(String id_usuario, int pageNumber, int pageSize, int mes, String año);

    public Integer getListAuthorizeRequirementsSize(String id_usuario, int mes, String año);

    public List<Map<String, ?>> List_procesar_req(boolean tipo_list, boolean permisoAsigFam, boolean permisoEsSistema);

    public boolean UpdateDgp_EstadoProcesar(String[] iddgp, int tipo, boolean estado);

    public List<Map<String, ?>> ShowCkbEstado_procesarIndiviual(String iddgp);
}
