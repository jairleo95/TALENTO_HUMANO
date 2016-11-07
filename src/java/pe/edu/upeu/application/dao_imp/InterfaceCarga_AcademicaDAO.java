/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Carga_Academica;
import pe.edu.upeu.application.model.DGP;
import pe.edu.upeu.application.model.V_Detalle_Carga_Academica;

/**
 *
 * @author ALFA 3
 */
public interface InterfaceCarga_AcademicaDAO {

    public String DNI_ID_TRABAJADOR(String dni);

    public void INSERT_CARGA_ACADEMICA(String ID_CARGA_ACADEMICA, String ES_CARGA_ACADEMICA, String CAMPUS, String ES_TIPO_DOC, String NU_DOC, String AP_PATERNO, String AP_MATERNO, String NO_TRABAJADOR, String NO_FACULTAD, String NO_EAP, String DE_CARGA, String NO_CURSO, String NU_GRUPO, String DE_HORARIO, int CA_HLAB, String DE_CONDICION, String DE_TIPO_CURSO, String ES_PROCESADO, String FE_CREACION);

    public String INSERT_PROCESO_CARGA_ACADEMICA(String ID_PROCESO_CARGA_AC, String ES_PROCESO_CARGA_AC, String CA_TIPO_HORA_PAGO, double CA_TOTAL_HL, String FE_DESDE, String FE_HASTA, String ES_PROCESADO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String NO_USUARIO, String ID_DGP);

    public List<Carga_Academica> ListCarAca();

    public List<V_Detalle_Carga_Academica> Lista_detalle_academico(String idtr, String facultad, String eap,String ciclo,String dni);

    public String INSERT_DETALLE_CARGA_ACADEMICA(String ID_DETALLE_CARGA_ACADEMICA, String ID_PROCESO_CARGA_AC, String ID_CARGA_ACADEMICA, String ES_DETALLE_CARGA);

    public String INSERT_CARGA_ACADEMICA(String ID_CARGA_ACADEMICA, String ES_CARGA_ACADEMICA, String CAMPUS, String ES_TIPO_DOC, String NU_DOC, String AP_PATERNO, String AP_MATERNO, String NO_TRABAJADOR, String NO_FACULTAD, String NO_EAP, String DE_CARGA, String NO_CURSO, String NU_GRUPO, String DE_HORARIO, double CA_HLAB, String DE_CONDICION, String DE_TIPO_CURSO, String ES_PROCESADO, String FE_CREACION, String ID_PROCESO_CARGA_AC);

    public String INSERT_PAGO_DOCENTE(String ID_PAGO_DOCENTE, String NU_CUOTA, double CA_CUOTA, String FE_PAGO, String ES_PAGO_DOCENTE, String ID_PROCESO_CARGA_AC, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String NO_USUARIO);

    public String INSERT_DGP(String ID_DGP, String FE_DESDE, String FE_HASTA, double CA_SUELDO, String DE_DIAS_TRABAJO, String ID_PUESTO, String ID_REQUERIMIENTO, String ID_TRABAJADOR, String CO_RUC, String DE_LUGAR_SERVICIO, String DE_SERVICIO, String DE_PERIODO_PAGO, String DE_DOMICILIO_FISCAL, String DE_SUBVENCION, String DE_HORARIO_CAPACITACION, String DE_HORARIO_REFRIGERIO, String DE_DIAS_CAPACITACION, String ES_DGP, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, double CA_BONO_ALIMENTARIO, double DE_BEV, String DE_ANTECEDENTES_POLICIALES, String ES_CERTIFICADO_SALUD, String DE_MONTO_HONORARIO, String FE_CESE, String FE_RECEPCION, String MO_RENUNCIA, double DI_ADQUIRIDOS, double DI_CONSUMIDOS, double DI_POR_CONSUMIR, String ES_VACACIONES, String LI_MOTIVO, String ES_MFL, double CA_BONIFICACION_P);
    public String insertDGP(DGP dgp);

    public void PROCESAR_CARGA_ACADEMICA(String id_proceso, String iddgp);

    public List<Map<String, ?>> Cuotas_Pago_Docente(String fe_desde, String fe_hasta, double pago_semanal);
    
    public List<Map<String, ?>> List_Carga_Academica_WS (String semestre);
    
    public List<Map<String, ?>> actualizar_Carga_Academica (String semestre);
    
    
    
   
    
}
