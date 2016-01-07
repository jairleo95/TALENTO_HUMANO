/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.model.Cuenta_Sueldo;
import pe.edu.upeu.application.model.Trabajador;
import pe.edu.upeu.application.model.Universidad_Carrera;
import pe.edu.upeu.application.model.V_Ficha_Trab_Num_C;
import pe.edu.upeu.application.model.X_List_dat_tr_plantilla;

/**
 *
 * @author Jose
 */
public interface InterfaceTrabajadorDAO {

    public void INSERT_TRABAJADOR(String ID_TRABAJADOR, String AP_PATERNO, String AP_MATERNO, String NO_TRABAJADOR, String TI_DOC,
            String NU_DOC, String ES_CIVIL, String FE_NAC, String ID_NACIONALIDAD, String ID_DEPARTAMENTO, String ID_PROVINCIA,
            String ID_DISTRITO, String TE_TRABAJADOR, String CL_TRA, String DI_CORREO_PERSONAL, String DI_CORREO_INST,
            String CO_SISTEMA_PENSIONARIO, String ID_SITUACION_EDUCATIVA, String LI_REG_INST_EDUCATIVA, String ES_INST_EDUC_PERU,
            String ID_UNIVERSIDAD_CARRERA, String DE_ANNO_EGRESO, String CM_OTROS_ESTUDIOS, String ES_SEXO, String LI_GRUPO_SANGUINEO,
            String DE_REFERENCIA, String LI_RELIGION, String NO_IGLESIA, String DE_CARGO, String LI_AUTORIDAD, String NO_AP_AUTORIDAD,
            String CL_AUTORIDAD, String ID_NO_AFP, String ES_AFILIADO_ESSALUD, String LI_TIPO_TRABAJADOR,
            String CA_TIPO_HORA_PAGO_REFEERENCIAL, String ES_FACTOR_RH, String LI_DI_DOM_A_D1, String DI_DOM_A_D2,
            String LI_DI_DOM_A_D3, String DI_DOM_A_D4, String LI_DI_DOM_A_D5, String DI_DOM_A_D6, String DI_DOM_A_REF,
            String ID_DI_DOM_A_DISTRITO, String LI_DI_DOM_LEG_D1, String DI_DOM_LEG_D2, String LI_DI_DOM_LEG_D3, String DI_DOM_LEG_D4,
            String LI_DI_DOM_LEG_D5, String DI_DOM_LEG_D6, String ID_DI_DOM_LEG_DISTRITO, String CA_ING_QTA_CAT_EMPRESA,
            String CA_ING_QTA_CAT_RUC, String CA_ING_QTA_CAT_OTRAS_EMPRESAS, String CM_OBSERVACIONES, String US_CREACION,
            String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String AP_NOMBRES_PADRE, String AP_NOMBRES_MADRE,
            String ES_TRABAJA_UPEU_C, String AP_NOMBRES_C, String FE_NAC_C, String ID_TIPO_DOC_C, String NU_DOC_C,
            String LI_INSCRIPCION_VIG_ESSALUD_C, String ID_CONYUGUE, String CO_UNIVERSITARIO, String diezmo);

    public boolean EliminarTrabajador(String id, String idc);

    public List<V_Ficha_Trab_Num_C> Buscar_Ficha_Trabajador(String iddep, String dni, String nom, String ape_p, String ape_m);

    public List<V_Ficha_Trab_Num_C> Buscar_Trabajador_Requerimiento(String iddep, String dni, String nom, String ape_p, String ape_m, String id_req);

    public List<V_Ficha_Trab_Num_C> ListaridTrabajador(String id);

    public List<X_List_dat_tr_plantilla> LIST_DAT_TR_PLANTILLA(String id);

    public String MAX_ID_DATOS_TRABAJADOR();

    public void UPDATE_ID_CONYUGUE(String id_conyugue, String id_trabajador, String US_MODIF, String IP_USUARIO);

    public String tipo_planilla(String id_trabajador);

