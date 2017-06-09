/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Empleado;
import pe.edu.upeu.application.model.Evaluacion_Emp;
import pe.edu.upeu.application.model.V_List_Empleado;
import pe.edu.upeu.application.model.page.Datatable;
import pe.edu.upeu.application.util.Sql;

/**
 *
 * @author Alfa.sistemas
 */
public class EmpleadoDAO implements InterfaceEmpleadoDAO {

    ConexionBD conn;

    @Override
    public String Id_Puesto_Personal(String ide) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select id_puesto from RHVD_EMP_PU_DIR_DEP WHERE ID_EMPLEADO='" + ide + "'";
        String id = null;
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            id = rs.getString("id_puesto");
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return id;
    }

    @Override
    public void VALIDAR_EMPLEADO(String id_tra) {
        /*sirve para agregar usuarios al sistema cmo usuarios trbajadorres*/
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_VAL_EMP ( ? )}");
            cst.setString(1, id_tra);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public Datatable getAllEmployees(Datatable datatable, String direccion, String departamento, String area, String seccion) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String queryColumns = "SELECT c.id_contrato,DT.\"ID_TRABAJADOR\",DT.\"AP_PATERNO\",DT.\"AP_MATERNO\",DT.\"NO_TRABAJADOR\",DT.\"TI_DOC\",DT.\"NU_DOC\",DT.\"ES_CIVIL\",\n"
                + "    DT.\"FE_NAC\",DT.\"NO_NACIONALIDAD\",DT.\"NO_DEPARTAMENTO\",DT.\"NO_PROVINCIA\",DT.\"NO_DISTRITO\",DT.\"TE_TRABAJADOR\",DT.\"CL_TRA\",DT.\"DI_CORREO_PERSONAL\",DT.\"DI_CORREO_INST\",\n"
                + "    DT.\"CO_SISTEMA_PENSIONARIO\",DT.\"ID_SITUACION_EDUCATIVA\",DT.\"LI_REG_INST_EDUCATIVA\",DT.\"ES_INST_EDUC_PERU\",\n"
                + "    DT.\"CM_OTROS_ESTUDIOS\",DT.\"ES_SEXO\",DT.\"LI_GRUPO_SANGUINEO\",DT.\"DE_REFERENCIA\",\n"
                + "    DT.\"LI_RELIGION\",DT.\"NO_IGLESIA\",DT.\"DE_CARGO\",DT.\"LI_AUTORIDAD\",DT.\"NO_AP_AUTORIDAD\",DT.\"CL_AUTORIDAD\",\n"
                + "    DT.\"ID_NO_AFP\",DT.\"ES_AFILIADO_ESSALUD\",DT.\"LI_TIPO_TRABAJADOR\",DT.\"CA_TIPO_HORA_PAGO_REFEERENCIAL\",\n"
                + "    DT.\"ES_FACTOR_RH\",DT.\"LI_DI_DOM_A_D1\",\n"
                + "    DT.\"DI_DOM_A_D2\",DT.\"LI_DI_DOM_A_D3\",DT.\"DI_DOM_A_D4\",DT.\"LI_DI_DOM_A_D5\",DT.\"DI_DOM_A_D6\",DT.\"DI_DOM_A_REF\",DT.\"DI_DOM_A_DISTRITO\",DT.\"LI_DI_DOM_LEG_D1\",\n"
                + "    DT.\"DI_DOM_LEG_D2\",DT.\"LI_DI_DOM_LEG_D3\",\n"
                + "    DT.\"DI_DOM_LEG_D4\",DT.\"LI_DI_DOM_LEG_D5\",DT.\"DI_DOM_LEG_D6\",DT.\"DI_DOM_LEG_DISTRITO\",\n"
                + "    DT.\"CA_ING_QTA_CAT_EMPRESA\",DT.\"CA_ING_QTA_CAT_RUC\",DT.\"CA_ING_QTA_CAT_OTRAS_EMPRESAS\",\n"
                + "    DT.\"CM_OBSERVACIONES\",DT.\"US_CREACION\",  DT.\"FE_CREACION\",DT.\"US_MODIF\",DT.\"FE_MODIF\",DT.\"IP_USUARIO\",DT.\"ID_USUARIO_CREACION\",DT.\"ID_UNIVERSIDAD_CARRERA\",\n"
                + "    DT.\"ID_NACIONALIDAD\",DT.\"DISTRITO_NAC\",DT.\"NO_S_EDUCATIVA\",DT.\"AP_NOMBRES_MADRE\",DT.\"AP_NOMBRES_PADRE\",DT.\"ES_TRABAJA_UPEU_C\",DT.\"AP_NOMBRES_C\",DT.\"FE_NAC_C\",\n"
                + "    DT.\"ID_TIPO_DOC_C\",DT.\"NU_DOC_C\",DT.\"LI_INSCRIPCION_VIG_ESSALUD_C\",DT.\"ID_CONYUGUE\",DT.\"NO_CARRERA\",DT.\"NO_UNIVERSIDAD\",DT.\"AR_FOTO\",DT.\"DE_FOTO\",DT.\"ID_FOTO\",DT.\"NO_AR_FOTO\",DT.\"TA_AR_FOTO\",\n"
                + "    dpd.no_puesto ,dpd.no_seccion,dpd.no_area,dpd.id_direccion,dpd.no_dep,dpd.id_departamento ,\n"
                + "    dpd.id_area,dpd.id_seccion,c.id_puesto,e.id_empleado,c.fe_creacion AS fe_creacion_contrato, c.ca_sueldo,to_char(c.fe_desde, 'yyyy-mm-dd') as fe_desde,\n"
                + "    to_char(c.fe_hasta, 'yyyy-mm-dd') as fe_hasta,dt.ID_UNIVERSIDAD,dt.ID_TIPO_INSTITUCION,\n"
                + "    dt.CO_UNIVERSIDAD,dt.ID_CARRERA,dt.CO_NACIONALIDAD,dpd.NO_DIRECCION ";
        String query = "  FROM RHTD_EMPLEADO e,\n"
                + "    RHVD_TRABAJADOR dt ,\n"
                + "    RHTM_CONTRATO c ,\n"
                + "    RHVD_PUESTO_DIRECCION dpd"
                + "  WHERE dt.id_trabajador = c.id_trabajador\n"
                + "  AND e.id_trabajador    = c.id_trabajador\n"
                + "  AND dpd.id_puesto      = c.id_puesto\n"
                + "  AND c.es_contrato      =1  ";
        /*filters*/
        query += (!departamento.equals("")) ? " and dpd.ID_departamento='" + departamento + "' " : "";
        query += (!direccion.equals("")) ? " and dpd.id_direccion='" + direccion + "' " : "";
        query += (!area.equals("")) ? " and dpd.id_area='" + area + "' " : "";
        query += (!seccion.equals("")) ? " and dpd.id_seccion='" + seccion + "' " : "";
        /*end filters*/
        List<Object> obj = new ArrayList<Object>();
        try {
            ResultSet rs = this.conn.query(Sql.queryWithPagination(queryColumns + ", %s " + query + " %s", datatable.getPageNumber(), datatable.getPageSize(), "c.fe_creacion"));
            while (rs.next()) {
                V_List_Empleado v = new V_List_Empleado();
                v.setEs_inst_educ_peru(rs.getString("es_inst_educ_peru"));
                v.setCm_otros_estudios(rs.getString("cm_otros_estudios"));
                v.setEs_sexo(rs.getString("es_sexo"));
                v.setLi_grupo_sanguineo(rs.getString("li_grupo_sanguineo"));
                v.setDe_referencia(rs.getString("de_referencia"));
                v.setLi_religion(rs.getString("li_religion"));
                v.setNo_iglesia(rs.getString("no_iglesia"));
                v.setDe_cargo(rs.getString("de_cargo"));
                v.setLi_autoridad(rs.getString("li_autoridad"));
                v.setNo_ap_autoridad(rs.getString("no_ap_autoridad"));
                v.setCl_autoridad(rs.getString("cl_autoridad"));
                v.setId_no_afp(rs.getString("id_no_afp"));
                v.setEs_afiliado_essalud(rs.getString("es_afiliado_essalud"));
                v.setLi_tipo_trabajador(rs.getString("li_tipo_trabajador"));
                v.setCa_tipo_hora_pago_refeerencial(rs.getString("ca_tipo_hora_pago_refeerencial"));
                v.setEs_factor_rh(rs.getString("es_factor_rh"));
                v.setLi_di_dom_a_d1(rs.getString("li_di_dom_a_d1"));
                v.setDi_dom_a_d2(rs.getString("di_dom_a_d2"));
                v.setLi_di_dom_a_d3(rs.getString("li_di_dom_a_d3"));
                v.setDi_dom_a_d4(rs.getString("di_dom_a_d4"));
                v.setLi_di_dom_a_d5(rs.getString("li_di_dom_a_d5"));
                v.setDi_dom_a_d6(rs.getString("di_dom_a_d6"));
                v.setDi_dom_a_ref(rs.getString("di_dom_a_ref"));
                v.setDi_dom_a_distrito(rs.getString("di_dom_a_distrito"));
                v.setLi_di_dom_leg_d1(rs.getString("li_di_dom_leg_d1"));
                v.setDi_dom_leg_d2(rs.getString("di_dom_leg_d2"));
                v.setLi_di_dom_leg_d3(rs.getString("li_di_dom_leg_d3"));
                v.setDi_dom_leg_d4(rs.getString("di_dom_leg_d4"));
                v.setLi_di_dom_leg_d5(rs.getString("li_di_dom_leg_d5"));
                v.setDi_dom_leg_d6(rs.getString("di_dom_leg_d6"));
                v.setDi_dom_leg_distrito(rs.getString("di_dom_leg_distrito"));
                v.setCa_ing_qta_cat_empresa(rs.getString("ca_ing_qta_cat_empresa"));
                v.setCa_ing_qta_cat_ruc(rs.getString("ca_ing_qta_cat_ruc"));
                v.setCa_ing_qta_cat_otras_empresas(rs.getString("ca_ing_qta_cat_otras_empresas"));
                v.setCm_observaciones(rs.getString("cm_observaciones"));
                v.setUs_creacion(rs.getString("us_creacion"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setFe_modif(rs.getString("fe_modif"));
                v.setIp_usuario(rs.getString("ip_usuario"));
                v.setId_usuario_creacion(rs.getString("id_usuario_creacion"));
                v.setId_universidad_carrera(rs.getString("id_universidad_carrera"));
                v.setId_nacionalidad(rs.getString("id_nacionalidad"));
                v.setDistrito_nac(rs.getString("distrito_nac"));
                v.setNo_s_educativa(rs.getString("no_s_educativa"));
                v.setNo_carrera(rs.getString("no_carrera"));
                v.setNo_universidad(rs.getString("no_universidad"));
                v.setAr_foto(rs.getString("ar_foto"));
                v.setDe_foto(rs.getString("de_foto"));
                v.setId_foto(rs.getString("id_foto"));
                v.setNo_ar_foto(rs.getString("no_ar_foto"));
                v.setTa_ar_foto(rs.getString("ta_ar_foto"));
                v.setNo_puesto(rs.getString("no_puesto"));
                v.setNo_seccion(rs.getString("no_seccion"));
                v.setNo_area(rs.getString("no_area"));
                v.setId_direccion(rs.getString("id_direccion"));
                v.setNo_dep(rs.getString("no_dep"));
                v.setId_departamento(rs.getString("id_departamento"));
                v.setId_area(rs.getString("id_area"));
                v.setId_seccion(rs.getString("id_seccion"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setId_empleado(rs.getString("id_empleado"));
                v.setFe_creacion_contrato(rs.getString("fe_creacion_contrato"));
                v.setCa_sueldo(rs.getDouble("ca_sueldo"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setId_contrato(rs.getString("id_contrato"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setAp_paterno(rs.getString("ap_paterno"));
                v.setAp_materno(rs.getString("ap_materno"));
                v.setNo_trabajador(rs.getString("no_trabajador"));
                v.setTi_doc(rs.getString("ti_doc"));
                v.setNu_doc(rs.getString("nu_doc"));
                v.setEs_civil(rs.getString("es_civil"));
                v.setFe_nac(rs.getString("fe_nac"));
                v.setNo_nacionalidad(rs.getString("no_nacionalidad"));
                v.setNo_departamento(rs.getString("no_departamento"));
                v.setNo_provincia(rs.getString("no_provincia"));
                v.setNo_distrito(rs.getString("no_distrito"));
                v.setTe_trabajador(rs.getString("te_trabajador"));
                v.setCl_tra(rs.getString("cl_tra"));
                v.setDi_correo_personal(rs.getString("di_correo_personal"));
                v.setDi_correo_inst(rs.getString("di_correo_inst"));
                v.setCo_sistema_pensionario(rs.getString("co_sistema_pensionario"));
                v.setId_situacion_educativa(rs.getString("id_situacion_educativa"));
                v.setLi_reg_inst_educativa(rs.getString("li_reg_inst_educativa"));
                v.setNo_direccion(rs.getString("no_direccion"));
                v.setRow_number(rs.getInt("row_number"));
                obj.add(v);
            }
            ResultSet re = (this.conn.query("select count(1) " + query));
            if (re.next()) {
                Integer total = re.getInt(1);
                datatable.setRecordsTotal(total);
                datatable.setRecordsFiltered(total);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        datatable.setData(obj);
        return datatable;
    }

    @Override
    public List<V_List_Empleado> Listar_Emp() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_LIST_EMPLEADO order by ap_paterno ";
        List<V_List_Empleado> list = new ArrayList<V_List_Empleado>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_List_Empleado em = new V_List_Empleado();
                em.setFe_desde(rs.getString("fe_desde"));
                em.setFe_hasta(rs.getString("fe_hasta"));
                em.setNu_doc(rs.getString("nu_doc"));
                em.setId_contrato(rs.getString("id_contrato"));
                em.setId_trabajador(rs.getString("id_trabajador"));
                em.setAp_paterno(rs.getString("ap_paterno"));
                em.setAp_materno(rs.getString("ap_materno"));
                em.setNo_trabajador(rs.getString("no_trabajador"));
                em.setNo_puesto(rs.getString("no_puesto"));
                em.setNo_seccion(rs.getString("no_seccion"));
                em.setNo_area(rs.getString("no_area"));
                em.setId_direccion(rs.getString("id_direccion"));
                em.setNo_dep(rs.getString("no_dep"));
                em.setId_departamento(rs.getString("id_departamento"));
                em.setId_area(rs.getString("id_area"));
                em.setId_seccion(rs.getString("id_seccion"));
                em.setId_puesto(rs.getString("id_puesto"));
                em.setId_empleado(rs.getString("id_empleado"));
                em.setFe_creacion(rs.getString("fe_creacion"));
                em.setCa_sueldo(rs.getDouble("ca_sueldo"));
                list.add(em);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public void Insert_Evaluacion_Emp(String ID_EVALUACION_EMP, String ES_EVALUACION, String RE_EVALUACION, String ID_EMPLEADO) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement eva = this.conn.conex.prepareCall("{CALL RHSP_INSERT_EVALUACION_EMP( ?, ?, ?, ?)}");
            eva.setString(1, null);
            eva.setString(2, ES_EVALUACION);
            eva.setString(3, RE_EVALUACION);
            eva.setString(4, ID_EMPLEADO);
            eva.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public String ID_Empleado(String idtr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select ID_EMPLEADO from RHTD_EMPLEADO WHERE ID_TRABAJADOR='" + idtr + "'";
        String idemp = null;
        try {
            ResultSet rs = this.conn.query(sql);
            if (rs.next()) {
                idemp = rs.getString("ID_EMPLEADO");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return idemp;
    }

    @Override
    public String ES_Empleado(String idemp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select ES_EVALUACION FROM RHTD_EVALUACION_EMP WHERE ID_EMPLEADO='" + idemp + "' ";
        String es_eva = null;
        try {
            ResultSet rs = this.conn.query(sql);
            if (rs.next()) {
                es_eva = rs.getString("ES_EVALUACION");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return es_eva;
    }

    @Override
    public List<Evaluacion_Emp> Listar_Evaluacion_Emp(String id_emp) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHTD_EVALUACION_EMP WHERE ID_EMPLEADO = '" + id_emp + "'";
        List<Evaluacion_Emp> List = new ArrayList<Evaluacion_Emp>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Evaluacion_Emp eva = new Evaluacion_Emp();
                eva.setId_evaluacion_emp("id_evaluacion_emp");
                eva.setRe_evaluacion(rs.getString("re_evaluacion"));
                eva.setEs_evaluacion(rs.getString("es_evaluacion"));
                eva.setId_empleado("id_empleado");
                List.add(eva);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return List;

    }

    @Override
    public void Mod_Evaluacion_emp(String RE_EVALUACION, String ID_EMPLEADO) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_EVALUACION_EMP( ?, ?)}");
            cst.setString(1, RE_EVALUACION);
            cst.setString(2, ID_EMPLEADO);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<Empleado> id_empleadox_ide(String ide) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHTD_EMPLEADO WHERE ID_TRABAJADOR = '" + ide.trim() + "' and es_empleado='1'";
        List<Empleado> List = new ArrayList<Empleado>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Empleado eva = new Empleado();
                eva.setId_empleado("id_empleado");
                eva.setId_trabajador(rs.getString("id_trabajador"));
                eva.setCo_aps(rs.getString("co_aps"));
                eva.setCo_huella_digital(rs.getString("co_huella_digital"));
                eva.setEs_empleado("es_empleado");
                List.add(eva);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error: " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return List;
    }

    @Override
    public int val_cod_aps_empleado(String idtr) {
        int num_c = 0;
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select COUNT(CO_APS) from RHTD_EMPLEADO where ID_TRABAJADOR='" + idtr + "' AND co_aps is not null";
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            num_c = rs.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al validar codigo aps");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return num_c;
    }

    @Override
    public boolean Reg_aps(String idtr, int aps) {
        boolean x = false;
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_APS( ?, ?)}");
            cst.setString(1, idtr);
            cst.setInt(2, aps);
            cst.execute();
            x = true;
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al registrar codigo APS");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;
    }

    @Override
    public void Reg_cod_huella(String idtr, int cod_huella) {
        CallableStatement cst;
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            cst = conn.conex.prepareCall("{CALL RHSP_MOD_COD_HUELLA( ?, ?)}");
            cst.setString(1, idtr.trim());
            cst.setInt(2, cod_huella);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al registrar codigo APS");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public int val_cod_huella(String idtr) {
        int num_c = 0;
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select COUNT(CO_HUELLA_DIGITAL) from RHTD_EMPLEADO where ID_TRABAJADOR='" + idtr + "' AND CO_HUELLA_DIGITAL is not null";
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            num_c = rs.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al validar codigo aps");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return num_c;
    }

    @Override
    public int val_aps(String co_aps) {
        int cant = 0;
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT COUNT (*) FROM RHTD_EMPLEADO WHERE CO_APS = '" + co_aps + "' ";
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            cant = rs.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al validar codigo aps");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return cant;
    }

    @Override
    public int val_huella(String co_hue) {
        int cant = 0;
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT COUNT (*) FROM RHTD_EMPLEADO WHERE CO_HUELLA_DIGITAL = '" + co_hue + "' ";
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            cant = rs.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error al validar codigo huella" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return cant;
    }

    @Override
    public List<Map<String, ?>> List_co_huella(String idtr) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select id_empleado,id_trabajador,CO_HUELLA_DIGITAL  from rhtd_empleado where id_trabajador='" + idtr + "'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("ide", rs.getString("id_empleado"));
                rec.put("idtr", rs.getString("id_trabajador"));
                rec.put("codigo_huella", rs.getString("CO_HUELLA_DIGITAL"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;

    }

    @Override
    public List<Map<String, ?>> List_co_aps(String idtr) {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select id_empleado,id_trabajador,co_aps  from rhtd_empleado where id_trabajador='" + idtr + "'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("ide", rs.getString("id_empleado"));
                rec.put("idtr", rs.getString("id_trabajador"));
                rec.put("aps", rs.getString("co_aps"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;

    }

    @Override
    public List<Map<String, ?>> getAllEmployeesWithOutUserAccount() {
        List<Map<String, ?>> Lista = new ArrayList<Map<String, ?>>();
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT e.id_empleado,e.id_trabajador,e.ES_EMPLEADO,t.NO_TRABAJADOR,t.AP_PATERNO,t.AP_MATERNO FROM rhtd_empleado e , rhtm_trabajador t where  t.ID_TRABAJADOR = e.ID_TRABAJADOR and  e.id_empleado not in (select id_empleado from rhtc_usuario) and e.ES_EMPLEADO='1'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("idEmpleado", rs.getString("id_empleado"));
                rec.put("fullnameEmployee", rs.getString("no_trabajador") + " " + rs.getString("ap_paterno") + " " + rs.getString("ap_materno"));
                Lista.add(rec);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("Error!" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return Lista;

    }

}
