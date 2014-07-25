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
import pe.edu.upeu.application.model.X_List_dat_tr_plantilla;

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
    public boolean INSERT_DATOS_TRABAJADOR(String IDDATOS_TRABAJADOR, String APELLIDO_P, String APELLIDO_M, String NOMBRES, String TIPO_DOC, String NU_DOC, String ESTADO_CIVIL, String FECHA_NAC, String ID_NACIONALIDAD, String ID_DEPARTAMENTO, String ID_PROVINCIA, String ID_DISTRITO, String TELEFONO_TRAB, String CELULAR, String CORREO_PERSONAL, String CORREO_INST, String SISTEMA_PENSIONARIO, String NIVEL_EDUCATIVO, String GRADO_ACADEMICO, String TITULO_PROFESIONA, String ID_CARRERA, String ID_CENTRO_DE_ESTUDIO, String OTROS_ESTUDIOS, String SEXO, String GRUPO_SANGUINEO, String REFERENCIA, String RELIGION, String IGLESIA, String CARGO, String AUTORIDAD, String AUT_APELLIDOSNOMBRES, String AUT_CELULAR, String NOMBRE_AFP_ID, String AFILIADO_ESSALUD_ID, String TIPO_TRABAJADOR_ID, String TIPO_HORA_PAGO_REFEERENCIAL, String FACTOR_RH_ID, String DIR_DOM_A_D1_ID, String DIR_DOM_A_D2, String DIR_DOM_A_D3_ID, String DIR_DOM_A_D4, String DIR_DOM_A_D5_ID, String DIR_DOM_A_D6, String DIR_DOM_A_REF, String DIR_DOM_A_DISTRITO_ID, String DIR_DOM_LEG_D1_ID, String DIR_DOM_LEG_D2, String DIR_DOM_LEG_D3_ID, String DIR_DOM_LEG_D4, String DIR_DOM_LEG_D5_ID, String DIR_DOM_LEG_D6, String ID_DIR_DOM_LEG_DISTRITO, String ING_QTA_CAT_EMPRESA, String ING_QTA_CAT_RUC, String ING_QTA_CAT_OTRAS_EMPRESAS, String OBSERVACIONES, String USER_CREACION, String FECHA_CREACION, String USER_MODIF, String FECHA_MODIF, String USUARIO_IP) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean EliminarTrabajador(String id, String idc) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<V_Ficha_Trab_Num_C> ListarTrabajador(String iddep, String dni, String nom, String ape_p, String ape_m) {
         if (dni != null || !"".equals(nom)) {
            
        }
         this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
         String sql="select d.* , u.id_departamento from (select * from RHVD_FICHA_TRAB_NUM_C) d, RHVD_USUARIO u where u.id_usuario= d.us_creacion";
         nom=nom.toUpperCase();
         ape_p=ape_p.toUpperCase();
         ape_m=ape_m.toUpperCase();
         sql+=(Integer.parseInt(dni)<=0)?"and d.NRO_DOC='"+dni+"'":"";
         sql+=(!"".equals(nom))?"and upper(d.NO_TRABAJADOR)like '%"+nom+"%'":"";
         sql+=(!"".equals(ape_p))?"and upper(d.AP_PATERNO)like '%"+ape_p+"%'":"";
         sql+=(!"".equals(ape_m))?"and upper(d.AP_MATERNO)like '%"+ape_m+"%'":"";
         sql+="order by d.ID_TRABAJADOR desc";
         
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
       this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
       String sql="select * from RHTM_TRABAJADOR where ID_TRABAJADOR='"+id+"'";
       List<Trabajador> list = new ArrayList<Trabajador>();
         try {
             ResultSet rs = this.conn.query(sql);
             Trabajador t =  new Trabajador();
             while (rs.next()) {
                 t.setId_trabajador(rs.getString("id_trabajador"));
                 t.setAp_paterno(rs.getString("ap_paterno"));
                 t.setAp_materno(rs.getString("ap_materno"));
                 t.setNo_trabajador(rs.getString("no_trabajador"));
                 t.setTi_doc(rs.getString("ti_doc"));
                 t.setNu_doc(rs.getString("nu_doc"));
                 t.setEs_civil(rs.getString("es_civil"));
                 t.setFe_nac(rs.getString("fe_nac"));
                 t.setId_nacionalidad(rs.getString("id_nacionalidad"));
                 t.setCl_tra(rs.getString("cl_tra"));
                 t.setDi_correo_personal(rs.getString("di_correo_personal"));
                 t.setDi_correo_inst(rs.getString("di_correo_inst"));
                 t.setCo_sistema_pensionario(rs.getString("co_sistema_pensionario"));
                 t.setLi_nivel_educativo(rs.getString("li_nivel_educativo"));
                 t.setLi_grado_academico(rs.getString("li_grado_academico"));
                 t.setLi_titulo_profesional(rs.getString("li_titulo_profesional"));
                 t.setId_carrera(rs.getString("id_carrera"));
                 t.setId_universidad(rs.getString("id_universidad"));
                 t.setCm_otros_estudios(rs.getString("cm_otros_estudios"));
                 t.setEs_sexo(rs.getString("es_sexo"));
                 t.setLi_grupo_sanguineo(rs.getString("li_grupo_sanguineo"));
                 t.setDe_referencia(rs.getString("de_referencia"));
                 t.setLi_religion(rs.getString("li_religion"));
                 t.setNo_iglesia(rs.getString("no_iglesia"));
                 t.setDe_cargo(rs.getString("De_cargo"));
                 t.setLi_autoridad(rs.getString("li_autoridad"));
                 t.setNo_ap_autoridad(rs.getString("no_ap_autoridad"));
                 t.setCl_autoridad(rs.getString("cl_autoridad"));
                 t.setId_no_afp(rs.getString("id_no_afp"));
                 t.setEs_afiliado_essalud(rs.getString("es_afiliado_essalud"));
                 t.setLi_tipo_trabajador(rs.getString("li_tipo_trabajador"));
                 t.setCa_tipo_hora_pago_refeerencial(rs.getString("ca_tipo_hora_pago_refeerencial"));
                 t.setEs_factor_rh(rs.getString("es_factor_rh"));
                 t.setLi_di_dom_a_d1(rs.getString("li_di_dom_a_d1"));
                 t.setDi_dom_a_d2(rs.getString("di_dom_a_d2"));
                 t.setLi_di_dom_a_d3(rs.getString("li_di_dom_a_d3"));
                 t.setDi_dom_a_d4(rs.getString("di_dom_a_d4"));
                 t.setLi_di_dom_a_d5(rs.getString("li_di_dom_a_d5"));
                 t.setDi_dom_a_d6(rs.getString("di_dom_a_d6"));
                 t.setDi_dom_a_ref(rs.getString("di_dom_a_ref"));
                 t.setId_di_dom_a_distrito(rs.getString("id_di_dom_a_distrito"));
                 t.setLi_di_dom_leg_d1(rs.getString("li_di_dom_leg_d1"));
                 t.setDi_dom_leg_d2(rs.getString("di_dom_leg_d2"));
                 t.setLi_di_dom_leg_d3(rs.getString("li_di_dom_leg_d3"));
                 t.setDi_dom_leg_d4(rs.getString("di_dom_leg_d4"));
                 t.setLi_di_dom_leg_d5(rs.getString("li_di_dom_leg_d5"));
                 t.setDi_dom_leg_d6(rs.getString("di_dom_leg_d6"));
                 t.setId_di_dom_leg_distrito(rs.getString("id_di_dom_leg_distrito"));
                 t.setCa_ing_qta_cat_empresa(rs.getString("ca_ing_qta_cat_empresa"));
                 t.setCa_ing_qta_cat_ruc(rs.getString("ca_ing_qta_cat_ruc"));
                 t.setCa_ing_qta_cat_otras_empresas(rs.getString("ca_ing_qta_cat_otras_empresas"));
                 t.setCm_observaciones(rs.getString("cm_observaciones"));
                 t.setUs_creacion(rs.getString("us_creacion"));
                 t.setFe_creacion(rs.getString("fe_creacion"));
                 t.setUs_modif(rs.getString("us_modif"));
                 t.setFe_modif(rs.getString("fe_modif"));
                 t.setIp_usuario(rs.getString("ip_usuario"));  
            list.add(t);
             }
             
        } catch (SQLException e) {
        }finally{
         this.conn.close();
         }
       return  list;
    }

    @Override
    public List<X_List_dat_tr_plantilla> LIST_DAT_TR_PLANTILLA(String id) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
       String sql="select dt.ap_paterno,dt.ap_materno,dt.no_trabajador,dt.nu_doc,dt.li_di_dom_a_d1,dt.di_dom_a_d2,dt.li_di_dom_a_d3,dt.di_dom_a_d4,dt.li_di_dom_a_d5,dt.di_dom_a_d6,p.no_dep,p.no_puesto,c.fe_desde,c.fe_hasta,c.ca_sueldo,c.ca_bono_alimento,to_char(sysdate,'dd')||' de '||to_char(sysdate,'Month')||' del '||to_char(sysdate,'YYYY') AS fecha_actual,dt.id_di_dom_a_distrito from RHTM_TRABAJADOR dt,RHTM_CONTRATO c,RHVD_PUESTO_DIRECCION p where  dt.id_trabajador=c.id_trabajador and c.id_puesto=p.id_puesto  and c.id_contrato='"+id+"'";
       List<X_List_dat_tr_plantilla> list = new ArrayList<X_List_dat_tr_plantilla>();
         try {
             ResultSet rs = this.conn.query(sql);
             X_List_dat_tr_plantilla t =  new X_List_dat_tr_plantilla();
             while (rs.next()) {
                 t.setAp_paterno(rs.getString("ap_paterno"));
                 t.setAp_materno(rs.getString("ap_materno"));
                 t.setNo_trabajador(rs.getString("no_trabajador"));
                 t.setNu_doc(rs.getString("nu_doc"));
                 t.setLi_di_dom_a_d1(rs.getString("li_di_dom_a_d1"));
                 t.setDi_dom_a_d2(rs.getString("di_dom_a_d2"));
                 t.setLi_di_dom_a_d3(rs.getString("li_di_dom_a_d3"));
                 t.setDi_dom_a_d4(rs.getString("di_dom_a_d4"));
                 t.setLi_di_dom_a_d5(rs.getString("li_di_dom_a_d5"));
                 t.setDi_dom_a_d6(rs.getString("di_dom_a_d6"));
                 t.setNo_dep(rs.getString("no_dep"));
                 t.setNo_puesto(rs.getString("no_puesto"));
                 t.setFe_desde(rs.getString("fe_desde"));
                 t.setFe_hasta(rs.getString("fe_hasta"));
                 t.setCa_sueldo(rs.getString("ca_sueldo"));
                 t.setCa_bono_alimento(rs.getString("ca_bono_alimento"));
                 t.setFecha_actual(rs.getString("fecha_actual"));
                 t.setId_di_dom_a_distrito(rs.getString("id_di_dom_a_distrito")); 
            list.add(t);
             }
             
        } catch (SQLException e) {
        }finally{
         this.conn.close();
         }
       return  list;
       
    }

    @Override
    public String MAX_ID_DATOS_TRABAJADOR() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql="SELECT 'TRB-' ||MAX (SUBSTR(ID_TRABAJADOR,5,8)) FROM RHTM_TRABAJADOR";
        String Max = null ;
        try {
             ResultSet rs = this.conn.query(sql);
             while (rs.next()) {
                Max=rs.getString(1);
             }
        } catch (SQLException e) {
        }finally{
         this.conn.close();
         }
        return Max;
    }
}