    public void INSERT_HIST_RELIGION(String ID_HIST_INFO_REL, String LI_RELIGION, String NO_IGLESIA, String DE_CARGO, String LI_AUTORIDAD, String NO_AP_AUTORIDAD, String CL_AUTORIDAD, String ES_HIST_INFO_REL, String ID_TRABAJADOR, String iduser, String FE_MODIF);

    public void MOD_ASP_REL(String LI_RELIGION, String NO_IGLESIA, String DE_CARGO, String LI_AUTORIDAD, String NO_AP_AUTORIDAD, String CL_AUTORIDAD, String ID_TRABAJADOR, String US_MODIF, String IP_USUARIO);

    public List<Trabajador> LIST_TRABAJADOR_MOD_REL();

    public void INSERT_CUENTA_SUELDO(String ID_CUENTA_SUELDO, String NO_BANCO, String NU_CUENTA, String NU_CUENTA_BANC, String ES_GEM_NU_CUENTA, String NO_BANCO_OTROS, String ID_TRABAJADOR, String ES_CUENTA_SUELDO);

    public String CuentaSueldoTra(String ID_TRABAJADOR);

    public List<Cuenta_Sueldo> List_Cuenta_Sueldo(String id_tr);

    public void MOD_DAT_GEN(String AP_PATERNO, String AP_MATERNO, String NO_TRABAJADOR, String TI_DOC, String NU_DOC, String ES_CIVIL, String FE_NAC, String ID_NACIONALIDAD, String ID_DEPARTAMENTO, String ID_PROVINCIA, String ID_DISTRITO, String TE_TRABAJADOR, String CL_TRA, String DI_CORREO_PERSONAL, String DI_CORREO_INST, String CO_SISTEMA_PENSIONARIO, String ES_SEXO, String LI_GRUPO_SANGUINEO, String ID_NO_AFP, String ES_AFILIADO_ESSALUD, String LI_TIPO_TRABAJADOR, String ES_FACTOR_RH, String ID_TRABAJADOR, String US_MODIF, String IP_USUARIO);

    public List<Universidad_Carrera> List_Uni_Carr();

    public void MOD_ASPEC_ACADEM(String LI_NIVEL_EDUCATIVO, String REGIMEN, String ES_INS_PERU, String CARRERA, String DE_ANNO_EGRESO, String CM_OTROS_ESTUDIOS, String CA_TIPO_HORA_PAGO_REFERENCIAL, String ID_TRABAJADOR, String CO_UNIVERSITARIO, String US_MODIF, String IP_USUARIO);

    public void MOD_CUENTA_SUELDO(String NO_BANCO, String NU_CUENTA, String NU_CUENTA_BANC, String ES_GEM_NU_CUENTA, String NO_BANCO_OTROS_SP, String ID_TRABAJADOR, String ES_CUENTA_SUELDO);

    public void MOD_ASPEC_SOCIAL(String LI_DI_DOM_A_D1, String DI_DOM_A_D2, String LI_DI_DOM_A_D3, String DI_DOM_A_D4, String LI_DI_DOM_A_D5, String DI_DOM_A_D6, String DI_DOM_A_REF, String ID_DI_DOM_A_DISTRITO, String LI_DI_DOM_LEG_D1, String DI_DOM_LEG_D2, String LI_DI_DOM_LEG_D3, String DI_DOM_LEG_D4, String LI_DI_DOM_LEG_D5, String DI_DOM_LEG_D6, String ID_DOM_LEG_DISTRITO, String CA_ING_QTA_CAT_EMPRESA, String CA_ING_QTA_RUC, String CA_ING_QTA_CAT_OTRAS_EMPRESAS, String ID_TRABAJADOR, String US_MODIF, String IP_USUARIO);

    public String REG_DOC_TRABAJADOR(String trb);

    public String ID_TRB(String user);

    public boolean val_nu_doc(String nu_doc);

    public String ip();

    public String Cod_aps_x_idt(String id_trabajador);

    public String Cod_huella_x_idt(String id_trabajador);

    public int cod_uni_unico(String cod_uni);

    public int ShowPorcentageTrabajador(String idtr);

    public boolean UpdateEsDiezmo(String idtr, int estado);

    public int ShowEsDiezmoTrabajador(String idtr);

    public String[] ShowAFP_ONP(String idtr);
}
