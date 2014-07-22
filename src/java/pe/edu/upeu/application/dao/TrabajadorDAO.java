/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import oracle.sql.NUMBER;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Contrato;
import pe.edu.upeu.application.model.Rol;
import pe.edu.upeu.application.model.Trabajador;
import pe.edu.upeu.application.model.V_Ficha_Trab_Num_C;

/**
 *
 * @author Jose
 */
public class TrabajadorDAO implements InterfaceTrabajadorDAO{
    ConexionBD conn;
    @Override
    public String Calculaedad(String fecha_nac) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean INSERT_DATOS_TRABAJADOR(String IDDATOS_TRABAJADOR, String APELLIDO_P, String APELLIDO_M, String NOMBRES, String TIPO_DOC, String NU_DOC, String ESTADO_CIVIL, String FECHA_NAC, String ID_NACIONALIDAD, String ID_DEPARTAMENTO, String ID_PROVINCIA, String ID_DISTRITO, String TELEFONO_TRAB, String CELULAR, String CORREO_PERSONAL, String CORREO_INST, String SISTEMA_PENSIONARIO, String NIVEL_EDUCATIVO, String GRADO_ACADEMICO, String TITULO_PROFESIONA, String ID_CARRERA, String ID_CENTRO_DE_ESTUDIO, String OTROS_ESTUDIOS, String SEXO, String GRUPO_SANGUINEO, String REFERENCIA, String RELIGION, String IGLESIA, String CARGO, String AUTORIDAD, String AUT_APELLIDOSNOMBRES, int AUT_CELULAR, String NOMBRE_AFP_ID, String AFILIADO_ESSALUD_ID, String TIPO_TRABAJADOR_ID, String TIPO_HORA_PAGO_REFEERENCIAL, String FACTOR_RH_ID, String DIR_DOM_A_D1_ID, String DIR_DOM_A_D2, String DIR_DOM_A_D3_ID, String DIR_DOM_A_D4, String DIR_DOM_A_D5_ID, String DIR_DOM_A_D6, String DIR_DOM_A_REF, String DIR_DOM_A_DISTRITO_ID, String DIR_DOM_LEG_D1_ID, String DIR_DOM_LEG_D2, String DIR_DOM_LEG_D3_ID, String DIR_DOM_LEG_D4, String DIR_DOM_LEG_D5_ID, String DIR_DOM_LEG_D6, String ID_DIR_DOM_LEG_DISTRITO, String ING_QTA_CAT_EMPRESA, String ING_QTA_CAT_RUC, String ING_QTA_CAT_OTRAS_EMPRESAS, String OBSERVACIONES, String USER_CREACION, String FECHA_CREACION, String USER_MODIF, String FECHA_MODIF, String USUARIO_IP) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean EliminarTrabajador(String id, String idc) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<V_Ficha_Trab_Num_C> ListarTrabajador(String iddep, String dni, String nom, String ape_p, String ape_m) {
         if (dni != null || nom != "") {
            
        }
         this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
         String sql="select d.* , u.departametno_id from ficha_trab_num_c ) d, det_usuario u where \n" +
"u.idusuario= d.user_creacion ";
         nom=nom.toUpperCase();
         ape_p=ape_p.toUpperCase();
         ape_m=ape_m.toUpperCase();
         sql+=(Integer.parseInt(dni)<=0)?"and d.NRO_DOC='"+dni+"'":"";
         sql+=(nom!="")?"and upper(d.nombres)like '%"+nom+"%'":"";
         sql+=(ape_p!="")?"and upper(d.apellido_p)like '%"+ape_p+"%'":"";
         sql+=(ape_m!="")?"and upper(d.apellido_m)like '%"+ape_m+"%'":"";
         sql+="order by d.iddatos_trabajador desc";
         
         List<V_Ficha_Trab_Num_C> list = new ArrayList<V_Ficha_Trab_Num_C>();
          try {
             ResultSet rs = this.conn.query(sql);
             V_Ficha_Trab_Num_C v=new V_Ficha_Trab_Num_C();
             while (rs.next()) {
                 v.setId_trabajador(rs.getString("ID_TRABAJADOR"));
                 v.setAp_paterno(rs.getString("AP_PARTERNO"));
                 v.setAp_paterno(rs.getString("AP_MATERNO"));
                 v.setNo_trabajador(rs.getString("No_trabajador"));
                 v.setTi_doc(rs.getString("TI_DOC"));
                 v.setNu_doc(rs.getString("NU_DOC"));
                 v.setEs_civil(rs.getString("ES_CIVIL"));
                 v.setFe_nac(rs.getString("FE_NAC"));
                 v.setId_nacionalidad(rs.getString("ID_NACIONALIDAD"));
                 v.setId_departamento(rs.getString("ID_DEPARTAMENTO"));
                 v.setId_provincia(rs.getString("ID_PROVINCIA"));
                 v.setId_distrito(rs.getString("ID_DISTRITO"));
                 v.setTe_trabajador(rs.getString("TE_TRABAJADOR"));
                 v.setCl_tra(rs.getString("CL_TRA"));
                 v.setDi_correo_personal(rs.getString("DI_CORREO_PERSONAL"));
                 v.setDi_correo_inst(rs.getString("DI_CORREO_INST"));
                 v.setCo_sistema_pensionario(rs.getString("CO_SISTEMA_PENSIONARIO"));
                 v.setLi_nivel_educativo(rs.getString("LI_NIVEL_EDUCATIVO"));
                 v.setLi_grado_academico(rs.getString("LI_GRADO_ACADEMICO"));
                 v.setLi_titulo_profesional(rs.getString("LI_TITULO_PROFECIONAL"));
                 v.setId_carrera(rs.getString("ID_CARRERA"));
                 v.setId_universidad(rs.getString("ID_UNIVERSIDAD"));
                 v.setCm_otros_estudios(rs.getString("CM_OTROS_ESTUDIOS"));
                 v.setEs_sexo(rs.getString("ES_SEXO"));
                 v.setLi_grupo_sanguineo(rs.getString("LI_GRUPO_SANGUINEO"));
                 v.setDe_referencia(rs.getString("DE_REFERENCIA"));
                 v.setLi_religion(rs.getString("LI_RELIGION"));
                 v.setNo_iglesia(rs.getString("NO_IGLESIA"));
                 v.setDe_cargo(rs.getString("DE_CARGO"));
                 v.setLi_autoridad(rs.getString("LI_AUTORIDAD"));
                 v.setNo_ap_autoridad(rs.getString("NO_AP_AUTORIDAD"));
                 v.setCl_autoridad(rs.getString("CL_AUTORIDAD"));
                 v.setId_no_afp(rs.getString("ID_NO_AFP"));
                 v.setEs_afiliado_essalud(rs.getString("ES_AFILIADO_ESSALUD"));
                 v.setLi_tipo_trabajador(rs.getString("LI_TIPO_TRABAJADOR"));
                 v.setCa_tipo_hora_pago_refeerencial(rs.getString("CA_TIPO_HORA_PAGO_REFEERENCIAL"));
                 v.setEs_factor_rh(rs.getString("ES_FACTOR_RH"));
                 v.setLi_di_dom_a_d1(rs.getString("LI_DI_DOM_A_D1"));
                 v.setDi_dom_a_d2(rs.getString("DI_DOM_A_D2"));
                 v.setLi_di_dom_a_d3(rs.getString("LI_DI_DOM_A_D3"));
                 v.setDi_dom_a_d4(rs.getString("DI_DOM_A_D4"));
                 v.setLi_di_dom_a_d5(rs.getString("LI_DI_DOM_A_D5"));
                 v.setDi_dom_a_d6(rs.getString("DI_DOM_A_D6"));
                 v.setDi_dom_a_ref(rs.getString("DI_DOM_A_REF"));
                 v.setId_di_dom_a_distrito(rs.getString("ID_DI_DOM_A_DISTRITO"));
                 v.setLi_di_dom_leg_d1(rs.getString("LI_DI_DOM_LEG_D1"));
                 v.setDi_dom_leg_d2(rs.getString("DI_DOM_LEG_D2"));
                 v.setLi_di_dom_leg_d3_id(rs.getString("LI_DI_DOM_LEG_D3_ID"));
                 v.setDi_dom_leg_d4(rs.getString("DI_DOM_LEG_D4"));
                 v.setLi_di_dom_leg_d5_id(rs.getString("LI_DI_DOM_LEG_D5_ID"));
                 v.setDi_dom_leg_d6(rs.getString("DI_DOM_LEG_D6"));
                 v.setId_di_dom_leg_distrito(rs.getString("ID_DI_DOM_LEG_DISTRITO"));
                 v.setCa_ing_qta_cat_empresa(rs.getString("CA_ING_QTA_CAT_EMPRESA"));
                 v.setCa_ing_qta_cat_ruc(rs.getString("CA_ING_QTA_CAT_RUC"));
                 v.setCa_ing_qta_cat_otras_empresas(rs.getString("CA_ING_QTA_CAT_OTRAS_EMPRESAS"));
                 v.setCm_observaciones(rs.getString("CM_OBSERVACIONES"));
                 v.setUs_creacion(rs.getString("US_CREACION"));
                 v.setFe_creacion(rs.getString("FE_CREACION"));
                 v.setUs_modif(rs.getString("US_MODIF"));
                 v.setFe_modif(rs.getString("FE_MODIF"));
                 v.setIp_usuario(rs.getString("IP_USUARIO"));
                 v.setIdtr(rs.getString("IDTR"));
                 v.setNu_contrato(rs.getString("NU_CONTRATO"));
                 v.setId_departamento2(rs.getString("ID_DEPARTAMENTO2"));
            list.add(v);
             }
             
        } catch (SQLException e) {
        }finally{
         this.conn.close();
         }
         return list;   
    }

    @Override
    public List<Trabajador> ListaridTrabajador(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Contrato> LIST_DAT_TR_PLANTILLA(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String MAX_ID_DATOS_TRABAJADOR() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
