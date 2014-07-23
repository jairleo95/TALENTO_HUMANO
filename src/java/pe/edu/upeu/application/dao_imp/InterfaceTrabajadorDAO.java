/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Contrato;
import pe.edu.upeu.application.model.Trabajador;
import pe.edu.upeu.application.model.V_Ficha_Trab_Num_C;

/**
 *
 * @author Jose
 */
public interface InterfaceTrabajadorDAO {

    public String Calculaedad(String fecha_nac);

    public boolean INSERT_DATOS_TRABAJADOR(String IDDATOS_TRABAJADOR,
            String APELLIDO_P,
            String APELLIDO_M,
            String NOMBRES,
            String TIPO_DOC,
            String NU_DOC,
            String ESTADO_CIVIL,
            String FECHA_NAC,
            String ID_NACIONALIDAD,
            String ID_DEPARTAMENTO,
            String ID_PROVINCIA,
            String ID_DISTRITO,
            String TELEFONO_TRAB,
            String CELULAR,
            String CORREO_PERSONAL,
            String CORREO_INST,
            String SISTEMA_PENSIONARIO,
            String NIVEL_EDUCATIVO,
            String GRADO_ACADEMICO,
            String TITULO_PROFESIONA,
            String ID_CARRERA,
            String ID_CENTRO_DE_ESTUDIO,
            String OTROS_ESTUDIOS,
            String SEXO,
            String GRUPO_SANGUINEO,
            String REFERENCIA,
            String RELIGION,
            String IGLESIA,
            String CARGO,
            String AUTORIDAD,
            String AUT_APELLIDOSNOMBRES,
            int AUT_CELULAR,
            String NOMBRE_AFP_ID,
            String AFILIADO_ESSALUD_ID,
            String TIPO_TRABAJADOR_ID,
            String TIPO_HORA_PAGO_REFEERENCIAL,
            String FACTOR_RH_ID,
            String DIR_DOM_A_D1_ID,
            String DIR_DOM_A_D2,
            String DIR_DOM_A_D3_ID,
            String DIR_DOM_A_D4,
            String DIR_DOM_A_D5_ID,
            String DIR_DOM_A_D6,
            String DIR_DOM_A_REF,
            String DIR_DOM_A_DISTRITO_ID,
            String DIR_DOM_LEG_D1_ID,
            String DIR_DOM_LEG_D2,
            String DIR_DOM_LEG_D3_ID,
            String DIR_DOM_LEG_D4,
            String DIR_DOM_LEG_D5_ID,
            String DIR_DOM_LEG_D6,
            String ID_DIR_DOM_LEG_DISTRITO,
            String ING_QTA_CAT_EMPRESA,
            String ING_QTA_CAT_RUC,
            String ING_QTA_CAT_OTRAS_EMPRESAS,
            String OBSERVACIONES,
            String USER_CREACION,
            String FECHA_CREACION,
            String USER_MODIF,
            String FECHA_MODIF,
            String USUARIO_IP
    );

    public boolean EliminarTrabajador(String id, String idc);

    public List<V_Ficha_Trab_Num_C> ListarTrabajador(String iddep, String dni, String nom, String ape_p, String ape_m);

    public List<Trabajador> ListaridTrabajador(String id);

    public List<Contrato> LIST_DAT_TR_PLANTILLA(String id);

    public String MAX_ID_DATOS_TRABAJADOR();
}
