/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.DGP;
import pe.edu.upeu.application.model.V_Det_DGP;
import pe.edu.upeu.application.model.V_Es_Requerimiento;
import pe.edu.upeu.application.model.V_Estado_req;
import pe.edu.upeu.application.model.X_List_det_dgp;
import pe.edu.upeu.application.model.X_List_dgp_by;
import pe.edu.upeu.application.model.X_User_dgp;
import pe.edu.upeu.application.model.X_val_tra_dgp;
import pe.edu.upeu.application.model.x_List_Id_Trab_Dgp;

/**
 *
 * @author Jose
 */
public interface InterfaceDgpDAO {

    public List<X_User_dgp> USER_DGP(String id_dgp);

    public void INSERT_DGP(String ID_DGP, String FE_DESDE, String FE_HASTA, double CA_SUELDO, String DE_DIAS_TRABAJO, String ID_PUESTO, String ID_REQUERIMIENTO, String ID_TRABAJADOR, String CO_RUC, String DE_LUGAR_SERVICIO, String DE_SERVICIO, String DE_PERIODO_PAGO, String DE_DOMICILIO_FISCAL, String DE_SUBVENCION, String DE_HORARIO_CAPACITACION, String DE_HORARIO_REFRIGERIO, String DE_DIAS_CAPACITACION, String ES_DGP, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, double CA_BONO_ALIMENTARIO, double DE_BEV, double CA_CENTRO_COSTOS, String DE_ANTECEDENTES_POLICIALES, String DE_CERTIFICADO_SALUD, String DE_MONTO_HONORARIO);

    public List<x_List_Id_Trab_Dgp> LIST_ID_TRAB_DGP(String id);

    public List<X_List_det_dgp> LIST_DET_DGP(String id_dep);

    public List<X_List_dgp_by> LIST_DGP_BY(String id_user);

    public void VAL_DGP_PASOS();

    public List<V_Es_Requerimiento> LIST_DGP_PROCESO(String id_dep);

    public List<X_val_tra_dgp> VAL_TRA_DGP(String id_tr);

    public int VAL_OPC_DGP(String idtr);

    public List<V_Det_DGP> LIST_ID_DGP(String id);

    public String MAX_ID_DGP();

    public int VALIDAR_DGP_CONTR(String id_dgp, String id_tr);

    public void REG_DGP_FINAL(String IDDGP);
    
    public void MOD_REQUE(String ID_DGP, String FE_DESDE, String FE_HASTA, double CA_SUELDO, String ID_PUESTO, String ID_REQUERIMIENTO,  double CA_BONO_ALIMENTARIO, double DE_BEV, double CA_CENTRO_COSTOS, String DE_ANTECEDENTES_POLICIALES, String DE_CERTIFICADO_SALUD);

    public List<V_Es_Requerimiento> List_Incomplet(String iddep);
}
