/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.List_Rh_Contrato_Fec;
import pe.edu.upeu.application.model.Modalidad;
import pe.edu.upeu.application.model.Regimen_Laboral;
import pe.edu.upeu.application.model.X_List_Anno_Id_Tr_DGP;
import pe.edu.upeu.application.model.X_List_Id_Contrato_DGP;

/**
 *
 * @author Admin
 */
public interface InterfaceContratoDAO {

public void INSERT_CONTRATO(String ID_CONTRATO, String ID_DGP, String FE_DESDE, String FE_HASTA, String FE_CESE, String ID_FUNC, String LI_CONDICION, Double CA_SUELDO, Double CA_REINTEGRO, Double CA_ASIG_FAMILIAR, Double HO_SEMANA, Double NU_HORAS_LAB, Double DIA_CONTRATO, String TI_TRABAJADOR, String LI_REGIMEN_LABORAL, String ES_DISCAPACIDAD, String TI_CONTRATO, String LI_REGIMEN_PENSIONARIO, String ES_CONTRATO_TRABAJADOR, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String US_IP, String FE_VACACIO_INI, String FE_VACACIO_FIN, String ES_CONTRATO, String ID_FILIAL, String ID_DIRECCION, String ID_DEPARTAMENTO, String ID_AREA, String ID_SECCION, String ID_PUESTO, Double CA_BONO_ALIMENTO, String LI_TIPO_CONVENIO, String ES_FIRMO_CONTRATO, Double NU_CONTRATO, String DE_OBSERVACION, String ES_APOYO, String TI_HORA_PAGO, String NU_DOCUMENTO, String ID_ANNO, String ES_ENTREGAR_DOC_REGLAMENTOS, String ES_REGISTRO_HUELLA, String DE_REGISTRO_SISTEM_REMU, String ID_TRABAJADOR, String ID_CENTRO_COSTO, Double CA_SUELDO_TOTAL, String ID_REGIMEN_LABORAL, String ID_MODALIDAD, String ID_SUB_MODALIDAD, String CO_GR_OCUPACION, String FE_SUSCRIPCION, String CO_TI_MONEDA, String CO_TI_REM_VARIAB, String DE_REMU_ESPECIE, String DE_RUC_EMP_TRAB, String CO_SUCURSAL, String DE_MYPE, String ES_TI_CONTRATACION, Double CA_BEV);
    
    public List<X_List_Id_Contrato_DGP> List_id_Contrato_DGP (String id_trabajador,String id_anno);
    public List <String> List_Rh_Contrato_Idtr ();
    public List<List_Rh_Contrato_Fec> List_Rh_Contrato_Fec(String id_departamento, String fecha_creacion);
    public List<X_List_Anno_Id_Tr_DGP> List_Anno_Id_Tr_DGP (String id_trabajador);
    public List<Modalidad> List_modalidad ();
    public List<Regimen_Laboral> list_reg_labo ();
    public int Validar_Anno (String id_trabajador, String id_anno);
    public void Venc_Cont();
}
