/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Contrato;
import pe.edu.upeu.application.model.Contrato_Adjunto;
import pe.edu.upeu.application.model.List_Rh_Contrato_Fec;
import pe.edu.upeu.application.model.Modalidad;
import pe.edu.upeu.application.model.Regimen_Laboral;
import pe.edu.upeu.application.model.Sub_Modalidad;
import pe.edu.upeu.application.model.V_Contrato_dgp;
import pe.edu.upeu.application.model.V_List_Empleado;
import pe.edu.upeu.application.model.X_List_Id_Contrato_DGP;

/**
 *
 * @author Admin
 */
public interface InterfaceContratoDAO {

    public void INSERT_CONTRATO(String ID_CONTRATO, String ID_DGP, String FE_DESDE, String FE_HASTA, 
            String FE_CESE, String ID_FUNC, String LI_CONDICION, double CA_SUELDO, double CA_REINTEGRO,
            double CA_ASIG_FAMILIAR, double HO_SEMANA, double NU_HORAS_LAB, double DIA_CONTRATO, String 
                    TI_TRABAJADOR, String LI_REGIMEN_LABORAL, String ES_DISCAPACIDAD, String TI_CONTRATO,
                    String LI_REGIMEN_PENSIONARIO, String ES_CONTRATO_TRABAJADOR, String US_CREACION, String 
                            FE_CREACION, String US_MODIF, String FE_MODIF, String US_IP,
                            String FE_VACACIO_INI, String FE_VACACIO_FIN, String ES_CONTRATO, String ID_FILIAL,
                            String ID_PUESTO, double  CA_BONO_ALIMENTO, String LI_TIPO_CONVENIO,
                            String ES_FIRMO_CONTRATO, double NU_CONTRATO, String DE_OBSERVACION, String ES_APOYO,
                            String TI_HORA_PAGO, String NU_DOCUMENTO,  String ES_ENTREGAR_DOC_REGLAMENTOS,
                            String ES_REGISTRO_HUELLA, String DE_REGISTRO_SISTEM_REMU, String ID_TRABAJADOR,
                            double CA_SUELDO_TOTAL, String ID_REGIMEN_LABORAL, String ID_MODALIDAD, String ID_SUB_MODALIDAD,
                            String CO_GR_OCUPACION, String FE_SUSCRIPCION, String CO_TI_MONEDA, String CO_TI_REM_VARIAB,
                            String DE_REMU_ESPECIE, String DE_RUC_EMP_TRAB, String CO_SUCURSAL, String DE_MYPE,
                            String ES_TI_CONTRATACION, double CA_BEV, String ID_TIPO_PLANILLA, String ES_REMUNERACION_PROCESADO,
                            String ID_HORARIO, String ID_PLANTILLA_CONTRACTUAL, double ca_bonificacion_p, String ES_MFL,String PRACTICANTE,String situacionEspecial);

    public List<String> List_Rh_Contrato_Idtr();

    public List<List_Rh_Contrato_Fec> List_Rh_Contrato_Fec(String id_departamento, String fecha_creacion);

    public List<Modalidad> List_modalidad();

    public List<Sub_Modalidad> List_submodalidad();

    public List<Regimen_Laboral> list_reg_labo();


    public void Venc_Cont();

    public void Eliminar_Contratos_firmados(String id_contrato);

    public String Buscar_id_tr(String id_dgp);

    public String Buscar_id_contrato_x_idtr(String idtr);

    public String Contrato_max(String id_tr);

    public List<X_List_Id_Contrato_DGP> List_contra_x_idcto(String id_ctos);

    public String MAX_ID_CONTRATO();

    public void INSERT_CONTRATO_ADJUNTO(String ID_CONTRATO_ADJUNTO, String ID_CONTRATO, String NO_ARCHIVO, String NO_ARCHIVO_ORIGINAL, String ES_CONTRATO_ADJUNTO, String IP_USUARIO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF);

    public void UPDATE_FIRMA(String ID_TR, String IDDGP);

    public List<V_List_Empleado> LIST_CASOS_ESPECIALES();

    public List<Map<String, ?>> Listar_Contratos(String de, String al, String direccion, String dep, String area, String sec, String puesto, String sueldo_total, String nombre, String fe_i, String fe_fin, String fe_sus, String id_dep_ses);

    public List<Map<String, ?>> List_contra_x_idcto_json(String id_ctos);

    public List<Contrato_Adjunto> List_doc_Contrato(String id_ctro);

    public int Count_doc_con(String id_ctro);



    public List<V_Contrato_dgp> List_contrato(String id_contrato);

    public void MODIFICAR_CONTRATO(String ID_CONTRATO, String ID_DGP, String FE_DESDE, String FE_HASTA, String FE_CESE, String ID_FUNC, String LI_CONDICION, Double CA_SUELDO, Double CA_REINTEGRO, 
            Double CA_ASIG_FAMILIAR, Double HO_SEMANA, Double NU_HORAS_LAB, Double DIA_CONTRATO, String TI_TRABAJADOR, String LI_REGIMEN_LABORAL, String ES_DISCAPACIDAD, String TI_CONTRATO,
            String LI_REGIMEN_PENSIONARIO, String ES_CONTRATO_TRABAJADOR, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String US_IP, String FE_VACACIO_INI, 
            String FE_VACACIO_FIN, String ES_CONTRATO, String ID_FILIAL, String ID_PUESTO, Double CA_BONO_ALIMENTO, String LI_TIPO_CONVENIO, String ES_FIRMO_CONTRATO, Double NU_CONTRATO, 
            String DE_OBSERVACION, String ES_APOYO, String TI_HORA_PAGO, String NU_DOCUMENTO, String ES_ENTREGAR_DOC_REGLAMENTOS, String ES_REGISTRO_HUELLA, String DE_REGISTRO_SISTEM_REMU, 
            String ID_TRABAJADOR, Double CA_SUELDO_TOTAL, String ID_REGIMEN_LABORAL, String ID_MODALIDAD, String ID_SUB_MODALIDAD, String CO_GR_OCUPACION, String FE_SUSCRIPCION, 
            String CO_TI_MONEDA, String CO_TI_REM_VARIAB, String DE_REMU_ESPECIE, String DE_RUC_EMP_TRAB, String CO_SUCURSAL, String DE_MYPE, String ES_TI_CONTRATACION, 
            Double CA_BEV, String ID_TIPO_PLANILLA, String ES_REMUNERACION_PROCESADO, String ID_HORARIO, String ID_PLANTILLA_CONTRACTUAL, Double ca_bonificacion_p,String PRACTICANTE,String idSituacionEspecial);

    public void VALIDAR_FE_CESE_CON();

    public void HABILITAR_SI(String idc, String estado);

    public void VALIDAR_FE_HASTA_CON();

    public void validar_contrato(String id_cto);

    public boolean validar_editar_contrato(String iduser, String idcontrato);

    public List<Contrato> ListaSelectorContrato(String id_trabajador);
}
